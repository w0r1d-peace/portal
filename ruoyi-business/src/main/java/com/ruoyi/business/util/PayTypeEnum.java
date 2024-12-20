package com.ruoyi.business.util;

/**
 * 支付类型的常量
 */
public enum PayTypeEnum {

    W01("W01", "微信扫码支付"), A01("A01", "支付宝扫码支付");

    private String code;

    private String name;

    PayTypeEnum(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public static boolean existsByCode(String code) {
        if (code == null) {
            return false;
        }

        for (PayTypeEnum payTypeEnum : PayTypeEnum.values()) {
            if (payTypeEnum.getCode().equals(code)) {
                return true;
            }
        }
        return false;
    }
}
