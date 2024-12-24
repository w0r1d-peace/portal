package com.ruoyi.business.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

@Data
public class SolutionDesignListVO extends BaseEntity {

    /** 新闻ID，唯一标识 */
    private Long id;

    /** 标题 */
    private String title;

    /** 发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date publishTime;

    /** 内容 */
    private String content;

    /** 图片文件ID */
    private Long imageFileId;

    /**
     * 图片文件路径
     */
    private String imageFilePath;
}
