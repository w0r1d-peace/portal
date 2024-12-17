package com.ruoyi.business.mapper;

import java.util.Date;
import java.util.List;
import com.ruoyi.business.domain.ProductField;
import org.apache.ibatis.annotations.Param;

/**
 * 产品字段配置Mapper接口
 *
 * @author tangJM.
 * @date 2024-12-05
 */
public interface ProductFieldMapper
{
    /**
     * 查询产品字段配置
     *
     * @param id 产品字段配置主键
     * @return 产品字段配置
     */
    public ProductField selectProductFieldById(Long id);

    /**
     * 查询产品字段配置列表
     *
     * @param productField 产品字段配置
     * @return 产品字段配置集合
     */
    public List<ProductField> selectProductFieldList(ProductField productField);

    /**
     * 新增产品字段配置
     *
     * @param productField 产品字段配置
     * @return 结果
     */
    public int insertProductField(ProductField productField);

    /**
     * 修改产品字段配置
     *
     * @param productField 产品字段配置
     * @return 结果
     */
    public int updateProductField(ProductField productField);

    /**
     * 删除产品字段配置
     *
     * @param id 产品字段配置主键
     * @return 结果
     */
    public int deleteProductFieldById(Long id);

    /**
     * 批量删除产品字段配置
     *
     * @param idList 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProductFieldByIds(@Param("idList") List<Integer> idList, @Param("updateBy") String updateBy);
}
