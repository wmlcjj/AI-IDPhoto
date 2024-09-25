package org.photo.modular.user.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.photo.modular.user.entity.CustomerUser;
import org.photo.modular.user.mapper.CustomerUserMapper;
import org.photo.modular.user.service.ICustomerUserService;
import org.springframework.stereotype.Service;


@Service
public class CustomerUserServiceImpl extends ServiceImpl<CustomerUserMapper, CustomerUser> implements ICustomerUserService {

}
