package com.ruoyi.business.domain.vo;

import lombok.Data;

/**
 * 统一支付API实体类
 */
@Data
public class PayQrCodeVO {

    /**
     * 支付串
     */
    private String payinfo;

    /**
     * 随机字符串
     */
    private String randomstr;
}
