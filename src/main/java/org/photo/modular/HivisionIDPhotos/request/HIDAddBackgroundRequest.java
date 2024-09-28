package org.photo.modular.HivisionIDPhotos.request;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class HIDAddBackgroundRequest {
    private MultipartFile input_image; // 传入的图像文件路径
    private String input_image_base64; // 传入的图像文件的base64编码
    private String color; // 背景色HEX值，默认为000000
    private Integer kb; // 输出照片的 KB 值，默认为None
    private Integer render; // 渲染模式，默认为0
    private Integer dpi; // 图像分辨率，默认为300
}
