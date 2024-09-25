package org.photo.modular.business.service;

import org.springframework.web.multipart.MultipartFile;
import org.photo.util.R;

public interface UploadService {

    //图片鉴黄
    String checkNsfw(MultipartFile multipartFile);

    //将流转成base64
    R uploadPhoto(MultipartFile file, String originalFilename);

}
