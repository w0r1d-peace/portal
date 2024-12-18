package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 旅游行程对象 t_itineraries
 * 
 * @author tangJM.
 * @date 2024-12-17
 */
public class Itineraries extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 行程标题 */
    @Excel(name = "行程标题")
    private String title;

    /** 引言 */
    @Excel(name = "引言")
    private String introduction;

    /** 行程描述 */
    @Excel(name = "行程描述")
    private String description;

    /** 作者 */
    @Excel(name = "作者")
    private String author;

    /** 行程发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "行程发布时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date publishDate;

    /** 图片文件ID */
    @Excel(name = "图片文件ID")
    private Long imageFileId;

    /** 浏览次数 */
    @Excel(name = "浏览次数")
    private Long viewCount;

    /** 删除标志（0代表存在 2代表删除） */
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
    public void setIntroduction(String introduction) 
    {
        this.introduction = introduction;
    }

    public String getIntroduction() 
    {
        return introduction;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setAuthor(String author) 
    {
        this.author = author;
    }

    public String getAuthor() 
    {
        return author;
    }
    public void setPublishDate(Date publishDate) 
    {
        this.publishDate = publishDate;
    }

    public Date getPublishDate() 
    {
        return publishDate;
    }
    public void setImageFileId(Long imageFileId) 
    {
        this.imageFileId = imageFileId;
    }

    public Long getImageFileId() 
    {
        return imageFileId;
    }
    public void setViewCount(Long viewCount) 
    {
        this.viewCount = viewCount;
    }

    public Long getViewCount() 
    {
        return viewCount;
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
            .append("introduction", getIntroduction())
            .append("description", getDescription())
            .append("author", getAuthor())
            .append("publishDate", getPublishDate())
            .append("imageFileId", getImageFileId())
            .append("viewCount", getViewCount())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
