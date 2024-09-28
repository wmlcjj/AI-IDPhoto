package org.photo.modular.HivisionIDPhotos.contorller;

import org.photo.modular.HivisionIDPhotos.request.HIDAddBackgroundRequest;
import org.photo.modular.HivisionIDPhotos.request.HIDIdPhotoRequest;
import org.photo.modular.HivisionIDPhotos.response.HIDHivisionResponse;
import org.photo.modular.HivisionIDPhotos.service.HivisionIDPhotosService;
import org.photo.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("/idPhotoApi")
public class HivisionIDPhotosController {

    @Autowired
    private HivisionIDPhotosService hivisionIDPhotosService;

    @PostMapping("/idphoto")
    public HIDHivisionResponse idphoto(MultipartFile file, HIDIdPhotoRequest request) throws IOException {
        request.setInput_image(file);
        return hivisionIDPhotosService.idphoto(request);
    }

    @PostMapping("/add_background")
    public R<HIDHivisionResponse> add_background(MultipartFile file, HIDAddBackgroundRequest request) throws IOException {
        request.setInput_image(file);
        return R.ok(hivisionIDPhotosService.add_background(request));
    }

    @PostMapping("/generate_layout_photos")
    public R<HIDHivisionResponse> generate_layout_photos(MultipartFile file, HIDAddBackgroundRequest request) throws IOException {
        request.setInput_image(file);
        return R.ok(hivisionIDPhotosService.generate_layout_photos(request));
    }

    @PostMapping("/human_matting")
    public R<HIDHivisionResponse> human_matting(MultipartFile file, HIDAddBackgroundRequest request) throws IOException {
        request.setInput_image(file);
        return R.ok(hivisionIDPhotosService.human_matting(request));
    }

    @PostMapping("/watermark")
    public R<HIDHivisionResponse> watermark(MultipartFile file, HIDAddBackgroundRequest request) throws IOException {
        request.setInput_image(file);
        return R.ok(hivisionIDPhotosService.watermark(request));
    }

    @PostMapping("/set_kb")
    public R<HIDHivisionResponse> set_kb(MultipartFile file, HIDAddBackgroundRequest request) throws IOException {
        request.setInput_image(file);
        return R.ok(hivisionIDPhotosService.set_kb(request));
    }

    @PostMapping("/idphoto_crop")
    public R<HIDHivisionResponse> idphoto_crop(MultipartFile file, HIDAddBackgroundRequest request) throws IOException {
        request.setInput_image(file);
        return R.ok(hivisionIDPhotosService.idphoto_crop(request));
    }
}
