package org.photo.modular.idPhotoApi.contorller;

import org.photo.modular.idPhotoApi.service.IdPhotoApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/idPhotoApi")
public class IdPhotoApiController {

    @Autowired
    private IdPhotoApiService idPhotoApiService;
}
