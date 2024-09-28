package org.photo.modular.HivisionIDPhotos.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpResponse;
import cn.hutool.json.JSONUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.photo.modular.HivisionIDPhotos.enums.HIDOptTypeEnum;
import org.photo.modular.HivisionIDPhotos.request.HIDAddBackgroundRequest;
import org.photo.modular.HivisionIDPhotos.request.HIDIdPhotoRequest;
import org.photo.modular.HivisionIDPhotos.response.HIDHivisionResponse;
import org.photo.modular.HivisionIDPhotos.service.HivisionIDPhotosService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;


@Service
@Slf4j
public class HivisionIDPhotosServiceImpl implements HivisionIDPhotosService {

    @Value("${webset.zjzDomain}")
    private String zjzDomain;

    public HIDHivisionResponse idphoto(HIDIdPhotoRequest request) throws IOException {
        return handleRequestAndSend(HIDOptTypeEnum.IDPHOTO.getName(), request);
    }
    public HIDHivisionResponse add_background(HIDAddBackgroundRequest request) throws IOException {
        return handleRequestAndSend(HIDOptTypeEnum.ADD_BACKGROUND.getName(), request);
    }

    @Override
    public HIDHivisionResponse generate_layout_photos(HIDAddBackgroundRequest request) throws IOException {
        return handleRequestAndSend(HIDOptTypeEnum.GENERATE_LAYOUT_PHOTOS.getName(), request);
    }

    @Override
    public HIDHivisionResponse human_matting(HIDAddBackgroundRequest request) throws IOException {
        return handleRequestAndSend(HIDOptTypeEnum.HUMAN_MATTING.getName(), request);
    }

    @Override
    public HIDHivisionResponse watermark(HIDAddBackgroundRequest request) throws IOException {
        return handleRequestAndSend(HIDOptTypeEnum.WATERMARK.getName(), request);
    }

    @Override
    public HIDHivisionResponse set_kb(HIDAddBackgroundRequest request) throws IOException {
        return handleRequestAndSend(HIDOptTypeEnum.SET_KB.getName(), request);
    }

    @Override
    public HIDHivisionResponse idphoto_crop(HIDAddBackgroundRequest request) throws IOException {
        return handleRequestAndSend(HIDOptTypeEnum.IDPHOTO_CROP.getName(), request);
    }

    private HIDHivisionResponse handleRequestAndSend(String flag, Object requestObject) throws IOException {
        return handleRequestAndSend(flag, requestObject, null);
    }
    private HIDHivisionResponse handleRequestAndSend(String flag, Object requestObject, Map<String, String> headers) throws IOException {
        Map<String,Object> params = BeanUtil.beanToMap(requestObject);
        if (ObjectUtil.isEmpty(params.get("input_image")) && ObjectUtil.isEmpty(params.get("input_image_base64"))){
            throw new NullPointerException("input_image和input_image_base64必须有一个不为空");
        }
        String url = zjzDomain.endsWith("/") ? zjzDomain : zjzDomain + "/";
        if (MapUtil.isEmpty(headers)){
            headers = new HashMap<>();
            headers.put("Content-Type", "multipart/form-data");
        }
        if (ObjectUtil.isNotEmpty(params.get("input_image"))){
            params.put("input_image_base64", multipartFileToBase64((MultipartFile)params.get("input_image")));
            params.put("input_image", null);
        }
        if (ObjectUtil.isNotEmpty(params.get("input_image_base64"))){
            params.put("input_image", null);
        }
        return postRequest(url+flag, params, headers);
    }


    private HIDHivisionResponse postRequest(String url, Map<String,Object> params, Map<String, String> headers) {
        try {
            HttpRequest request = HttpRequest.post(url).form(params);
            if (headers != null) {
                for (Map.Entry<String, String> entry : headers.entrySet()) {
                    request.header(entry.getKey(), entry.getValue());
                }
            }
            HttpResponse response = request.execute();

            if (response.getStatus() == 200) {
                HIDHivisionResponse result = JSONUtil.toBean(response.body(), HIDHivisionResponse.class);
                return result;
            } else {
                log.error("调用Hivision接口失败: " + response.getStatus() + " " + response.body());
                throw new RuntimeException("调用Hivision接口失败: " + response.getStatus() + " " + response.body());
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static String multipartFileToBase64(MultipartFile file) throws IOException {
        byte[] fileBytes = file.getBytes();
        String base64String = Base64.getEncoder().encodeToString(fileBytes);
        String pre = "data:image/jpg;base64,";
        return pre + base64String;
    }

}
