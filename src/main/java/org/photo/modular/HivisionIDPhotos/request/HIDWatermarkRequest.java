package org.photo.modular.HivisionIDPhotos.request;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class HIDWatermarkRequest {
    private MultipartFile input_image; // 传入的图像文件路径
    private String input_image_base64; // 传入的图像文件的base64编码
    private String text; // 水印文本，默认为Hello
    private Integer size; // 水印字体大小，默认为20
    private Float opacity; // 水印透明度，默认为0.5
    private Integer angle; // 水印旋转角度，默认为30
    private String color; // 水印颜色，默认为#000000
    private Integer space; // 水印间距，默认为25
    private Integer dpi; // 图像分辨率，默认为300
}
