package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.ProductModel;

/**
 * 产品型号Service接口
 *
 * @author tangJM.
 * @date 2024-12-05
 */
public interface IProductModelService
{
    /**
     * 查询产品型号
     *
     * @param id 产品型号主键
     * @return 产品型号
     */
    public ProductModel selectProductModelById(Long id);

    /**
     * 查询产品型号列表
     *
     * @param productModel 产品型号
     * @return 产品型号集合
     */
    public List<ProductModel> selectProductModelList(ProductModel productModel);

    /**
     * 新增产品型号
     *
     * @param productModel 产品型号
     * @return 结果
     */
    public int insertProductModel(ProductModel productModel);

    /**
     * 修改产品型号
     *
     * @param productModel 产品型号
     * @return 结果
     */
    public int updateProductModel(ProductModel productModel);

    /**
     * 批量删除产品型号
     *
     * @param ids 需要删除的产品型号主键集合
     * @return 结果
     */
    public int deleteProductModelByIds(String ids);

    /**
     * 删除产品型号信息
     *
     * @param id 产品型号主键
     * @return 结果
     */
    public int deleteProductModelById(Long id);
}
