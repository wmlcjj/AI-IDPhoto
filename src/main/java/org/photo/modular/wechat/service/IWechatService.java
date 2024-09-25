package org.photo.modular.wechat.service;

import org.photo.modular.user.dto.WechatUserInfoDto;
import org.photo.modular.user.vo.CustomerUserVo;
import org.photo.modular.wechat.params.LoginH5Params;
import org.photo.modular.wechat.params.LoginXcxParams;

/**
 * 微信相关服务
 */
public interface IWechatService {

    CustomerUserVo loginXcx(LoginXcxParams params);
    CustomerUserVo loginH5(LoginH5Params params);

}
