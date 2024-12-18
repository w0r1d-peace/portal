package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.Product;

/**
 * 产品Service接口
 *
 * @author tangJM.
 * @date 2024-12-05
 */
public interface IProductService
{
    /**
     * 查询产品
     *
     * @param id 产品主键
     * @return 产品
     */
    public Product selectProductById(Long id);

    /**
     * 查询产品列表
     *
     * @param product 产品
     * @return 产品集合
     */
    public List<Product> selectProductList(Product product);

    /**
     * 新增产品
     *
     * @param product 产品
     * @return 结果
     */
    public int insertProduct(Product product);

    /**
     * 修改产品
     *
     * @param product 产品
     * @return 结果
     */
    public int updateProduct(Product product);

    /**
     * 批量删除产品
     *
     * @param idList 需要删除的产品主键集合
     * @return 结果
     */
    public int deleteProductByIds(List<Integer> idList);

    /**
     * 删除产品信息
     *
     * @param id 产品主键
     * @return 结果
     */
    public int deleteProductById(Long id);
}
