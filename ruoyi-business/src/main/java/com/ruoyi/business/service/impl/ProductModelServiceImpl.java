package com.ruoyi.business.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.ProductModelMapper;
import com.ruoyi.business.domain.ProductModel;
import com.ruoyi.business.service.IProductModelService;
import com.ruoyi.common.core.text.Convert;

/**
 * 产品型号Service业务层处理
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@Service
public class ProductModelServiceImpl implements IProductModelService
{
    @Autowired
    private ProductModelMapper productModelMapper;

    /**
     * 查询产品型号
     *
     * @param id 产品型号主键
     * @return 产品型号
     */
    @Override
    public ProductModel selectProductModelById(Long id)
    {
        return productModelMapper.selectProductModelById(id);
    }

    /**
     * 查询产品型号列表
     *
     * @param productModel 产品型号
     * @return 产品型号
     */
    @Override
    public List<ProductModel> selectProductModelList(ProductModel productModel)
    {
        return productModelMapper.selectProductModelList(productModel);
    }

    /**
     * 新增产品型号
     *
     * @param productModel 产品型号
     * @return 结果
     */
    @Override
    public int insertProductModel(ProductModel productModel)
    {
        productModel.setCreateTime(DateUtils.getNowDate());
        return productModelMapper.insertProductModel(productModel);
    }

    /**
     * 修改产品型号
     *
     * @param productModel 产品型号
     * @return 结果
     */
    @Override
    public int updateProductModel(ProductModel productModel)
    {
        productModel.setUpdateTime(DateUtils.getNowDate());
        return productModelMapper.updateProductModel(productModel);
    }

    /**
     * 批量删除产品型号
     *
     * @param ids 需要删除的产品型号主键
     * @return 结果
     */
    @Override
    public int deleteProductModelByIds(String ids)
    {
        return productModelMapper.deleteProductModelByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除产品型号信息
     *
     * @param id 产品型号主键
     * @return 结果
     */
    @Override
    public int deleteProductModelById(Long id)
    {
        return productModelMapper.deleteProductModelById(id);
    }
}
