package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.ProductCategory;
import org.apache.ibatis.annotations.Param;

/**
 * 产品种类Mapper接口
 * 
 * @author tangJM.
 * @date 2024-12-27
 */
public interface ProductCategoryMapper 
{
    /**
     * 查询产品种类
     * 
     * @param id 产品种类主键
     * @return 产品种类
     */
    public ProductCategory selectProductCategoryById(Long id);

    /**
     * 查询产品种类列表
     * 
     * @param productCategory 产品种类
     * @return 产品种类集合
     */
    public List<ProductCategory> selectProductCategoryList(ProductCategory productCategory);

    /**
     * 新增产品种类
     * 
     * @param productCategory 产品种类
     * @return 结果
     */
    public int insertProductCategory(ProductCategory productCategory);

    /**
     * 修改产品种类
     * 
     * @param productCategory 产品种类
     * @return 结果
     */
    public int updateProductCategory(ProductCategory productCategory);

    /**
     * 删除产品种类
     * 
     * @param id 产品种类主键
     * @return 结果
     */
    public int deleteProductCategoryById(Long id);

    /**
     * 批量删除产品种类
     * 
     * @param idList 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProductCategoryByIds(@Param("idList") List<Integer> idList, @Param("updateBy") String updateBy);
}