package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.ProductCategoryMapper;
import com.ruoyi.business.domain.ProductCategory;
import com.ruoyi.business.service.IProductCategoryService;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

/**
 * 产品种类Service业务层处理
 * 
 * @author tangJM.
 * @date 2024-12-27
 */
@Service
public class ProductCategoryServiceImpl implements IProductCategoryService 
{
    @Autowired
    private ProductCategoryMapper productCategoryMapper;

    /**
     * 查询产品种类
     * 
     * @param id 产品种类主键
     * @return 产品种类
     */
    @Override
    public ProductCategory selectProductCategoryById(Long id)
    {
        return productCategoryMapper.selectProductCategoryById(id);
    }

    /**
     * 查询产品种类列表
     * 
     * @param productCategory 产品种类
     * @return 产品种类
     */
    @Override
    public List<ProductCategory> selectProductCategoryList(ProductCategory productCategory)
    {
        return productCategoryMapper.selectProductCategoryList(productCategory);
    }

    /**
     * 新增产品种类
     * 
     * @param productCategory 产品种类
     * @return 结果
     */
    @Override
    public int insertProductCategory(ProductCategory productCategory)
    {
        productCategory.setCreateTime(DateUtils.getNowDate());
        return productCategoryMapper.insertProductCategory(productCategory);
    }

    /**
     * 修改产品种类
     * 
     * @param productCategory 产品种类
     * @return 结果
     */
    @Override
    public int updateProductCategory(ProductCategory productCategory)
    {
        productCategory.setUpdateTime(DateUtils.getNowDate());
        return productCategoryMapper.updateProductCategory(productCategory);
    }

    /**
     * 批量删除产品种类
     * 
     * @param idList 需要删除的产品种类主键
     * @return 结果
     */
    @Override
    public int deleteProductCategoryByIds(List<Integer> idList)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        return productCategoryMapper.deleteProductCategoryByIds(idList, user.getUserName());
    }

    /**
     * 删除产品种类信息
     * 
     * @param id 产品种类主键
     * @return 结果
     */
    @Override
    public int deleteProductCategoryById(Long id)
    {
        return productCategoryMapper.deleteProductCategoryById(id);
    }
}
