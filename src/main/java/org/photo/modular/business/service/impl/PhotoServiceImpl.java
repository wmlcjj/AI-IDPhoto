package org.photo.modular.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.photo.modular.business.dao.PhotoDao;
import org.photo.modular.business.model.entity.Photo;
import org.photo.modular.business.service.PhotoService;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class PhotoServiceImpl extends ServiceImpl<PhotoDao,Photo> implements PhotoService {


    @Override
    public List<Photo> photoList(int pageNum, int pageSize, String userId) {
        Page<Photo> page = new Page<>(pageNum, pageSize);
        QueryWrapper<Photo> qw = new QueryWrapper<>();
        qw.select("id","name","n_img","size","create_time");
        qw.eq("user_id",userId);
        qw.isNotNull("n_img");
        qw.orderByDesc("create_time");
        Page<Photo> photoPage = baseMapper.selectPage(page, qw);
        return photoPage.getRecords();
    }
}
