package com.ruoyi.business.service.impl;

import com.ruoyi.business.domain.File;
import com.ruoyi.business.mapper.FileMapper;
import com.ruoyi.business.service.IFileService;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

/**
 * 文件Service业务层处理
 * 
 * @author tangJM.
 * @date 2024-12-12
 */
@Service
public class FileServiceImpl implements IFileService 
{
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private FileMapper fileMapper;

    @Value("${ruoyi.profile}")
    private String uploadDirectory;

    /**
     * 查询文件
     * 
     * @param id 文件主键
     * @return 文件
     */
    @Override
    public File selectFileById(Long id)
    {
        return fileMapper.selectFileById(id);
    }

    /**
     * 查询文件列表
     * 
     * @param file 文件
     * @return 文件
     */
    @Override
    public List<File> selectFileList(File file)
    {
        return fileMapper.selectFileList(file);
    }

    /**
     * 新增文件
     * 
     * @param file 文件
     * @return 结果
     */
    @Override
    public int insertFile(File file)
    {
        file.setCreateTime(DateUtils.getNowDate());
        return fileMapper.insertFile(file);
    }

    /**
     * 修改文件
     * 
     * @param file 文件
     * @return 结果
     */
    @Override
    public int updateFile(File file)
    {
        file.setUpdateTime(DateUtils.getNowDate());
        return fileMapper.updateFile(file);
    }

    /**
     * 批量删除文件
     * 
     * @param ids 需要删除的文件主键
     * @return 结果
     */
    @Override
    public int deleteFileByIds(String ids)
    {
        return fileMapper.deleteFileByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除文件信息
     * 
     * @param id 文件主键
     * @return 结果
     */
    @Override
    public int deleteFileById(Long id)
    {
        return fileMapper.deleteFileById(id);
    }

    /**
     * 上传多个文件
     * @param files
     */
    @Transactional(rollbackFor = Exception.class)
    public List<Long> uploadMultiple(MultipartFile[] files) {
        List<Long> generatedIds = new ArrayList<>();
        for (MultipartFile file : files) {
            if (file.isEmpty()) {
                continue;
            }

            String fileKey = UUID.randomUUID().toString().replace("-", "");
            String fileName = file.getOriginalFilename();
            String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1);
            String filePath = uploadDirectory + java.io.File.separator + fileKey + "." + fileExtension;
            long fileSize = file.getSize();

            java.io.File directory = new java.io.File(uploadDirectory);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // 将上传文件到指定目录
            java.io.File targetFile = new java.io.File(filePath);
            try {
                file.transferTo(targetFile);
                logger.info("Saved to: " + targetFile.getAbsolutePath());
            } catch (IOException e) {
                logger.error("上传文件失败：{}", e);
                throw new ServiceException("上传文件失败");
            }

            LoginUser loginUser = getLoginUser();
            SysUser user = loginUser.getUser();
            File fileObj = new File();
            fileObj.setUuid(fileKey);
            fileObj.setName(fileName);
            fileObj.setPath(filePath);
            fileObj.setExtension(fileExtension);
            fileObj.setSize(fileSize);
            fileObj.setCreateBy(user.getUserName());
            fileObj.setCreateTime(DateUtils.getNowDate());
            int result = fileMapper.insertFile(fileObj);

            if (result > 0) {
                generatedIds.add(fileObj.getId());
            }

        }
        return generatedIds;
    }

    /**
     * 根据文件ID获取文件
     * @param id
     * @return
     */
    @Override
    public File getById(Long id) {
        return fileMapper.selectFileById(id);
    }
}
