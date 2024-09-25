package org.photo.modular.business.controller;
import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.web.bind.annotation.*;
import org.photo.modular.business.model.entity.Custom;
import org.photo.modular.business.model.entity.Photo;
import org.photo.modular.business.service.CustomService;
import org.photo.modular.business.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.photo.modular.business.service.PhotoService;
import org.photo.util.R;

import java.util.Date;
import java.util.List;
import java.util.Random;

@RestController
@RequestMapping("/item")
public class ItemController {


    @Autowired
    private ItemService itemService;
    @Autowired
    private CustomService customService;
    @Autowired
    private PhotoService photoService;


    //保存用户自定义
    @PostMapping("/saveCustom")
    public R saveCustom(@RequestBody Custom custom){
        custom.setUserId(StpUtil.getTokenInfo().getLoginId().toString());
        //拿mm尺寸zx
        String[] split = custom.getSize().split("\\*");
        Random random = new Random();
        custom.setIcon(random.nextInt(6) + 1);
        custom.setWidthMm(Integer.parseInt(split[0]));
        custom.setHeightMm(Integer.parseInt(split[1]));
        custom.setCreateTime(new Date());
        customService.save(custom);
        return R.ok(null);
    }

    //证件列表
    @GetMapping("/itemList")
   public R itemList(int pageNum, int pageSize, int type,String name){
        String userId = "0";
        if(type==4){
            userId = StpUtil.getTokenInfo().getLoginId().toString();
        }
        List<Object> list = itemService.itemList(pageNum, pageSize, type,userId,name);
        return R.ok(list);
    }


    //用户作品列表
    @GetMapping("/photoList")
    public R photoList(int pageNum, int pageSize){
        List<Photo> photos = photoService.photoList(pageNum, pageSize, StpUtil.getTokenInfo().getLoginId().toString());
        return R.ok(photos);
    }

    //删除作品
    @GetMapping("/deletePhotoId")
    public R deletePhotoId(int id){
        QueryWrapper<Photo> qw = new QueryWrapper<>();
        qw.eq("id",id);
        qw.eq("user_id",StpUtil.getTokenInfo().getLoginId());
        photoService.remove(qw);
        return R.ok(null);
    }

}
