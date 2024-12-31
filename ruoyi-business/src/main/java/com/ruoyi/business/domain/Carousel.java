package com.ruoyi.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 轮播图对象 t_carousel
 * 
 * @author tangJM.
 * @date 2024-12-31
 */
public class Carousel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 注释 */
    private Long id;

    /** 轮播图文件ID */
    @Excel(name = "轮播图文件ID")
    private Long imageFileId;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

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
    public void setImageFileId(Long imageFileId) 
    {
        this.imageFileId = imageFileId;
    }

    public Long getImageFileId() 
    {
        return imageFileId;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
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
            .append("imageFileId", getImageFileId())
            .append("sort", getSort())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
