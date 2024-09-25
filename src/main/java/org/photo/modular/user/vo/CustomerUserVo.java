package org.photo.modular.user.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 客户
 */
@Data
public class CustomerUserVo {

	/**主键id*/
    private String id;
	/**登录账号*/
    private String username;
	/**真实姓名*/
    private String realname;
    private String avatar;
    private LocalDate birthday;
    private Integer sex;
    private String email;
	/**1-客户，2-合作方，3-游客，4-员工*/
    private Integer type;
	/**城市*/
    private String city;
	/**省份*/
    private String province;
	/**国家*/
    private String country;
	/**语言*/
	/**openid*/
    private String openid;
    /**x小程序 openid*/
    private String xcxOpenid;
	/**unionid*/
    private String unionid;
	/**用户微信号*/
    private String wxNum;
	/**微信昵称*/
    private String wxNickName;
	/**微信头像*/
    private String wxHeadImgUrl;
    /**是否填写手机号*/
    private Boolean isBindPhone;
    /**是否填写实名内容*/
    private Boolean isBindRealName;
    //头像或昵称是否为空
    private Integer isExtendNull;

    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

}
