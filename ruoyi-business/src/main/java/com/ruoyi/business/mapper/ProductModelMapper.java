package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.ProductModel;
import org.apache.ibatis.annotations.Param;

/**
 * 产品型号Mapper接口
 *
 * @author tangJM.
 * @date 2024-12-05
 */
public interface ProductModelMapper
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
     * 删除产品型号
     *
     * @param id 产品型号主键
     * @return 结果
     */
    public int deleteProductModelById(Long id);

    /**
     * 批量删除产品型号
     *
     * @param idList 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProductModelByIds(@Param("idList") List<Integer> idList, @Param("updateBy") String updateBy);
}
