package org.photo.modular.sys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 应用信息实体类
 *
 * @author chenjiajun
 * @since 2024-02-13 15:37:46
 */
@Data
public class SysApp implements Serializable {
    private static final long serialVersionUID = -35142937477811308L;


    @TableId(type = IdType.AUTO)
    /**
     * 主键ID
     */
    private Integer id;

    /**
     * 拥有者名称
     */
    private String ownerName;

    /**
     * 拥有者手机号
     */
    private String ownerPhone;

    /**
     * 拥有者主体名称
     */
    private String ownerCompany;

    /**
     * 拥有者主体社会信用代码
     */
    private String ownerCompanyCode;

    /**
     * 应用名称
     */
    private String appName;

    /**
     * 应用类型：1-手动新增，2-微信公众号,3-微信小程序
     */
    private Integer appType;

    /**
     * 应用id
     */
    private String appId;
    /**
     * 应用密钥
     */
    private String appSecret;

    /**
     * 租户编号
     */
    private String tenantCode;

    /**
     * 创建者
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Date createTime;

}
