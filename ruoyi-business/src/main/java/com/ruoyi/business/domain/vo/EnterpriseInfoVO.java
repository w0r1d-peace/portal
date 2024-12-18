package com.ruoyi.business.domain.vo;

import com.ruoyi.common.annotation.Excel;
import lombok.Data;

@Data
public class EnterpriseInfoVO {


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
}
