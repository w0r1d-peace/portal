package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.ProductField;
import com.ruoyi.business.domain.vo.ProductFieldVO;

/**
 * 产品字段配置Service接口
 *
 * @author tangJM.
 * @date 2024-12-05
 */
public interface IProductFieldService
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
    public boolean insertProductField(ProductField productField);

    /**
     * 修改产品字段配置
     *
     * @param productField 产品字段配置
     * @return 结果
     */
    public boolean updateProductField(ProductField productField);

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
    List<ProductFieldVO> getByProductId(Long productId);
}
