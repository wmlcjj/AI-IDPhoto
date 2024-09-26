package org.photo.modular.idPhotoApi.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpResponse;
import cn.hutool.http.Method;
import cn.hutool.json.JSONUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.photo.modular.idPhotoApi.request.IdPhotoRequest;
import org.photo.modular.idPhotoApi.response.HivisionResponse;
import org.photo.modular.idPhotoApi.service.IdPhotoApiService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;


@Service
public class IdPhotoApiServiceImpl implements IdPhotoApiService {

    @Value("${webset.zjzDomain}")
    private String zjzDomain;

    private ObjectMapper objectMapper = new ObjectMapper();

    public HivisionResponse idphoto(IdPhotoRequest request) throws IOException {
        if (ObjectUtil.isEmpty(request.getInput_image()) && ObjectUtil.isEmpty(request.getInput_image_base64())){
            throw new NullPointerException("input_image和input_image_base64必须有一个不为空");
        }
        String url = zjzDomain.endsWith("/") ? zjzDomain : zjzDomain + "/";
        Map<String, String> headers = new HashMap<>();
//        headers.put("Content-Type", "multipart/form-data");
        if (ObjectUtil.isNotEmpty(request.getInput_image_base64())){
            request.setInput_image(null);
        }
        if (ObjectUtil.isNotEmpty(request.getInput_image())){
            request.setInput_image_base64(multipartFileToBase64(request.getInput_image()));
        }
        HivisionResponse response = postRequest(url+"idphoto", request, headers);
        return response;
    }

    private HivisionResponse postRequest(String url, Object requestObject){
        return postRequest(url, requestObject, null);
    }

    private HivisionResponse postRequest(String url, Object requestObject, Map<String, String> headers) {
        try {
            String body = JSONUtil.toJsonStr(requestObject);
            HttpRequest request = HttpRequest.post(url).body(body);
            if (headers != null) {
                for (Map.Entry<String, String> entry : headers.entrySet()) {
                    request.header(entry.getKey(), entry.getValue());
                }
            }
            HttpResponse response = request.execute();

            if (response.getStatus() == 200) {
                return JSONUtil.toBean(response.body(), HivisionResponse.class);
            } else {
                throw new RuntimeException("调用Hivision接口失败: " + response.getStatus() + " " + response.body());
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static String multipartFileToBase64(MultipartFile file) throws IOException {
        byte[] fileBytes = file.getBytes();
        String base64String = Base64.getEncoder().encodeToString(fileBytes);
        return base64String;
    }

}
