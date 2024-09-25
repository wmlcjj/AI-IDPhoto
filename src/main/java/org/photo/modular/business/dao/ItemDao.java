package org.photo.modular.business.dao;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.photo.modular.business.model.entity.Item;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ItemDao extends BaseMapper<Item> {



}
