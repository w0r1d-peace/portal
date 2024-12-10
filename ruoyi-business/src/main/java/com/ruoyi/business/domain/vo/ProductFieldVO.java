package com.ruoyi.business.domain.vo;


import lombok.Data;

import java.util.Date;

@Data
public class ProductFieldVO {

    /**
     * ID
     */
    private Long id;

    /**
     * 字段名称
     */
    private String fieldName;

    /**
     * 列名称
     */
    private String columnName;

    /** 排序 */
    private Integer sort;

    /** 是否筛选 */
    private Integer isFilter;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Date createTime;
}
