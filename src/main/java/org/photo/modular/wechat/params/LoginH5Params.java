package org.photo.modular.wechat.params;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description: 小程序登陆参数
 * @Author: chenjiajun
 * @Date:   2022-10-01
 * @Version: V1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginH5Params {

	private String appId;

	private String code;

	private String state;

	private String jumpUrl;

	private String nickname;

	private Integer sex;

	private String province;

	private String city;

	private String country;

	private String headimgurl;

	private String unionid;

	private String language;

}
