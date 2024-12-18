package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 新闻资讯对象 t_news_information
 * 
 * @author tangJM.
 * @date 2024-12-18
 */
public class NewsInformation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 新闻ID，唯一标识 */
    private Long id;

    /** 新闻标题 */
    @Excel(name = "新闻标题")
    private String title;

    /** 新闻类别，例如：行业新闻、公司新闻 */
    @Excel(name = "新闻类别，例如：行业新闻、公司新闻")
    private String category;

    /** 新闻发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "新闻发布时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date publishTime;

    /** 新闻来源，例如：南韩两大半导体厂 */
    @Excel(name = "新闻来源，例如：南韩两大半导体厂")
    private String source;

    /** 新闻内容，保存详细描述 */
    @Excel(name = "新闻内容，保存详细描述")
    private String content;

    /** 图片文件ID */
    @Excel(name = "图片文件ID")
    private String imageFileId;

    /** 关键词，用于新闻搜索与索引 */
    @Excel(name = "关键词，用于新闻搜索与索引")
    private String keywords;

    /** 删除标志（0代表存在 1代表删除） */
    private String delFlag;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setCategory(String category) 
    {
        this.category = category;
    }

    public String getCategory() 
    {
        return category;
    }
    public void setPublishTime(Date publishTime) 
    {
        this.publishTime = publishTime;
    }

    public Date getPublishTime() 
    {
        return publishTime;
    }
    public void setSource(String source) 
    {
        this.source = source;
    }

    public String getSource() 
    {
        return source;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }

    public String getImageFileId() {
        return imageFileId;
    }

    public void setImageFileId(String imageFileId) {
        this.imageFileId = imageFileId;
    }

    public void setKeywords(String keywords)
    {
        this.keywords = keywords;
    }

    public String getKeywords() 
    {
        return keywords;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("category", getCategory())
            .append("publishTime", getPublishTime())
            .append("source", getSource())
            .append("content", getContent())
            .append("imageFileId", getImageFileId())
            .append("keywords", getKeywords())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
