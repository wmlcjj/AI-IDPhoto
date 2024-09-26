package org.photo.modular.idPhotoApi.contorller;

import org.photo.modular.idPhotoApi.request.IdPhotoRequest;
import org.photo.modular.idPhotoApi.response.HivisionResponse;
import org.photo.modular.idPhotoApi.service.IdPhotoApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("/idPhotoApi")
public class IdPhotoApiController {

    @Autowired
    private IdPhotoApiService idPhotoApiService;

    @PostMapping("/idphoto")
    public HivisionResponse idphoto(MultipartFile file, IdPhotoRequest request) throws IOException {
        request.setInput_image(file);
        return idPhotoApiService.idphoto(request);
    }
}
