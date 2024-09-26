package org.photo.modular.idPhotoApi.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HivisionResponse {
    // 状态码，true表示成功
    private boolean status;
    //标准证件照的base64编码
    private String imageBase64Standard;
    //高清证件照的base64编码
    private String imageBase64Hd;
    //其他接口返回的图片
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
