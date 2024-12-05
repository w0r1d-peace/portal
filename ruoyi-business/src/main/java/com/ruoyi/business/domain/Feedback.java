package com.ruoyi.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 留言反馈对象 t_feedback
 * 
 * @author tangJM.
 * @date 2024-12-03
 */
public class Feedback extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String mobile;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 咨询主题 */
    @Excel(name = "咨询主题")
    private String inquiryTopic;

    /** 咨询内容 */
    @Excel(name = "咨询内容")
    private String inquiryContent;

    /** 反馈内容 */
    @Excel(name = "反馈内容")
    private String feedback;

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

    public void setInquiryTopic(String inquiryTopic) 
    {
        this.inquiryTopic = inquiryTopic;
    }

    public String getInquiryTopic() 
    {
        return inquiryTopic;
    }

    public void setInquiryContent(String inquiryContent) 
    {
        this.inquiryContent = inquiryContent;
    }

    public String getInquiryContent() 
    {
        return inquiryContent;
    }

    public void setFeedback(String feedback) 
    {
        this.feedback = feedback;
    }

    public String getFeedback() 
    {
        return feedback;
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
            .append("name", getName())
            .append("mobile", getMobile())
            .append("email", getEmail())
            .append("inquiryTopic", getInquiryTopic())
            .append("inquiryContent", getInquiryContent())
            .append("feedback", getFeedback())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
