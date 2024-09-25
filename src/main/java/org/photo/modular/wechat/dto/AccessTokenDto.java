package org.photo.modular.wechat.dto;

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
public class AccessTokenDto {

	String access_token;
	Integer expires_in;
	String refresh_token;
	String openid;
	String scope;
}
