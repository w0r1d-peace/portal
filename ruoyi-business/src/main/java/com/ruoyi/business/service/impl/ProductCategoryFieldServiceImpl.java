package com.ruoyi.business.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.business.domain.vo.ProductCategoryFieldVO;
import com.ruoyi.business.util.Constants;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.ProductCategoryFieldMapper;
import com.ruoyi.business.domain.ProductCategoryField;
import com.ruoyi.business.service.IProductCategoryFieldService;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

/**
 * 产品字段配置Service业务层处理
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@Service
public class ProductCategoryFieldServiceImpl implements IProductCategoryFieldService
{
    @Autowired
    private ProductCategoryFieldMapper productCategoryFieldMapper;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * 查询产品字段配置
     *
     * @param id 产品字段配置主键
     * @return 产品字段配置
     */
    @Override
    public ProductCategoryField selectProductFieldById(Long id)
    {
        return productCategoryFieldMapper.selectProductCategoryFieldById(id);
    }

    /**
     * 查询产品字段配置列表
     *
     * @param productCategoryField 产品字段配置
     * @return 产品字段配置
     */
    @Override
    public List<ProductCategoryField> selectProductFieldList(ProductCategoryField productCategoryField)
    {
        return productCategoryFieldMapper.selectProductCategoryFieldList(productCategoryField);
    }

    /**
     * 新增产品字段配置
     *
     * @param productCategoryField 产品字段配置
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertProductField(ProductCategoryField productCategoryField)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        productCategoryField.setCreateBy(user.getUserName());
        productCategoryField.setCreateTime(DateUtils.getNowDate());
        productCategoryFieldMapper.insertProductCategoryField(productCategoryField);
        Long id = productCategoryField.getId();
        String columnName = Constants.COLUMN_NAME_PREFIX + id;
        // 根据参数给产品信号表增加字段
        String alterSql = String.format("ALTER TABLE t_product_model ADD %s VARCHAR(32) COMMENT '%s'", columnName, productCategoryField.getFieldName());
        jdbcTemplate.execute(alterSql);
        return true;
    }

    /**
     * 修改产品字段配置
     *
     * @param productCategoryField 产品字段配置
     * @return 结果
     */
    @Override
    public boolean updateProductField(ProductCategoryField productCategoryField)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        productCategoryField.setUpdateBy(user.getUserName());
        productCategoryField.setUpdateTime(DateUtils.getNowDate());
        productCategoryFieldMapper.updateProductCategoryField(productCategoryField);
        return true;
    }

    /**
     * 批量删除产品字段配置
     *
     * @param idList 需要删除的产品字段配置主键
     * @return 结果
     */
    @Override
    public boolean deleteProductFieldByIds(List<Integer> idList)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        productCategoryFieldMapper.deleteProductCategoryFieldByIds(idList, user.getUserName());

        for (Integer id : idList) {
            String columnName = Constants.COLUMN_NAME_PREFIX + id;
            String dropSql = String.format("ALTER TABLE t_product_model DROP COLUMN %s", columnName);
            jdbcTemplate.execute(dropSql);
        }

        return true;
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
        return productCategoryFieldMapper.deleteProductCategoryFieldById(id);
    }

    /**
     * 根据产品种类ID获取产品字段
     * @param productCategoryId
     * @return
     */
    @Override
    public List<ProductCategoryFieldVO> getByProductCategoryId(Long productCategoryId) {
        ProductCategoryField productCategoryField = new ProductCategoryField();
        productCategoryField.setProductCategoryId(productCategoryId);
        List<ProductCategoryField> productCategoryFieldList = productCategoryFieldMapper.selectProductCategoryFieldList(productCategoryField);
        List<ProductCategoryFieldVO> productCategoryFieldVOList = new ArrayList<>();
        for (ProductCategoryField field : productCategoryFieldList) {
            ProductCategoryFieldVO vo = new ProductCategoryFieldVO();
            BeanUtils.copyProperties(field, vo);
            vo.setColumnName(Constants.COLUMN_NAME_PREFIX + field.getId());
            productCategoryFieldVOList.add(vo);
        }

        return productCategoryFieldVOList;
    }
}
