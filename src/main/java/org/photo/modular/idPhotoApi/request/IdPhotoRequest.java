package org.photo.modular.idPhotoApi.request;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class IdPhotoRequest {
    private MultipartFile input_image; // 传入的图像文件路径
    private String input_image_base64; // 传入的图像文件的base64编码
    private Integer height; // 标准证件照高度，默认为413
    private Integer width; // 标准证件照宽度，默认为295
    private String human_matting_model; // 人像分割模型，默认为modnet_photographic_portrait_matting
    private String face_detect_model; // 人脸检测模型，默认为mtcnn
    private Boolean hd; // 是否生成高清证件照，默认为true
    private Integer dpi; // 图像分辨率，默认为300
    private Boolean face_alignment; // 是否进行人脸对齐，默认为true
    private Float head_measure_ratio; // 面部面积与照片面积的比例，默认为0.2
    private Float head_height_ratio; // 面部中心与照片顶部的高度比例，默认为0.45
    private Float top_distance_max; // 头部与照片顶部距离的比例最大值，默认为0.12
    private Float top_distance_min; // 头部与照片顶部距离的比例最小值，默认为0.1
}
