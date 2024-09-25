package org.photo.modular.user.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description: accessToken
 * @Author: chenjiajun
 * @Date:   2022-10-01
 * @Version: V1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class WechatUserInfoDto {

	private String appId;

	private String unionid;

	private String openid;

	private String nickname;

	private Integer sex;

	private String province;

	private String city;

	private String country;

	private String headimgurl;

	private String language;

	private String code;

	//用户来源1-手动新增，2-微信公众号,3-微信小程序
	private Integer source;

	//应用类型：1-手动新增，2-微信公众号,3-微信小程序
	private Integer appType;
}
