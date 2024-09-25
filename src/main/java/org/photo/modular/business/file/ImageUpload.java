package org.photo.modular.business.file;

import cn.dev33.satoken.stp.StpUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.photo.modular.business.model.entity.PhotoRecord;
import org.photo.modular.business.model.entity.WebSet;
import org.photo.modular.business.service.PhotoRecordService;
import org.photo.modular.business.service.UploadService;
import org.photo.modular.business.service.WebSetService;
import org.photo.util.R;

import java.util.Date;

@RestController
public class ImageUpload {

    @Autowired
    private UploadService uploadService;
    @Autowired
    private WebSetService webSetService;
    @Autowired
    private PhotoRecordService photoRecordService;

    //图片检查
    @PostMapping("/upload")
    public R uploadImage(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return R.no("图片不能为空");
        }

        // 检查文件类型
        String originalFilename = file.getOriginalFilename();
        if (!StringUtils.hasText(originalFilename) || (!originalFilename.toLowerCase().endsWith(".png")
                && !originalFilename.toLowerCase().endsWith(".jpg")) && !originalFilename.toLowerCase().endsWith(".jpeg")) {
            // 文件类型不合法
            return R.no("图片类型不合法，仅支持jpg/png/jpeg的图片");
        }

        // 检查文件大小，因为现在的手机，一拍照就10多M
        if (file.getSize() > 15 * 1024 * 1024) {
            return R.no("图片大小不能超过20M");
        }

        WebSet webSet = webSetService.getById(1);
        //如果开启鉴黄
        if(webSet.getSafetyApi()==2){
            String s = uploadService.checkNsfw(file);
            if(s!=null){
                return R.no(s);
            }
        }

        PhotoRecord photoRecord = new PhotoRecord();
        photoRecord.setName("上传图片");
        photoRecord.setUserId(StpUtil.getTokenInfo().getLoginId().toString());
        photoRecord.setCreateTime(new Date());
        photoRecordService.save(photoRecord);


        return uploadService.uploadPhoto(file,originalFilename);
    }


}
