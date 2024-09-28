package org.photo.modular.HivisionIDPhotos.response;

import cn.hutool.core.util.ObjectUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HIDHivisionResponse {
    // 状态码，true表示成功
    private boolean status;
    //标准证件照的base64编码
    private String imageBase64Standard;
    //高清证件照的base64编码
    private String imageBase64Hd;
    //其他接口返回的图片
    private String imageBase64;

    public String getImageBase64Standard() {
        if (ObjectUtil.isNotEmpty(imageBase64Standard) && !imageBase64Standard.startsWith("data:image")){
            imageBase64Standard = "data:image/png;base64,"+imageBase64Standard;
        }
        return imageBase64Standard;
    }
    public String getImageBase64Hd() {
        if (ObjectUtil.isNotEmpty(imageBase64Hd) && !imageBase64Hd.startsWith("data:image")){
            imageBase64Hd = "data:image/png;base64,"+imageBase64Hd;
        }
        return imageBase64Hd;
    }
    public String getImageBase64() {
        if (ObjectUtil.isNotEmpty(imageBase64) && !imageBase64.startsWith("data:image")){
            imageBase64 = "data:image/png;base64,"+imageBase64;
        }
        return imageBase64;
    }
}
