package org.photo.modular.HivisionIDPhotos.request;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class HIDHumanMattingRequest {
    private MultipartFile input_image; // 传入的图像文件路径
    private String human_matting_model; // 人像分割模型，默认为modnet_photographic_portrait_matting
    private Integer dpi; // 图像分辨率，默认为300
}
