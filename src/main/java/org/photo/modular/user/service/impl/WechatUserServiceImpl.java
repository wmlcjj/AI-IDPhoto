package org.photo.modular.user.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.photo.modular.user.entity.WechatUser;
import org.photo.modular.user.mapper.WechatUserMapper;
import org.photo.modular.user.service.IWechatUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description: wechat_user
 * @Author: jeecg-boot
 * @Date:   2022-10-04
 * @Version: V1.0
 */
@Slf4j
@Service
public class WechatUserServiceImpl extends ServiceImpl<WechatUserMapper, WechatUser> implements IWechatUserService {

    @Autowired
    private WechatUserMapper wechatUserMapper;
}
