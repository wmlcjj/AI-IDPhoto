package org.photo.modular.business.dao;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;
import org.photo.modular.business.model.entity.WebSet;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WebSetDao extends BaseMapper<WebSet> {


    @Select("SELECT download_one,download_two,video_unit_id FROM web_set LIMIT 1")
    WebSet getWeb();


}
