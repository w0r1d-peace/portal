package com.ruoyi.business.domain;


import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 网站信息对象 t_enterprise_info
 * 
 * @author tangJM.
 * @date 2024-12-03
 */
public class EnterpriseInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 单位名称 */
    @Excel(name = "单位名称")
    private String name;

    /** 单位地址 */
    @Excel(name = "单位地址")
    private String address;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String mobile;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 传真 */
    @Excel(name = "传真")
    private String fax;

    /** 联系人 */
    @Excel(name = "联系人")
    private String contactPerson;

    /** 业务QQ */
    @Excel(name = "业务QQ")
    private String businessQq;

    /** 微信号 */
    @Excel(name = "微信号")
    private String wechat;

    /** 邮编 */
    @Excel(name = "邮编")
    private String zipCode;

    /** 网站备案号 */
    @Excel(name = "网站备案号")
    private String icpNumber;

    /** 网站地址 */
    @Excel(name = "网站地址")
    private String website;

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

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }

    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }

    public void setMobile(String mobile) 
    {
        this.mobile = mobile;
    }

    public String getMobile() 
    {
        return mobile;
    }

    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }

    public void setFax(String fax) 
    {
        this.fax = fax;
    }

    public String getFax() 
    {
        return fax;
    }

    public void setContactPerson(String contactPerson) 
    {
        this.contactPerson = contactPerson;
    }

    public String getContactPerson() 
    {
        return contactPerson;
    }

    public void setBusinessQq(String businessQq) 
    {
        this.businessQq = businessQq;
    }

    public String getBusinessQq() 
    {
        return businessQq;
    }

    public void setWechat(String wechat) 
    {
        this.wechat = wechat;
    }

    public String getWechat() 
    {
        return wechat;
    }

    public void setZipCode(String zipCode) 
    {
        this.zipCode = zipCode;
    }

    public String getZipCode() 
    {
        return zipCode;
    }

    public void setIcpNumber(String icpNumber) 
    {
        this.icpNumber = icpNumber;
    }

    public String getIcpNumber() 
    {
        return icpNumber;
    }

    public void setWebsite(String website) 
    {
        this.website = website;
    }

    public String getWebsite() 
    {
        return website;
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
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("address", getAddress())
            .append("phone", getPhone())
            .append("mobile", getMobile())
            .append("email", getEmail())
            .append("fax", getFax())
            .append("contactPerson", getContactPerson())
            .append("businessQq", getBusinessQq())
            .append("wechat", getWechat())
            .append("zipCode", getZipCode())
            .append("icpNumber", getIcpNumber())
            .append("website", getWebsite())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
