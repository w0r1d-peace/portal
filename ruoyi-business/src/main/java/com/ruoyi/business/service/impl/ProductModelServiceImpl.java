package com.ruoyi.business.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.business.domain.ProductField;
import com.ruoyi.business.mapper.ProductFieldMapper;
import com.ruoyi.business.util.Constants;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.ProductModelMapper;
import com.ruoyi.business.domain.ProductModel;
import com.ruoyi.business.service.IProductModelService;

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

    @Autowired
    private ProductFieldMapper productFieldMapper;

    @Autowired
    private JdbcTemplate jdbcTemplate;

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
    public List<Map<String, Object>> selectProductModelList(ProductModel productModel)
    {
        Long productId = productModel.getProductId();
        List<ProductField> productFieldList = getProductFieldListByProductId(productId);


        StringBuilder sb = new StringBuilder();
        for (ProductField productField : productFieldList) {
            String key = Constants.COLUMN_NAME_PREFIX + productField.getId();
            sb.append(", ").append(key);
        }

        String queryProductModelSql = String.format("SELECT id, product_id AS productId, model_number AS modelNumber, pdf_url AS pdfUrl, is_in_stock AS isInStock, is_new AS isNew, create_by AS createBy, create_time AS createTime %s FROM t_product_model WHERE product_id = ? AND del_flag = 0", sb);
        List<Map<String, Object>> mapList = jdbcTemplate.queryForList(queryProductModelSql, productId);

        return mapList;

    }

    /**
     * 新增产品型号
     *
     * @param info 产品型号
     * @return 结果
     */
    @Override
    public boolean insertProductModel(Map<String, Object> info)
    {
        SysUser user = ShiroUtils.getSysUser();
        String userName = user.getUserName();

        Long productId = Long.parseLong(info.get("productId").toString());
        List<ProductField> productFieldList = getProductFieldListByProductId(productId);

        NamedParameterJdbcTemplate namedJdbc = new NamedParameterJdbcTemplate(jdbcTemplate);
        Map<String, Object> params = new HashMap<>();
        params.put("productId", info.get("productId"));
        params.put("modelNumber", info.get("modelNumber"));
        params.put("pdfUrl", info.get("pdfUrl"));
        params.put("isInStock", info.get("isInStock"));
        params.put("isNew", info.get("isNew"));
        params.put("createBy", userName);
        StringBuilder insertSqlSb = new StringBuilder("INSERT INTO t_product_model(`product_id`, `model_number`, `pdf_url`, `is_in_stock`, `is_new`, `del_flag`, `create_by`, `create_time` %s) VALUES (:productId, :modelNumber, :pdfUrl, :isInStock, :isNew, '0', :createBy, NOW() %s)");
        StringBuilder fieldSqlSb = new StringBuilder();
        StringBuilder valueSqlSb = new StringBuilder();
        for (ProductField productField : productFieldList) {
            String key = Constants.COLUMN_NAME_PREFIX + productField.getId();
            if (info.containsKey(key)) {
                fieldSqlSb.append(String.format(", %s", key));
                valueSqlSb.append(String.format(", :%s", key));
                params.put(key, info.get(key));
            }
        }

        String insertSql = String.format(insertSqlSb.toString(), fieldSqlSb, valueSqlSb);
        namedJdbc.update(insertSql, params);
        return true;
    }

    /**
     * 修改产品型号
     *
     * @param info 产品型号
     * @return 结果
     */
    @Override
    public boolean updateProductModel(Map<String, Object> info)
    {
        SysUser user = ShiroUtils.getSysUser();
        String userName = user.getUserName();
        Long productId = Long.parseLong(info.get("productId").toString());
        List<ProductField> productFieldList = getProductFieldListByProductId(productId);

        NamedParameterJdbcTemplate namedJdbc = new NamedParameterJdbcTemplate(jdbcTemplate);
        Map<String, Object> params = new HashMap<>();
        params.put("id", info.get("id"));
        params.put("modelNumber", info.get("modelNumber"));
        params.put("pdfUrl", info.get("pdfUrl"));
        params.put("isInStock", info.get("isInStock"));
        params.put("isNew", info.get("isNew"));
        params.put("updateBy", userName);
        StringBuilder updateSqlSb = new StringBuilder("UPDATE t_product_model SET model_number=:modelNumber, pdf_url=:pdfUrl, is_in_stock=:isInStock, is_new=:isNew, update_by=:updateBy, update_time=NOW() %s WHERE id=:id");
        StringBuilder fieldValueSqlSb = new StringBuilder();
        for (ProductField productField : productFieldList) {
            String key = Constants.COLUMN_NAME_PREFIX + productField.getId();
            fieldValueSqlSb.append(", ").append(key).append("=:").append(key);
            params.put(key, info.get(key));
        }

        String updateSql = String.format(updateSqlSb.toString(), fieldValueSqlSb);
        namedJdbc.update(updateSql, params);
        return true;
    }

    /**
     * 批量删除产品型号
     *
     * @param idList 需要删除的产品型号主键
     * @return 结果
     */
    @Override
    public int deleteProductModelByIds(List<Integer> idList)
    {
        SysUser user = ShiroUtils.getSysUser();
        String userName = user.getUserName();
        return productModelMapper.deleteProductModelByIds(idList, userName);
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


    /**
     * 根据产品ID获取产品型号列表
     * @param productId
     * @return
     */
    private List<ProductField> getProductFieldListByProductId(Long productId) {
        ProductField productField = new ProductField();
        productField.setProductId(productId);
        productField.setDelFlag("0");
        return productFieldMapper.selectProductFieldList(productField);
    }
}
