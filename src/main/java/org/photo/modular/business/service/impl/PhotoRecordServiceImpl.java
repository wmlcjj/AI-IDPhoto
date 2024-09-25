package org.photo.modular.business.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.photo.modular.business.dao.PhotoRecordDao;
import org.photo.modular.business.model.entity.PhotoRecord;
import org.photo.modular.business.service.PhotoRecordService;
import org.springframework.stereotype.Service;


@Service
public class PhotoRecordServiceImpl extends ServiceImpl<PhotoRecordDao,PhotoRecord> implements PhotoRecordService {


}
