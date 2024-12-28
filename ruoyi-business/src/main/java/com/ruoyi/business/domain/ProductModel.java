package com.ruoyi.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 产品型号对象 t_product_model
 * 
 * @author tangJM.
 * @date 2024-12-05
 */
public class ProductModel extends BaseEntity
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

    /** 型号编号 */
    @Excel(name = "型号编号")
    private String modelNumber;

    /** 种类 */
    @Excel(name = "种类")
    private String category;

    /** Package */
    @Excel(name = "Package")
    private String packet;

    /** pdf文件ID */
    @Excel(name = "pdf文件ID")
    private Integer pdfFileId;

    /** 是否有库存，布尔值，1 表示有库存 */
    @Excel(name = "是否有库存，布尔值，1 表示有库存")
    private Integer isInStock;

    /** 是否为新品，布尔值，1 表示新品 */
    @Excel(name = "是否为新品，布尔值，1 表示新品")
    private Integer isNew;

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

    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }

    public Long getProductCategoryId() {
        return productCategoryId;
    }

    public void setProductCategoryId(Long productCategoryId) {
        this.productCategoryId = productCategoryId;
    }

    public void setModelNumber(String modelNumber)
    {
        this.modelNumber = modelNumber;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPacket() {
        return packet;
    }

    public void setPacket(String packet) {
        this.packet = packet;
    }

    public String getModelNumber()
    {
        return modelNumber;
    }

    public Integer getPdfFileId() {
        return pdfFileId;
    }

    public void setPdfFileId(Integer pdfFileId) {
        this.pdfFileId = pdfFileId;
    }

    public void setIsInStock(Integer isInStock)
    {
        this.isInStock = isInStock;
    }

    public Integer getIsInStock() 
    {
        return isInStock;
    }

    public void setIsNew(Integer isNew) 
    {
        this.isNew = isNew;
    }

    public Integer getIsNew() 
    {
        return isNew;
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
            .append("modelNumber", getModelNumber())
            .append("pdfFileId", getPdfFileId())
            .append("isInStock", getIsInStock())
            .append("isNew", getIsNew())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
