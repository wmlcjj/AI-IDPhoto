package org.photo.modular.business.dao;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.photo.modular.business.model.entity.Photo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PhotoDao extends BaseMapper<Photo> {



}
