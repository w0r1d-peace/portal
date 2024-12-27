package com.ruoyi.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 产品字段配置对象 t_product_field
 * 
 * @author tangJM.
 * @date 2024-12-05
 */
public class ProductCategoryField extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 产品ID */
    @Excel(name = "产品ID")
    private Long productId;

    /** 产品种类ID */
    @Excel(name = "产品种类ID")
    private Long productCategoryId;

    /** 字段名称 */
    @Excel(name = "字段名称")
    private String fieldName;

    /** 排序 */
    @Excel(name = "排序")
    private Integer sort;

    /** 是否筛选 */
    @Excel(name = "是否筛选")
    private Integer isFilter;

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

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getProductCategoryId() {
        return productCategoryId;
    }

    public void setProductCategoryId(Long productCategoryId) {
        this.productCategoryId = productCategoryId;
    }

    public void setFieldName(String fieldName)
    {
        this.fieldName = fieldName;
    }

    public String getFieldName() 
    {
        return fieldName;
    }

    public void setSort(Integer sort) 
    {
        this.sort = sort;
    }

    public Integer getSort() 
    {
        return sort;
    }

    public void setIsFilter(Integer isFilter) 
    {
        this.isFilter = isFilter;
    }

    public Integer getIsFilter() 
    {
        return isFilter;
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
            .append("productId", getProductId())
            .append("productCategoryId", getProductCategoryId())
            .append("fieldName", getFieldName())
            .append("sort", getSort())
            .append("isFilter", getIsFilter())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
