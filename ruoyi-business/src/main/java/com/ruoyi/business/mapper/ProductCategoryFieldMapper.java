package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.ProductCategoryField;
import org.apache.ibatis.annotations.Param;

/**
 * 产品字段配置Mapper接口
 *
 * @author tangJM.
 * @date 2024-12-05
 */
public interface ProductCategoryFieldMapper
{
    /**
     * 查询产品字段配置
     *
     * @param id 产品字段配置主键
     * @return 产品字段配置
     */
    public ProductCategoryField selectProductCategoryFieldById(Long id);

    /**
     * 查询产品字段配置列表
     *
     * @param productCategoryField 产品字段配置
     * @return 产品字段配置集合
     */
    public List<ProductCategoryField> selectProductCategoryFieldList(ProductCategoryField productCategoryField);

    /**
     * 新增产品字段配置
     *
     * @param productCategoryField 产品字段配置
     * @return 结果
     */
    public int insertProductCategoryField(ProductCategoryField productCategoryField);

    /**
     * 修改产品字段配置
     *
     * @param productCategoryField 产品字段配置
     * @return 结果
     */
    public int updateProductCategoryField(ProductCategoryField productCategoryField);

    /**
     * 删除产品字段配置
     *
     * @param id 产品字段配置主键
     * @return 结果
     */
    public int deleteProductCategoryFieldById(Long id);

    /**
     * 批量删除产品字段配置
     *
     * @param idList 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProductCategoryFieldByIds(@Param("idList") List<Integer> idList, @Param("updateBy") String updateBy);
}
