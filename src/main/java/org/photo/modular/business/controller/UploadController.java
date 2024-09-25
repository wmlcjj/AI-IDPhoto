package org.photo.modular.business.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.dromara.x.file.storage.core.FileInfo;
import org.dromara.x.file.storage.core.FileStorageService;
import org.photo.exception.BizException;
import org.photo.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.photo.modular.business.model.entity.FileDetail;
import org.photo.modular.business.service.impl.FileDetailService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

@Slf4j
@RestController
@RequestMapping("/file")
public class UploadController {

    @Autowired
    private FileStorageService fileStorageService;//注入实列
    @Autowired
    private FileDetailService fileDetailService;//注入实列

    /**
     * 上传文件
     */
    @PostMapping("/upload")
    public R<FileInfo> upload(MultipartFile file) {
        FileInfo info = fileStorageService.of(file).upload();
//        fileDetailService.save(info);
        return R.ok(info);
    }

    /**
     * 上传文件，成功返回文件 url
     */
    @PostMapping("/upload2")
    public String upload2(MultipartFile file) {
        FileInfo fileInfo = fileStorageService.of(file)
                .setPath("upload/") //保存到相对路径下，为了方便管理，不需要可以不写
                .setSaveFilename("image.jpg") //设置保存的文件名，不需要可以不写，会随机生成
                .setObjectId("0")   //关联对象id，为了方便管理，不需要可以不写
                .setObjectType("0") //关联对象类型，为了方便管理，不需要可以不写
                .putAttr("role","admin") //保存一些属性，可以在切面、保存上传记录、自定义存储平台等地方获取使用，不需要可以不写
                .upload();  //将文件上传到对应地方
        return fileInfo == null ? "上传失败！" : fileInfo.getUrl();
    }

    /**
     * 上传图片，成功返回文件信息
     * 图片处理使用的是 https://github.com/coobird/thumbnailator
     */
    @PostMapping("/upload-image")
    public FileInfo uploadImage(MultipartFile file) {
        return fileStorageService.of(file)
                .image(img -> img.size(1000,1000))  //将图片大小调整到 1000*1000
                .thumbnail(th -> th.size(200,200))  //再生成一张 200*200 的缩略图
                .upload();
    }

    /**
     * 上传文件到指定存储平台，成功返回文件信息
     */
    @PostMapping("/upload-platform")
    public FileInfo uploadPlatform(MultipartFile file) {
        return fileStorageService.of(file)
                .setPlatform("aliyun-oss-1")    //使用指定的存储平台
                .upload();
    }

    /**
     * 直接读取 HttpServletRequest 中的文件进行上传，成功返回文件信息
     * 使用这种方式有些注意事项，请查看文档 基础功能-上传 章节
     */
    @PostMapping("/upload-request")
    public FileInfo uploadPlatform(HttpServletRequest request) {
        return fileStorageService.of(request).upload();
    }


    /**
     * 直接读取 HttpServletRequest 中的文件进行上传，成功返回文件信息
     * 使用这种方式有些注意事项，请查看文档 基础功能-上传 章节
     */
    @GetMapping("/download")
    public void download(HttpServletRequest request, HttpServletResponse response, @Param("id") String id) throws JsonProcessingException {
        FileDetail fileDetail = fileDetailService.getById(id);

        if (fileDetail == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        FileInfo fileInfo = fileDetailService.toFileInfo(fileDetail);

        try (OutputStream out = response.getOutputStream()) {
            // 设置适当的 Content-Type，例如：image/png，确保浏览器正确处理文件类型
            String contentType = getMimeType(fileInfo.getFilename());
            response.setContentType(contentType);

            String encodedFilename = URLEncoder.encode(fileInfo.getFilename(), StandardCharsets.UTF_8.toString())
                    .replaceAll("\\+", "%20"); // 编码文件名，处理空格等特殊字符
            response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFilename + "\"");

            response.addHeader("Access-Control-Expose-Headers", "Content-Disposition,download-filename");

            // 下载到 OutputStream 中
            fileStorageService.download(fileInfo).outputStream(out);

            // 确保输出流冲刷数据
            out.flush();
        } catch (IOException e) {
            // 可以根据具体需求改为更详细的异常处理及响应状态设置
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * 直接读取 HttpServletRequest 中的文件进行上传，成功返回文件信息
     * 使用这种方式有些注意事项，请查看文档 基础功能-上传 章节
     */
    @GetMapping("/preview")
    public void preview(HttpServletRequest request, HttpServletResponse response, @Param("id") String id, @Param("token") String token) throws JsonProcessingException {
        Object loginId = StpUtil.getLoginIdByToken(token);
        if (ObjectUtils.isEmpty(loginId) || Arrays.asList("-1","-2","-3","-4","-5").contains(loginId.toString())){
            throw new BizException("未登录");
        }
        FileDetail fileDetail = fileDetailService.getById(id);

        if (fileDetail == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        FileInfo fileInfo = fileDetailService.toFileInfo(fileDetail);

        try (OutputStream out = response.getOutputStream()) {
            // 设置适当的 Content-Type，例如：image/png，确保浏览器正确处理文件类型
            String contentType = getMimeType(fileInfo.getFilename());
            response.setContentType(contentType);

            String encodedFilename = URLEncoder.encode(fileInfo.getFilename(), StandardCharsets.UTF_8.toString())
                    .replaceAll("\\+", "%20"); // 编码文件名，处理空格等特殊字符
            response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFilename + "\"");

            // 下载到 OutputStream 中
            fileStorageService.download(fileInfo).outputStream(out);

            // 确保输出流冲刷数据
            out.flush();
        } catch (IOException e) {
            // 可以根据具体需求改为更详细的异常处理及响应状态设置
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private String getMimeType(String filename) {
        // 根据文件后缀获取MIME类型，可以添加更多类型
        if (filename.endsWith(".png")) {
            return MediaType.IMAGE_PNG_VALUE;
        } else if (filename.endsWith(".jpg") || filename.endsWith(".jpeg")) {
            return MediaType.IMAGE_JPEG_VALUE;
        } else if (filename.endsWith(".gif")) {
            return MediaType.IMAGE_GIF_VALUE;
        } else {
            return MediaType.APPLICATION_OCTET_STREAM_VALUE;
        }
    }

    /**
     * 直接读取 HttpServletRequest 中的文件进行上传，成功返回文件信息
     * 使用这种方式有些注意事项，请查看文档 基础功能-上传 章节
     */
    @GetMapping("/downloadByUrl")
    public void downloadByUrl(HttpServletRequest request, HttpServletResponse response, @Param("url") String url) throws JsonProcessingException {
        FileInfo fileInfo = fileDetailService.getByUrl(url);
        // 设置响应头以强制浏览器下载文件
        try {
            String encodedFilename = URLEncoder.encode(fileInfo.getFilename(), StandardCharsets.UTF_8.toString())
                    .replaceAll("\\+", "%20");

            response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFilename + "\"");
            response.setContentType(MediaType.IMAGE_PNG_VALUE);

            // 下载到 OutputStream 中
            try (OutputStream out = response.getOutputStream()) {
                fileStorageService.download(fileInfo).outputStream(out);
                out.flush();
            }
        } catch (IOException e) {
            throw new BizException("File download failed", e);
        }
    }

    /**
     * 直接读取 HttpServletRequest 中的文件进行上传，成功返回文件信息
     * 使用这种方式有些注意事项，请查看文档 基础功能-上传 章节
     */
    @PostMapping("/getFile")
    public FileDetail getFile(HttpServletRequest request, @Param("id") String id) throws JsonProcessingException {
        FileDetail fileDetail = fileDetailService.getById(id);

//        FileInfo fileInfo = fileDetailService.toFileInfo(fileDetail);

        //通过 FileInfo 获取文件信息
//        RemoteFileInfo info = fileStorageService.getFile(fileInfo);
//
//        //文件元数据
//        MapProxy metadata = info.getKebabCaseInsensitiveMetadata();
//        //文件用户元数据
//        MapProxy userMetadata = info.getKebabCaseInsensitiveUserMetadata();
//
//        //获取原始文件信息，这里以阿里云为例
//        COSObject cosObject = info.getOriginalTencentCosObject();

        return fileDetail;
    }
}
