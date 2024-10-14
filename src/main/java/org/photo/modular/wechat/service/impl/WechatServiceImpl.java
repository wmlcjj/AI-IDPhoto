package org.photo.modular.wechat.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.photo.exception.BizException;
import org.photo.modular.sys.entity.SysApp;
import org.photo.modular.sys.service.ISysAppService;
import org.photo.modular.user.dto.WechatUserInfoDto;
import org.photo.modular.user.entity.CustomerUser;
import org.photo.modular.user.entity.WechatUser;
import org.photo.modular.user.service.ICustomerUserService;
import org.photo.modular.user.service.IWechatUserService;
import org.photo.modular.user.vo.CustomerUserVo;
import org.photo.modular.wechat.dto.AccessTokenDto;
import org.photo.modular.wechat.params.LoginH5Params;
import org.photo.modular.wechat.params.LoginXcxParams;
import org.photo.modular.wechat.service.IWechatService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import java.util.Objects;

/**
 * @Description: wechat_user
 * @Author: jeecg-boot
 * @Date:   2022-10-04
 * @Version: V1.0
 */
@Slf4j
@Service
public class WechatServiceImpl implements IWechatService {

    @Autowired
    private ICustomerUserService customerUserService;
    @Autowired
    private IWechatUserService wechatUserService;
    @Autowired
    private ISysAppService sysAppService;

    //静默授权
    private static String SNSAPI_BASE  = "snsapi_base";
    //完整授权
    private static String SNSAPI_USERINFO  = "snsapi_userinfo";

    private static final String XCX_JSCODE2SESSION_URI = "https://api.weixin.qq.com/sns/jscode2session";
    private static final String H5_TOKEN_URI = "https://api.weixin.qq.com/sns/oauth2/access_token";
    private static final String H5_USERINFO_URI = "https://api.weixin.qq.com/sns/userinfo";

    @Override
    public CustomerUserVo loginXcx(LoginXcxParams params) {
        LambdaQueryWrapper<SysApp> queryWrapper = new LambdaQueryWrapper<>();
        SysApp app = sysAppService.getOne(queryWrapper.eq(SysApp::getAppId,params.getAppId()));
        //发起登录请求
        String url = XCX_JSCODE2SESSION_URI + "?appid="+app.getAppId()
                +"&secret="+app.getAppSecret()+"&js_code=" + params.getCode() + "&grant_type=authorization_code";
        String content = HttpUtil.get(url, 10000);
        //格式化微信官方返回
        JSONObject jsonopenid = JSONObject.parseObject(content);
        String openid = jsonopenid.getString("openid");
        String unionid = jsonopenid.getString("unionid");
        WechatUserInfoDto dto = new WechatUserInfoDto();
        BeanUtils.copyProperties(params, dto);
        dto.setOpenid(openid);
        dto.setUnionid(unionid);
        dto.setAppType(app.getAppType());
        dto.setSource(3);
        //校验用户是否存在
        LambdaQueryWrapper<CustomerUser> userWrapper = new LambdaQueryWrapper<CustomerUser>()
                .eq(CustomerUser::getXcxOpenid, openid)
                .eq(CustomerUser::getStatus, 1);
        CustomerUser customerUser = customerUserService.getOne(userWrapper);
        //如果用户不存在，则新增
        CustomerUserVo user = new CustomerUserVo();
        if (ObjectUtil.isEmpty(customerUser)){
            user = saveOrUpdateCustomerUser(customerUser,dto);
        }else {
            BeanUtils.copyProperties(customerUser, user);
        }
        //判断头像或昵称是否为空
        if (ObjectUtil.isEmpty(user.getWxNickName()) || ObjectUtil.isEmpty(user.getAvatar())){
            user.setIsExtendNull(1);
        }
        return user;
    }

    @Override
    public CustomerUserVo loginH5(LoginH5Params params) {
        log.info("authGateway获取wxCode:code={}，state={}，appid={}，jumpUrl={}", params.getCode(), params.getState(), params.getAppId(), params.getJumpUrl());
        //appid和secret应该优先去redis里获取，如果获取不到再去数据库里获取（待优化）
//        String secret = redisUtil.get("key:wchat:appid:"+appId);


        //带参get请求，把参数拼接再url后
        LambdaQueryWrapper<SysApp> queryWrapper = new LambdaQueryWrapper<>();
        SysApp app = sysAppService.getOne(queryWrapper.eq(SysApp::getAppId,params.getAppId()));
        String urlString = H5_TOKEN_URI+"?appid="+app.getAppId()+"&secret="+app.getAppSecret()+"&code="+params.getCode()+"&grant_type=authorization_code";
        String result =  HttpUtil.get(urlString, 10000);
//        String result = "{\"access_token\":\"ACCESS_TOKEN\",\"expires_in\":7200,\"refresh_token\":\"REFRESH_TOKEN\",\"openid\":\"OPENID\",\"scope\":\"snsapi_userinfo\"}";
        log.info("返回的access_token对象: {}",result);
        AccessTokenDto accessTokenDto = JSONObject.parseObject(result, AccessTokenDto.class);
        if (StringUtils.isEmpty(accessTokenDto.getAccess_token())){
            throw new BizException("获取AccessToken失败");
        }

        CustomerUserVo user = new CustomerUserVo();

        //校验用户是否存在
        LambdaQueryWrapper<CustomerUser> userWrapper = new LambdaQueryWrapper<CustomerUser>()
                .eq(CustomerUser::getOpenid, accessTokenDto.getOpenid())
                .eq(CustomerUser::getStatus, 1);
        CustomerUser customerUser = customerUserService.getOne(userWrapper);
        if (SNSAPI_BASE.equals(accessTokenDto.getScope()) && ObjectUtil.isNotEmpty(customerUser)){
            //静默授权
            BeanUtils.copyProperties(customerUser, user);
        }else if (SNSAPI_USERINFO.equals(accessTokenDto.getScope())){
            //完整授权
            String accessToken = accessTokenDto.getAccess_token();
            String openId = accessTokenDto.getOpenid();
            if (!StringUtils.isEmpty(accessToken)){
                String userinfoUrl = H5_USERINFO_URI + "?access_token="+accessToken+"&openid="+openId+"&lang=zh_CN";
                String userInfo =  HttpUtil.get(userinfoUrl);
                //微信默认编码ISO-8859-1，需要转换
//                userInfo = new String(userInfo.getBytes("ISO-8859-1"), "UTF-8");
                WechatUserInfoDto dto = JSONObject.parseObject(userInfo, WechatUserInfoDto.class);
                dto.setAppId(app.getAppId());
                dto.setAppType(2);
                dto.setSource(2);
                //查库
                user = saveOrUpdateCustomerUser(customerUser,dto);
            }
        }
        //判断头像或昵称是否为空
        if (ObjectUtil.isEmpty(user.getWxHeadImgUrl()) || ObjectUtil.isEmpty(user.getAvatar())){
            user.setIsExtendNull(1);
        }
        return user;
    }


    /**
     * 如果没有则插入，有就更新
     * @param customerUser
     * @return
     */
    private CustomerUserVo saveOrUpdateCustomerUser(CustomerUser customerUser,WechatUserInfoDto dto){
        CustomerUserVo customerUserVo = null;
        //如果openid查不到，再用unionid查询一次
        if (ObjectUtil.isEmpty(customerUser) && !StringUtils.isEmpty(dto.getUnionid())){
            //校验用户是否存在
            LambdaQueryWrapper<CustomerUser> userWrapper = new LambdaQueryWrapper<CustomerUser>()
                    .eq(CustomerUser::getUnionid, dto.getUnionid())
                    .eq(CustomerUser::getStatus, 1);
            customerUser = customerUserService.getOne(userWrapper);
        }
        //新增入库
        if (ObjectUtils.isEmpty(customerUser)){
            customerUser = new CustomerUser();
            customerUser.setUnionid(dto.getUnionid());
            customerUser.setType(1);
            customerUser.setSource(dto.getSource());
        }
        if (Objects.equals(dto.getAppType(),2)){
            customerUser.setOpenid(dto.getOpenid());
        }else if (Objects.equals(dto.getAppType(),3)){
            customerUser.setXcxOpenid(dto.getOpenid());
        }
        customerUser.setSex(dto.getSex());
        customerUser.setLanguage(dto.getLanguage());
        customerUser.setCountry(dto.getCountry());
        customerUser.setProvince(dto.getProvince());
        customerUser.setCity(dto.getCity());
        customerUser.setWxHeadImgUrl(dto.getHeadimgurl());
        customerUser.setAvatar(dto.getHeadimgurl());
        customerUser.setWxNickName(dto.getNickname());
        Boolean isSave = customerUserService.saveOrUpdate(customerUser);
        //多服务号中间表
        if (isSave){
            WechatUser wechatUser = wechatUserService.getOne(new QueryWrapper<WechatUser>()
                    .eq("user_id",customerUser.getId())
                    .eq("app_id",dto.getAppId()));
            if (ObjectUtils.isEmpty(wechatUser)){
                wechatUser = new WechatUser();
                wechatUser.setUserId(customerUser.getId());
                wechatUser.setUnionid(customerUser.getUnionid());
                wechatUser.setOpenid(dto.getOpenid());
                wechatUser.setAppId(dto.getAppId());
                wechatUser.setAppType(dto.getAppType());
                wechatUserService.save(wechatUser);
            }
        }
        customerUserVo = new CustomerUserVo();
        BeanUtils.copyProperties(customerUser,customerUserVo);
        return customerUserVo;
    }
}
