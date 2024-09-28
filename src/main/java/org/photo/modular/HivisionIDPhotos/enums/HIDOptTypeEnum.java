package org.photo.modular.HivisionIDPhotos.enums;

import cn.hutool.core.util.ObjectUtil;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 积分类型枚举
 *
 * @author Chopper
 * @since 2021/3/20 10:44
 */

@Getter
@AllArgsConstructor
public enum HIDOptTypeEnum {
    /**
     * 生成证件照（底透明）
     */
    IDPHOTO(1, "idphoto"),
    /**
     * 添加背景色
     */
    ADD_BACKGROUND(2, "add_background"),
    /**
     * 生成六寸排版照
     */
    GENERATE_LAYOUT_PHOTOS(3, "generate_layout_photos"),
    /**
     * 人像抠图
     */
    HUMAN_MATTING(4, "human_matting"),
    /**
     * 图像加水印
     */
    WATERMARK(5, "watermark"),
    /**
     * 设置图像KB大小
     */
    SET_KB(6, "set_kb"),
    /**
     * 证件照裁切
     */
    IDPHOTO_CROP(7, "idphoto_crop");


    private Integer value;
    private String name;

    public static String getNameByValue(Integer code){
        if(ObjectUtil.isNotEmpty(code)) {
            for (HIDOptTypeEnum pointOptEnum : values()) {
                if (pointOptEnum.getValue().toString().equals(code.toString())) {
                    return pointOptEnum.getName();
                }
            }
        }
        return null;
    }
}
