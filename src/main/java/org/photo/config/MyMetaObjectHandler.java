package org.photo.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.photo.util.StringUtils;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * @program: our-task
 * @description: 对数据库每条记录的创建时间和更新时间自动进行填充
 * @author: water76016
 * @create: 2020-11-24 10:53
 **/
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    /**
     * 插入时的填充策略
     * @param metaObject
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        //TODO（此处没生效）
        if (StringUtils.isNotEmpty(metaObject.findProperty("createTime",false))
                && "java.time.LocalDateTime".equals(metaObject.getGetterType("createTime").getName())){
            this.setFieldValByName("createTime", LocalDateTime.now(), metaObject);
        }
        if (StringUtils.isNotEmpty(metaObject.findProperty("updateTime",false))
                && "java.time.LocalDateTime".equals(metaObject.getGetterType("updateTime").getName())){
            this.setFieldValByName("updateTime", LocalDateTime.now(), metaObject);
        }
        if (StringUtils.isNotEmpty(metaObject.findProperty("createTime",false))
                && "java.util.Date".equals(metaObject.getGetterType("createTime").getName())){
            this.setFieldValByName("createTime", new Date(), metaObject);
        }
        if (StringUtils.isNotEmpty(metaObject.findProperty("updateTime",false))
                && "java.util.Date".equals(metaObject.getGetterType("updateTime").getName())){
            this.setFieldValByName("updateTime", new Date(), metaObject);
        }
    }

    /**
     * 更新时的填充策略
     * @param metaObject
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        if (StringUtils.isNotEmpty(metaObject.findProperty("updateTime",false))
                && "java.time.LocalDateTime".equals(metaObject.getGetterType("updateTime").getName())){
            this.setFieldValByName("updateTime", LocalDateTime.now(), metaObject);
        }
        if (StringUtils.isNotEmpty(metaObject.findProperty("updateTime",false))
                && "java.util.Date".equals(metaObject.getGetterType("updateTime").getName())){
            this.setFieldValByName("updateTime", new Date(), metaObject);
        }
    }
}
