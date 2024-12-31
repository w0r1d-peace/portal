package com.ruoyi.business.domain.vo;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;


@Data
public class CarouselListVO extends BaseEntity {

    /** 新闻ID，唯一标识 */
    private Long id;


    /** 图片文件ID */
    private Integer imageFileId;

    /**
     * 图片文件路径
     */
    private String imageFilePath;

    /**
     * 排序
     */
    private Integer sort;
}
