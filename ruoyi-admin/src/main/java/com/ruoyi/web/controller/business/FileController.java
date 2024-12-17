package com.ruoyi.web.controller.business;

import com.ruoyi.business.domain.File;
import com.ruoyi.business.service.IFileService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.exception.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

/**
 * 文件Controller
 * 
 * @author tangJM.
 * @date 2024-12-12
 */
@Controller
@RequestMapping("/business/file")
public class FileController extends BaseController
{

    @Autowired
    private IFileService fileService;

    /**
     * 批量上传多个文件
     * @param files
     * @return
     */
    @PostMapping("/uploadMultiple")
    public AjaxResult uploadMultipleFiles(@RequestParam("files") MultipartFile[] files) {
        if (files == null || files.length == 0) {
            throw new ServiceException("请选择要上传的文件");
        }

        try {
            List<Long> generatedIds = fileService.uploadMultiple(files);
            return AjaxResult.success(generatedIds);
        } catch (Exception e) {
            return AjaxResult.error("文件上传失败: " + e.getMessage());
        }
    }

    /**
     * 获取文件（二进制流）
     */
    @GetMapping("/readFile/{id}")
    public ResponseEntity<ByteArrayResource> readFileById(@PathVariable Long id) {
        try {
            // 获取文件路径
            File file = fileService.getById(id);
            byte[] bytes = Files.readAllBytes(Paths.get(file.getPath()));
            ByteArrayResource resource = new ByteArrayResource(bytes);

            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getName() + "\"")
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .contentLength(resource.contentLength())
                    .body(resource);
        } catch (IOException e) {
            // 错误处理
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
