package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.ProductMapper;
import com.ruoyi.business.domain.Product;
import com.ruoyi.business.service.IProductService;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

/**
 * 产品Service业务层处理
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@Service
public class ProductServiceImpl implements IProductService
{
    @Autowired
    private ProductMapper productMapper;

    /**
     * 查询产品
     *
     * @param id 产品主键
     * @return 产品
     */
    @Override
    public Product selectProductById(Long id)
    {
        return productMapper.selectProductById(id);
    }

    /**
     * 查询产品列表
     *
     * @param product 产品
     * @return 产品
     */
    @Override
    public List<Product> selectProductList(Product product)
    {
        return productMapper.selectProductList(product);
    }

    /**
     * 新增产品
     *
     * @param product 产品
     * @return 结果
     */
    @Override
    public int insertProduct(Product product)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        product.setCreateBy(user.getUserName());
        product.setCreateTime(DateUtils.getNowDate());
        return productMapper.insertProduct(product);
    }

    /**
     * 修改产品
     *
     * @param product 产品
     * @return 结果
     */
    @Override
    public int updateProduct(Product product)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        product.setUpdateBy(user.getUserName());
        product.setUpdateTime(DateUtils.getNowDate());
        return productMapper.updateProduct(product);
    }

    /**
     * 批量删除产品
     *
     * @param idList 需要删除的产品主键
     * @return 结果
     */
    @Override
    public int deleteProductByIds(List<Integer> idList)
    {
        return productMapper.deleteProductByIds(idList);
    }

    /**
     * 删除产品信息
     *
     * @param id 产品主键
     * @return 结果
     */
    @Override
    public int deleteProductById(Long id)
    {
        return productMapper.deleteProductById(id);
    }
}
