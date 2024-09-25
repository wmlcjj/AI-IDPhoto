package org.photo.modular.business.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.photo.modular.business.dao.ItemDao;
import org.photo.modular.business.model.entity.Custom;
import org.photo.modular.business.model.entity.Item;
import org.photo.modular.business.service.CustomService;
import org.photo.modular.business.service.ItemService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


@Service
public class ItemServiceImpl extends ServiceImpl<ItemDao,Item> implements ItemService {

    @Autowired
    private CustomService customService;

    @Override
    public <T> List<T> itemList(int pageNum, int pageSize, int type, String userId,String name) {

        if(type==4){
            Page<Custom> page = new Page<>(pageNum, pageSize);
            QueryWrapper<Custom> qw = new QueryWrapper<>();
            qw.eq("user_id",userId);
            if(name!=null && !name.equals("")){
                qw.like("name",name);
            }
            Page<Custom> page2 = customService.page(page, qw);
            return (List<T>) page2.getRecords();
        }


        Page<Item> page = new Page<>(pageNum, pageSize);
        QueryWrapper<Item> qw = new QueryWrapper<>();
        if(name!=null && !name.equals("")){
            qw.like("name",name);
        }else {
            qw.eq("category",type);
        }
        Page<Item> page2 = baseMapper.selectPage(page, qw);
        return (List<T>) page2.getRecords();



    }
}
