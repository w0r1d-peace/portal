package com.ruoyi.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 支付二维码对象 t_pay_qr_code
 * 
 * @author tangJM.
 * @date 2024-12-20
 */
public class PayQrCode extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键
 */
    private Long id;

    /** 应用ID */
    @Excel(name = "应用ID")
    private String appid;

    /** 商户号 */
    @Excel(name = "商户号")
    private String cusid;

    /** 支付串 */
    @Excel(name = "支付串")
    private String payinfo;

    /** 随机字符串 */
    @Excel(name = "随机字符串")
    private String randomstr;

    /** 商户交易单号 */
    @Excel(name = "商户交易单号")
    private String reqsn;

    /** 返回码 */
    @Excel(name = "返回码")
    private String retcode;

    /** 签名 */
    @Excel(name = "签名")
    private String sign;

    /** 交易类型 */
    @Excel(name = "交易类型")
    private String trxcode;

    /** 交易单号 */
    @Excel(name = "交易单号")
    private String trxid;

    /** 交易状态 */
    @Excel(name = "交易状态")
    private String trxstatus;

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
    public void setAppid(String appid) 
    {
        this.appid = appid;
    }

    public String getAppid() 
    {
        return appid;
    }
    public void setCusid(String cusid) 
    {
        this.cusid = cusid;
    }

    public String getCusid() 
    {
        return cusid;
    }
    public void setPayinfo(String payinfo) 
    {
        this.payinfo = payinfo;
    }

    public String getPayinfo() 
    {
        return payinfo;
    }
    public void setRandomstr(String randomstr) 
    {
        this.randomstr = randomstr;
    }

    public String getRandomstr() 
    {
        return randomstr;
    }
    public void setReqsn(String reqsn) 
    {
        this.reqsn = reqsn;
    }

    public String getReqsn() 
    {
        return reqsn;
    }
    public void setRetcode(String retcode) 
    {
        this.retcode = retcode;
    }

    public String getRetcode() 
    {
        return retcode;
    }
    public void setSign(String sign) 
    {
        this.sign = sign;
    }

    public String getSign() 
    {
        return sign;
    }
    public void setTrxcode(String trxcode) 
    {
        this.trxcode = trxcode;
    }

    public String getTrxcode() 
    {
        return trxcode;
    }
    public void setTrxid(String trxid) 
    {
        this.trxid = trxid;
    }

    public String getTrxid() 
    {
        return trxid;
    }
    public void setTrxstatus(String trxstatus) 
    {
        this.trxstatus = trxstatus;
    }

    public String getTrxstatus() 
    {
        return trxstatus;
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
            .append("appid", getAppid())
            .append("cusid", getCusid())
            .append("payinfo", getPayinfo())
            .append("randomstr", getRandomstr())
            .append("reqsn", getReqsn())
            .append("retcode", getRetcode())
            .append("sign", getSign())
            .append("trxcode", getTrxcode())
            .append("trxid", getTrxid())
            .append("trxstatus", getTrxstatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
