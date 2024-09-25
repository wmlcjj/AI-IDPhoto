package org.photo.modular.user.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @Description: wechat_user
 * @Author: jeecg-boot
 * @Date:   2022-10-04
 * @Version: V1.0
 */
@Data
@TableName("wechat_user")
@Accessors(chain = true)
@EqualsAndHashCode(callSuper = false)
public class WechatUser implements Serializable {
    private static final long serialVersionUID = 1L;

	/**id*/
	@TableId(type = IdType.ASSIGN_ID)
    private String id;
	/**关联用户ID*/
    private String userId;
	/**openid*/
    private String openid;
	/**unionid*/
    private String unionid;
	/**公众号appId*/
    private String appId;
    //应用类型：1-手动新增，2-微信公众号,3-微信小程序
    private Integer appType;
	/**创建人*/
    private String createBy;
	/**创建日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
	/**更新人*/
    private String updateBy;
	/**更新日期*/
	@JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;
	/**所属部门*/
    private String sysOrgCode;
}
