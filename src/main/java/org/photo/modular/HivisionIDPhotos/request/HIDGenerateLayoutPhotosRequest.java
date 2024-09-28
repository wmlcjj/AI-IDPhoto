package org.photo.modular.HivisionIDPhotos.request;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class HIDGenerateLayoutPhotosRequest {
    private MultipartFile input_image; // 传入的图像文件路径
    private String input_image_base64; // 传入的图像文件的base64编码
    private Integer height; // 输入图像的高度，默认为413
    private Integer width; // 输入图像的宽度，默认为295
    private Integer kb; // 输出照片的 KB 值，默认为None
    private Integer dpi; // 图像分辨率，默认为300
}
