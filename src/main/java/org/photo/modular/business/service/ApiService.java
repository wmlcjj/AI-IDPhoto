package org.photo.modular.business.service;

import org.photo.modular.business.model.dto.CreatePhotoDto;
import org.photo.modular.business.model.vo.PicVo;

public interface ApiService {


 //生成证件照，初始化，返回原图（用于下载高清），蓝图（用于初始化页面），透明图（用于切换颜色）
 PicVo createIdPhoto(CreatePhotoDto createPhotoDto);

 //换背景色
 PicVo updateIdPhoto(CreatePhotoDto createPhotoDto);


 //更新用户保存记录
 PicVo updateUserPhonto(String userid,String img,Integer photoId);


}
