package com.ruoyi.business.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.business.domain.vo.ProductFieldVO;
import com.ruoyi.business.util.Constants;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.ProductFieldMapper;
import com.ruoyi.business.domain.ProductField;
import com.ruoyi.business.service.IProductFieldService;
import org.springframework.transaction.annotation.Transactional;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

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

    @Autowired
    private JdbcTemplate jdbcTemplate;

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
    @Transactional(rollbackFor = Exception.class)
    public boolean insertProductField(ProductField productField)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        productField.setCreateBy(user.getUserName());
        productField.setCreateTime(DateUtils.getNowDate());
        productFieldMapper.insertProductField(productField);
        Long id = productField.getId();
        String columnName = Constants.COLUMN_NAME_PREFIX + id;
        // 根据参数给产品信号表增加字段
        String alterSql = String.format("ALTER TABLE t_product_model ADD %s VARCHAR(255) COMMENT '%s'", columnName, productField.getFieldName());
        jdbcTemplate.execute(alterSql);

        return true;
    }

    /**
     * 修改产品字段配置
     *
     * @param productField 产品字段配置
     * @return 结果
     */
    @Override
    public boolean updateProductField(ProductField productField)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        productField.setUpdateBy(user.getUserName());
        productField.setUpdateTime(DateUtils.getNowDate());
        productFieldMapper.updateProductField(productField);
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
        productFieldMapper.deleteProductFieldByIds(idList, user.getUserName());

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
        return productFieldMapper.deleteProductFieldById(id);
    }

    /**
     * 根据产品ID获取产品字段
     * @param productId
     * @return
     */
    @Override
    public List<ProductFieldVO> getByProductId(Long productId) {
        ProductField productField = new ProductField();
        productField.setProductId(productId);
        List<ProductField> productFieldList = productFieldMapper.selectProductFieldList(productField);
        List<ProductFieldVO> productFieldVOList = new ArrayList<>();
        for (ProductField field : productFieldList) {
            ProductFieldVO vo = new ProductFieldVO();
            BeanUtils.copyProperties(field, vo);
            vo.setColumnName(Constants.COLUMN_NAME_PREFIX + field.getId());
            productFieldVOList.add(vo);
        }

        return productFieldVOList;
    }
}
