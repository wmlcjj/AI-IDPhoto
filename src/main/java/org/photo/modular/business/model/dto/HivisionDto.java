package org.photo.modular.business.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HivisionDto {
    //是否制作成功
    private boolean status;
    //初始化白底证件照图片
    private String imageBase64Standard;
    //高清抠图透明图片
    private String imageBase64Hd;
    //切换颜色上色后图片
    private String imageBase64;

    public String getImageBase64Standard() {
        if (!imageBase64Standard.startsWith("data:image")){
            imageBase64Standard = "data:image/png;base64,"+imageBase64Standard;
        }
        return imageBase64Standard;
    }
    public String getImageBase64() {
        if (!imageBase64.startsWith("data:image")){
            imageBase64 = "data:image/png;base64,"+imageBase64;
        }
        return imageBase64;
    }
}
