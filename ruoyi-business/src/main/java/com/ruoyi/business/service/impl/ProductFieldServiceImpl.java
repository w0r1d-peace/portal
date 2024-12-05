package com.ruoyi.business.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.ProductFieldMapper;
import com.ruoyi.business.domain.ProductField;
import com.ruoyi.business.service.IProductFieldService;
import com.ruoyi.common.core.text.Convert;

/**
 * 产品字段配置Service业务层处理
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@Service
public class ProductFieldServiceImpl implements IProductFieldService
{
    @Autowired
    private ProductFieldMapper productFieldMapper;

    /**
     * 查询产品字段配置
     *
     * @param id 产品字段配置主键
     * @return 产品字段配置
     */
    @Override
    public ProductField selectProductFieldById(Long id)
    {
        return productFieldMapper.selectProductFieldById(id);
    }

    /**
     * 查询产品字段配置列表
     *
     * @param productField 产品字段配置
     * @return 产品字段配置
     */
    @Override
    public List<ProductField> selectProductFieldList(ProductField productField)
    {
        return productFieldMapper.selectProductFieldList(productField);
    }

    /**
     * 新增产品字段配置
     *
     * @param productField 产品字段配置
     * @return 结果
     */
    @Override
    public int insertProductField(ProductField productField)
    {
        productField.setCreateTime(DateUtils.getNowDate());
        return productFieldMapper.insertProductField(productField);
    }

    /**
     * 修改产品字段配置
     *
     * @param productField 产品字段配置
     * @return 结果
     */
    @Override
    public int updateProductField(ProductField productField)
    {
        productField.setUpdateTime(DateUtils.getNowDate());
        return productFieldMapper.updateProductField(productField);
    }

    /**
     * 批量删除产品字段配置
     *
     * @param ids 需要删除的产品字段配置主键
     * @return 结果
     */
    @Override
    public int deleteProductFieldByIds(String ids)
    {
        return productFieldMapper.deleteProductFieldByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除产品字段配置信息
     *
     * @param id 产品字段配置主键
     * @return 结果
     */
    @Override
    public int deleteProductFieldById(Long id)
    {
        return productFieldMapper.deleteProductFieldById(id);
    }
}
