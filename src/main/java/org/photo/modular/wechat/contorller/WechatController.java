package org.photo.modular.wechat.contorller;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.photo.modular.business.model.vo.WxLoginVo;
import org.photo.modular.sys.service.ISysAppService;
import org.photo.modular.user.dto.WechatUserInfoDto;
import org.photo.modular.user.entity.CustomerUser;
import org.photo.modular.user.entity.WechatUser;
import org.photo.modular.user.service.ICustomerUserService;
import org.photo.modular.user.service.IWechatUserService;
import org.photo.modular.user.vo.CustomerUserVo;
import org.photo.util.R;
import org.photo.util.ServletUtils;
import org.photo.modular.wechat.params.LoginH5Params;
import org.photo.modular.wechat.params.LoginXcxParams;
import org.photo.modular.wechat.service.IWechatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;


/**
 * @author qb
 * @version 1.0
 * @Description  微信公众号授权及消息推送相关接口
 * @date 2020/9/24 11:08
 */
@Slf4j
@RestController
@RequestMapping("/wechat")
public class WechatController {

    private static String REDIS_STATE  = "auth";

    /**
     * 微信网页授权失效 4001
     */
    Integer WECHAT_WEB_AUTH_INVALID=401;
//
//    @Autowired
//    private ICustomerUserService customerUserService;
    @Autowired
    private IWechatService wechatService;

    /**
     * 微信小程序登陆
     * @param params 用户信息
     */
    @PostMapping("/xcx/login")
    public R xcxLogin(@RequestBody LoginXcxParams params){
        WxLoginVo wxlogin = null;
        try {
            CustomerUserVo user = wechatService.loginXcx(params);
            //saToken登陆
            StpUtil.login(user.getId());
            //封装信息返回前端
            wxlogin = new WxLoginVo();
            wxlogin.setToken(StpUtil.getTokenInfo().getTokenValue());
            wxlogin.setIsExtendNull(user.getIsExtendNull());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return R.ok(wxlogin);
    }

//
//    /**
//     * 微信公众号授权url
//     * @param appId 公众号appiId
//     * @param authType 授权类型，默认1-完整授权，2-静默授权（只拿到openid）
//     * @param jumpUrl 最终跳转的url
//     * @throws IOException
//     */
//    @RequestMapping(value = "/authorize")
//    public void authorize(@RequestParam String appId
//            , @RequestParam(value = "authType",required = false) Integer authType
//            , @RequestParam String jumpUrl) throws IOException {
//        log.error(REDIRECTURI);
//        String uri = CODE_URI;
//
//        //授权类型，默认1-完整授权，2-静默授权（只拿到openid）
//        String scope = !ObjectUtils.isEmpty(authType) && authType == 2 ? SNSAPI_BASE : SNSAPI_USERINFO;
//
//        //拼接上跳转的url，由前端传值（一般是网址并且URLEncode作为参数，防止参数被重定向接口识别给截取了）
//        String redirectUri = REDIRECTURI + "?" + "appid="+ appId
//                + "&jumpUrl="+ URLEncoder.encode( jumpUrl,"UTF-8");
//        //微信官方需要整体再URLEncode一次
//        redirectUri = URLEncoder.encode(redirectUri,"UTF-8");
//
//        String params = "appid="+ appId
//                +"&redirect_uri="+ redirectUri
//                +"&response_type=code"
//                +"&scope="+ scope
//                +"&state="+ REDIS_STATE
//                +"#wechat_redirect";
//        //微信获取code
//        String redirectUrl = uri+"?"+params;
//        log.info("微信获取code地址"+redirectUrl);
//        ServletUtils.getResponse().sendRedirect(redirectUrl);
//
//    }

    /**
     * 获取微信openid
     * @param code
     * @param state
     * @throws Exception
     */
    @GetMapping(value = "/h5/login")
    public void h5Login(@RequestParam String code
            ,@RequestParam String state
            ,@RequestParam String appid
            ,@RequestParam String jumpUrl
                        ) throws Exception {
        LoginH5Params params = new LoginH5Params();
        params.setAppId(appid);
        params.setCode(code);
        params.setJumpUrl(jumpUrl);
        CustomerUserVo user = wechatService.loginH5(params);

        //默认返回失效代码，如果最后获取到值，则重新赋值
        String redirectUri = params.getJumpUrl()+ (params.getJumpUrl().contains("?") ? "&" : "?") +"state="+ WECHAT_WEB_AUTH_INVALID;
        //直接更新token数据
        if (ObjectUtil.isNotEmpty(user) && ObjectUtil.isNotEmpty(user.getId())){
            StpUtil.login(user.getId());
            String token = StpUtil.getTokenInfo().getTokenValue();
            //赋值跳转正常
            redirectUri = jumpUrl + (jumpUrl.contains("?") ? "&" : "?") + "token=" +token + "&isExtendNull=" + user.getIsExtendNull();
        }else {
            redirectUri = jumpUrl + (jumpUrl.contains("?") ? "&" : "?") + "isExtendNull=" + user.getIsExtendNull();
        }
        log.info("重定向地址："+ redirectUri);
        ServletUtils.getResponse().sendRedirect(redirectUri);
    }


//
//    /**
//     * 检查openid和cookie是否存在
//     * @param
//     * @param
//     * @return
//     */
//    @RequestMapping(value = "/checkCookieAndOpenId")
//    public Result checkCookieAndOpenId(){
//        String wxCookie = wechatCookieUtils.getCookieStr();
//        log.info("检查获取的wxCookie："+wxCookie);
//        if(StrUtil.hasEmpty(wxCookie)){
//            String uuidCookie = IdUtil.simpleUUID();
//            Cookie cookie = new Cookie("wx-cookie", uuidCookie);
//            //设置cookie域名
////            cookie.setDomain(COOKIE_DOMAIN);
//            //设置什么方法使用，  / 所有方法
//            cookie.setPath("/");
////            cookie.setMaxAge(EXPIRES_SECOND);
//            ServletUtils.getResponse().setHeader("wx-cookie",cookie.getValue());
//            ServletUtils.getResponse().addCookie(cookie);
//            log.info(" 生成的Cookie: "+cookie.getValue());
//            wxCookie = cookie.getValue();
//        }
//        String redisValue = ObjectUtils.isEmpty(redisUtil.get(wxCookie)) ? null : redisUtil.get(wxCookie).toString();
//        log.error("获取redis中的缓存的openid："+redisValue);
//        if(!StrUtil.hasEmpty(redisValue)){
////            redisUtil.expire(wxCookie,EXPIRES_SECOND);
//            return Result.OK("获取openId成功!");
//        }
//        return Result.error(CommonConstant.WECHAT_WEB_AUTH_INVALID,"获取openId失败!");
//    }

}
