package org.photo.modular.business.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.photo.modular.business.model.entity.Photo;

import java.util.List;

public interface PhotoService extends IService<Photo> {

    List<Photo> photoList(int pageNum, int pageSize,String userId);

}
