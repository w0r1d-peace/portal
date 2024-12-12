package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.business.service.IFileService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.web.multipart.MultipartFile;

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
}
