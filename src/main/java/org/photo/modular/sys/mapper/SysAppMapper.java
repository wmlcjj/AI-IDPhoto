package org.photo.modular.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.photo.modular.sys.entity.SysApp;

/**
 * (SysApp)表数据库访问层
 *
 * @author bob
 * @since 2021-04-13 15:37:46
 */
@Mapper
public interface SysAppMapper extends BaseMapper<SysApp> {
}
