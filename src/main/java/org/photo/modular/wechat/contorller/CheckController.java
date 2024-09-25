package org.photo.modular.wechat.contorller;

import cn.dev33.satoken.stp.StpUtil;
import lombok.extern.slf4j.Slf4j;
import org.photo.modular.business.model.vo.WxLoginVo;
import org.photo.modular.user.vo.CustomerUserVo;
import org.photo.util.R;
import org.photo.util.ServletUtils;
import org.photo.modular.wechat.params.LoginH5Params;
import org.photo.modular.wechat.params.LoginXcxParams;
import org.photo.modular.wechat.service.IWechatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;


/**
 * @author qb
 * @version 1.0
 * @Description  微信公众号授权及消息推送相关接口
 * @date 2020/9/24 11:08
 */
@Slf4j
@RestController
@RequestMapping("/")
public class CheckController {


    /**
     * 微信公众号授权本地校验
     */
    @GetMapping(value = "/MP_verify_5pwTWD7zRSautQZr.txt")
    public String MP_verify_5YHbaFuvibDm7jBA(HttpServletResponse response){
        return "5pwTWD7zRSautQZr";
    }


}
