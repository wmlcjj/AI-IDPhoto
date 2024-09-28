package org.photo.modular.business.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreatePhotoDto {
    private String image;
    private Integer height;
    private Integer width;
    private String colors;

    //规格id
    private Integer itemId;
    //记录id
    private Integer photoId;

    private String userId;
    private Integer type;

    //操作类型
    private Integer optType;
}
