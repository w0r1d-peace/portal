package com.ruoyi.business.service.impl;

import java.util.*;
import java.util.stream.Collectors;

import com.ruoyi.business.domain.ProductField;
import com.ruoyi.business.mapper.ProductFieldMapper;
import com.ruoyi.business.util.Constants;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.exception.ServiceException;
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
     * @param info
     * @return 产品型号
     */
    @Override
    public List<Map<String, Object>> selectProductModelList(Map<String, Object> info)
    {
        Long productId = Long.parseLong(info.get("productId").toString());
        List<ProductField> productFieldList = getProductFieldListByProductId(productId);

        StringBuilder showColumns = new StringBuilder();
        for (ProductField productField : productFieldList) {
            String key = Constants.COLUMN_NAME_PREFIX + productField.getId();
            showColumns.append(", ").append(key);
        }

        StringBuilder filterColumns = new StringBuilder();
        List<Object> paramsList = new ArrayList<>();

        info.remove("productId");
        // 动态生成查询条件
        info.forEach((k, v) -> {
            if (v != null && !v.toString().isEmpty()) {
                String[] values = v.toString().split(",");
                filterColumns.append(" AND ").append(k).append(" IN (");
                String placeholders = String.join(",", Collections.nCopies(values.length, "?"));
                filterColumns.append(placeholders).append(")");
                paramsList.addAll(Arrays.asList(values));
            }
        });

        String queryProductModelSql = String.format(
                "SELECT id, product_id AS productId, model_number AS modelNumber, pdf_file_id AS pdfFileId, is_in_stock AS isInStock, is_new AS isNew, create_by AS createBy, create_time AS createTime %s FROM t_product_model WHERE product_id = ? %s AND del_flag = 0",
                showColumns, filterColumns
        );

        paramsList.add(0, productId);

        List<Map<String, Object>> mapList = jdbcTemplate.queryForList(queryProductModelSql, paramsList.toArray());
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
        params.put("pdfFileId", info.get("pdfFileId"));
        params.put("isInStock", info.get("isInStock"));
        params.put("isNew", info.get("isNew"));
        params.put("createBy", userName);
        StringBuilder insertSqlSb = new StringBuilder("INSERT INTO t_product_model(`product_id`, `model_number`, `pdf_file_id`, `is_in_stock`, `is_new`, `del_flag`, `create_by`, `create_time` %s) VALUES (:productId, :modelNumber, :pdfFileId, :isInStock, :isNew, '0', :createBy, NOW() %s)");
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
        Long id = Long.parseLong(info.get("id").toString());
        ProductModel productModel = productModelMapper.selectProductModelById(id);
        if (productModel == null) {
            throw new ServiceException("产品型号不存在");
        }

        SysUser user = ShiroUtils.getSysUser();
        String userName = user.getUserName();
        List<ProductField> productFieldList = getProductFieldListByProductId(productModel.getProductId());

        NamedParameterJdbcTemplate namedJdbc = new NamedParameterJdbcTemplate(jdbcTemplate);
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("modelNumber", info.get("modelNumber"));
        params.put("pdfFileId", info.get("pdfFileId"));
        params.put("isInStock", info.get("isInStock"));
        params.put("isNew", info.get("isNew"));
        params.put("updateBy", userName);
        StringBuilder updateSqlSb = new StringBuilder("UPDATE t_product_model SET model_number=:modelNumber, pdf_file_id=:pdfFileId, is_in_stock=:isInStock, is_new=:isNew, update_by=:updateBy, update_time=NOW() %s WHERE id=:id");
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
     * 获取筛选数据
     * @param info
     * @return
     */
    @Override
    public Map<String, List<String>> getFilterData(Map<String, Object> info) {
        Long productId = Long.parseLong(info.get("productId").toString());
        ProductField productField = new ProductField();
        productField.setProductId(productId);
        productField.setIsFilter(1);
        List<ProductField> productFieldList = productFieldMapper.selectProductFieldList(productField);

        if (productFieldList.isEmpty()) {
            return new HashMap<>();
        }

        StringBuilder showColumns = new StringBuilder();
        String querySql = "SELECT %s FROM t_product_model WHERE product_id = ? %s GROUP BY %s";
        for (ProductField field : productFieldList) {
            Long id = field.getId();
            String columnName = Constants.COLUMN_NAME_PREFIX + id;
            showColumns.append(columnName).append(", ");
        }

        StringBuilder filterColumns = new StringBuilder();
        List<Object> paramsList = new ArrayList<>();

        info.remove("productId");
        // 动态生成查询条件
        info.forEach((k, v) -> {
            if (v != null && !v.toString().isEmpty()) {
                String[] values = v.toString().split(",");
                filterColumns.append(" AND ").append(k).append(" IN (");
                String placeholders = String.join(",", Collections.nCopies(values.length, "?"));
                filterColumns.append(placeholders).append(")");
                paramsList.addAll(Arrays.asList(values));
            }
        });

        String showColumnsStr = showColumns.substring(0, showColumns.length() - 2);
        querySql = String.format(querySql, showColumnsStr, filterColumns, showColumnsStr);

        paramsList.add(0, productId);
        List<Map<String, Object>> mapList = jdbcTemplate.queryForList(querySql, paramsList.toArray());

        // 存储去重后的结果
        Map<String, Set<String>> uniqueColumns = new LinkedHashMap<>();

        // 遍历数据列表并对每列进行去重
        for (Map<String, Object> row : mapList) {
            for (Map.Entry<String, Object> entry : row.entrySet()) {
                String columnName = entry.getKey();
                String value = entry.getValue().toString(); // 确保转为字符串

                // 如果列名未在结果中，初始化一个Set
                uniqueColumns.putIfAbsent(columnName, new LinkedHashSet<>());

                // 将当前值添加到对应列的Set中
                uniqueColumns.get(columnName).add(value);
            }
        }

        // 转换为目标格式：Map<String, List<String>>
        Map<String, List<String>> result = uniqueColumns.entrySet().stream()
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        entry -> new ArrayList<>(entry.getValue()),
                        (e1, e2) -> e1, // 处理冲突
                        LinkedHashMap::new // 保持顺序
                ));

        return result;
    }

    @Override
    public Object search(String keyword) {
        return null;
    }


    /**
     * 根据产品ID获取产品型号列表
     * @param productId
     * @return
     */
    private List<ProductField> getProductFieldListByProductId(Long productId) {
        ProductField productField = new ProductField();
        productField.setProductId(productId);
        return productFieldMapper.selectProductFieldList(productField);
    }
}
