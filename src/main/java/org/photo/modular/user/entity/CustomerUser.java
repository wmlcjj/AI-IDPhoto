package org.photo.modular.user.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * @Description: 客户
 * @Author: jeecg-boot
 * @Date:   2022-10-01
 * @Version: V1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("customer_user")
public class CustomerUser implements Serializable {
    private static final long serialVersionUID = 1L;

	/**主键id*/
	@TableId(type = IdType.ASSIGN_ID)
    private String id;
	/**登录账号*/
    private String username;
	/**真实姓名*/
    private String realname;
	/**密码*/
    private String password;
	/**md5密码盐*/
    private String salt;
	/**头像*/
    private String avatar;
	/**生日*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date birthday;
	/**性别(0-默认未知,1-男,2-女)*/
    private Integer sex;
	/**电子邮件*/
    private String email;
	/**电话*/
    private String phone;
	/**冻结状态(1-正常,2-冻结)*/
    private Integer status;
	/**1-客户，2-合作方，3-游客，4-员工*/
    private Integer type;
	/**城市*/
    private String city;
	/**省份*/
    private String province;
	/**国家*/
    private String country;
	/**语言*/
    private String language;
	/**备注*/
    private String remarks;
	/**用户来源1-手动新增，2-微信公众号,3-微信小程序*/
    private Integer source;
	/**openid*/
    private String openid;
	/**unionid*/
    private String unionid;
	/**用户微信号*/
    private String wxNum;
	/**添加微信号说明*/
    private String wxNumRemark;
	/**APP openid*/
    private String appOpenid;
	/**x小程序 openid*/
    private String xcxOpenid;
	/**渠道*/
    private String channelId;
	/**微信昵称*/
    private String wxNickName;
	/**微信头像*/
    private String wxHeadImgUrl;
	/**创建人*/
    private String createBy;
	/**创建时间*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
	/**更新人*/
    private String updateBy;
	/**更新时间*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    /**删除状态(0-正常,1-已删除)*/
    @TableLogic
    private Integer isDeleted;
}
