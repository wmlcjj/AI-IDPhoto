package org.photo.modular.HivisionIDPhotos.service;

import org.photo.modular.HivisionIDPhotos.enums.HIDOptTypeEnum;
import org.photo.modular.HivisionIDPhotos.request.HIDAddBackgroundRequest;
import org.photo.modular.HivisionIDPhotos.request.HIDIdPhotoRequest;
import org.photo.modular.HivisionIDPhotos.response.HIDHivisionResponse;

import java.io.IOException;

public interface HivisionIDPhotosService {

    /**
     * 生成证件照
     * 接口的逻辑是发送一张 RGB 图像，输出一张标准证件照和一张高清证件照：
     * 高清证件照：根据size的宽高比例制作的证件照，文件名为output_image_dir增加_hd后缀
     * 标准证件照：尺寸等于size，由高清证件照缩放而来，文件名为output_image_dir
     * 需要注意的是，生成的两张照片都是透明的（RGBA 四通道图像），要生成完整的证件照，还需要下面的添加背景色接口。
     * @param request
     * @return
     * @throws IOException
     */
    HIDHivisionResponse idphoto(HIDIdPhotoRequest request) throws IOException;

    /**
     * 添加背景色
     * 接口的逻辑是接收一张 RGBA 图像（透明图），根据color添加背景色，合成一张 JPG 图像。
     * @param request
     * @return
     * @throws IOException
     */
    HIDHivisionResponse add_background(HIDAddBackgroundRequest request) throws IOException;

    /**
     * 生成六寸排版照
     * 接口的逻辑是接收一张 RGB 图像（一般为添加背景色之后的证件照），根据size进行照片排布，然后生成一张六寸排版照。
     * @param request
     * @return
     * @throws IOException
     */
    HIDHivisionResponse generate_layout_photos(HIDAddBackgroundRequest request) throws IOException;

    /**
     * 人像抠图
     * 接口的逻辑是接收一张 RGB 图像，输出一张标准抠图人像照和高清抠图人像照（无任何背景填充）。
     * @param request
     * @return
     * @throws IOException
     */
    HIDHivisionResponse human_matting(HIDAddBackgroundRequest request) throws IOException;

    /**
     * 图像加水印
     * 接口的功能是接收一个水印文本，然后在原图上添加指定的水印。用户可以指定水印的位置、透明度和大小等属性，以便将水印无缝地融合到原图中。
     * @param request
     * @return
     * @throws IOException
     */
    HIDHivisionResponse watermark(HIDAddBackgroundRequest request) throws IOException;
    /**
     * 设置图像KB大小
     * 接口的功能是接收一张图像和目标文件大小（以KB为单位），如果设置的KB值小于原文件，则调整压缩率；如果设置的KB值大于源文件，则通过给文件头添加信息的方式调大KB值，目标是让图像的最终大小与设置的KB值一致。
     * @param request
     * @return
     * @throws IOException
     */
    HIDHivisionResponse set_kb(HIDAddBackgroundRequest request) throws IOException;

    /**
     * 证件照裁切
     * 接口的功能是接收一张 RBGA 图像（透明图），输出一张标准证件照和一张高清证件照。
     * @param request
     * @return
     * @throws IOException
     */
    HIDHivisionResponse idphoto_crop(HIDAddBackgroundRequest request) throws IOException;


}
