package org.photo.modular.business.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.photo.modular.business.dao.CustomDao;
import org.photo.modular.business.model.entity.Custom;
import org.photo.modular.business.service.CustomService;
import org.springframework.stereotype.Service;


@Service
public class CustomServiceImpl extends ServiceImpl<CustomDao,Custom> implements CustomService {


}
