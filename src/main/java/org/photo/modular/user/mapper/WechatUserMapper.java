package org.photo.modular.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.photo.modular.user.entity.WechatUser;
import org.springframework.stereotype.Component;

/**
 * @Description: wechat_user
 * @Author: jeecg-boot
 * @Date:   2022-10-04
 * @Version: V1.0
 */
@Component
@Mapper
public interface WechatUserMapper extends BaseMapper<WechatUser> {


}
