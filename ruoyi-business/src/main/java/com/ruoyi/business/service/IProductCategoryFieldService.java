package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.ProductCategoryField;
import com.ruoyi.business.domain.vo.ProductCategoryFieldVO;

/**
 * 产品字段配置Service接口
 *
 * @author tangJM.
 * @date 2024-12-05
 */
public interface IProductCategoryFieldService
{
    /**
     * 查询产品字段配置
     *
     * @param id 产品字段配置主键
     * @return 产品字段配置
     */
    public ProductCategoryField selectProductFieldById(Long id);

    /**
     * 查询产品字段配置列表
     *
     * @param productCategoryField 产品字段配置
     * @return 产品字段配置集合
     */
    public List<ProductCategoryField> selectProductFieldList(ProductCategoryField productCategoryField);

    /**
     * 新增产品字段配置
     *
     * @param productCategoryField 产品字段配置
     * @return 结果
     */
    public boolean insertProductField(ProductCategoryField productCategoryField);

    /**
     * 修改产品字段配置
     *
     * @param productCategoryField 产品字段配置
     * @return 结果
     */
    public boolean updateProductField(ProductCategoryField productCategoryField);

    /**
     * 批量删除产品字段配置
     *
     * @param idList 需要删除的产品字段配置主键集合
     * @return 结果
     */
    public boolean deleteProductFieldByIds(List<Integer> idList);

    /**
     * 删除产品字段配置信息
     *
     * @param id 产品字段配置主键
     * @return 结果
     */
    public int deleteProductFieldById(Long id);

    /**
     * 根据ID获取产品字段
     * @param productId
     * @return
     */
    List<ProductCategoryFieldVO> getByProductCategoryId(Long productId);
}
