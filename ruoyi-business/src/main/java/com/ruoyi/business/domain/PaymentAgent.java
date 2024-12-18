package com.ruoyi.business.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 代缴学费对象 t_payment_agent
 * 
 * @author tangJM.
 * @date 2024-12-18
 */
public class PaymentAgent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 唯一标识，自动递增 */
    private Long id;

    /** 代缴协议的文件ID */
    @Excel(name = "代缴协议的文件ID")
    private String agreementFileId;

    /** 录取通知书的文件ID */
    @Excel(name = "录取通知书的文件ID")
    private String admissionNoticeFileId;

    /** 身份证正面文件ID */
    @Excel(name = "身份证正面文件ID")
    private String idCardFrontFileId;

    /** 身份证反面文件ID */
    @Excel(name = "身份证反面文件ID")
    private String idCardBackFileId;

    /** 付款类型 1.微信 2.支付宝 3.银行卡 */
    @Excel(name = "付款类型 1.微信 2.支付宝 3.银行卡")
    private Integer paymentType;

    /** 绑卡人姓名 */
    @Excel(name = "绑卡人姓名")
    private String cardHolder;

    /** 卡号 */
    @Excel(name = "卡号")
    private String cardNumber;

    /** 金额，最多15位数，小数点后2位 */
    @Excel(name = "金额，最多15位数，小数点后2位")
    private BigDecimal amount;

    /** 付款状态 1.待付款 2.已付款 3.失败等 */
    @Excel(name = "付款状态 1.待付款 2.已付款 3.失败等")
    private Integer paymentStatus;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 创建者ID */
    @Excel(name = "创建者ID")
    private Long createId;

    /** 更新者ID */
    @Excel(name = "更新者ID")
    private Long updateId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setAgreementFileId(String agreementFileId) 
    {
        this.agreementFileId = agreementFileId;
    }

    public String getAgreementFileId() 
    {
        return agreementFileId;
    }
    public void setAdmissionNoticeFileId(String admissionNoticeFileId) 
    {
        this.admissionNoticeFileId = admissionNoticeFileId;
    }

    public String getAdmissionNoticeFileId() 
    {
        return admissionNoticeFileId;
    }
    public void setIdCardFrontFileId(String idCardFrontFileId) 
    {
        this.idCardFrontFileId = idCardFrontFileId;
    }

    public String getIdCardFrontFileId() 
    {
        return idCardFrontFileId;
    }
    public void setIdCardBackFileId(String idCardBackFileId) 
    {
        this.idCardBackFileId = idCardBackFileId;
    }

    public String getIdCardBackFileId() 
    {
        return idCardBackFileId;
    }
    public void setPaymentType(Integer paymentType) 
    {
        this.paymentType = paymentType;
    }

    public Integer getPaymentType() 
    {
        return paymentType;
    }
    public void setCardHolder(String cardHolder) 
    {
        this.cardHolder = cardHolder;
    }

    public String getCardHolder() 
    {
        return cardHolder;
    }
    public void setCardNumber(String cardNumber) 
    {
        this.cardNumber = cardNumber;
    }

    public String getCardNumber() 
    {
        return cardNumber;
    }
    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }
    public void setPaymentStatus(Integer paymentStatus) 
    {
        this.paymentStatus = paymentStatus;
    }

    public Integer getPaymentStatus() 
    {
        return paymentStatus;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }
    public void setCreateId(Long createId) 
    {
        this.createId = createId;
    }

    public Long getCreateId() 
    {
        return createId;
    }
    public void setUpdateId(Long updateId) 
    {
        this.updateId = updateId;
    }

    public Long getUpdateId() 
    {
        return updateId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("agreementFileId", getAgreementFileId())
            .append("admissionNoticeFileId", getAdmissionNoticeFileId())
            .append("idCardFrontFileId", getIdCardFrontFileId())
            .append("idCardBackFileId", getIdCardBackFileId())
            .append("paymentType", getPaymentType())
            .append("cardHolder", getCardHolder())
            .append("cardNumber", getCardNumber())
            .append("amount", getAmount())
            .append("paymentStatus", getPaymentStatus())
            .append("delFlag", getDelFlag())
            .append("createId", getCreateId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateId", getUpdateId())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
