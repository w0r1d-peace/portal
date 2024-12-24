package com.ruoyi.business.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;

import java.util.Date;

@Data
public class NewsInformationListVO extends BaseEntity {

    /** 新闻ID，唯一标识 */
    private Long id;

    /** 新闻标题 */
    private String title;

    /** 新闻类别，例如：行业新闻、公司新闻 */
    private String category;

    /** 新闻发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date publishTime;

    /** 新闻来源，例如：南韩两大半导体厂 */
    private String source;

    /** 新闻内容，保存详细描述 */
    private String content;

    /** 图片文件ID */
    private Integer imageFileId;

    /** 关键词，用于新闻搜索与索引 */
    private String keywords;

    /**
     * 图片文件路径
     */
    private String imageFilePath;
}
