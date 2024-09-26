package org.photo.modular.idPhotoApi.service;

import org.photo.modular.idPhotoApi.request.IdPhotoRequest;
import org.photo.modular.idPhotoApi.response.HivisionResponse;

import java.io.IOException;

public interface IdPhotoApiService {
    HivisionResponse idphoto(IdPhotoRequest request) throws IOException;

}
