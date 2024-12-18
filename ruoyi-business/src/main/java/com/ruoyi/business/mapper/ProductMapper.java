package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.Product;
import org.apache.ibatis.annotations.Param;

/**
 * 产品Mapper接口
 *
 * @author tangJM.
 * @date 2024-12-05
 */
public interface ProductMapper
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
     * 删除产品
     *
     * @param id 产品主键
     * @return 结果
     */
    public int deleteProductById(Long id);

    /**
     * 批量删除产品
     *
     * @param idList 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProductByIds(@Param("idList") List<Integer> idList);
}
