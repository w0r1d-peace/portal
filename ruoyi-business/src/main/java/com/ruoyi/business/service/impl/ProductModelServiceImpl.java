package com.ruoyi.business.service.impl;

import java.util.*;
import java.util.stream.Collectors;

import com.ruoyi.business.domain.ProductField;
import com.ruoyi.business.mapper.ProductFieldMapper;
import com.ruoyi.business.util.Constants;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.exception.ServiceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.ProductModelMapper;
import com.ruoyi.business.domain.ProductModel;
import com.ruoyi.business.service.IProductModelService;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

/**
 * 产品型号Service业务层处理
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@Service
public class ProductModelServiceImpl implements IProductModelService
{
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

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
                filterColumns.append(" AND ").append("pm.").append(k).append(" IN (");
                String placeholders = String.join(",", Collections.nCopies(values.length, "?"));
                filterColumns.append(placeholders).append(")");
                paramsList.addAll(Arrays.asList(values));
            }
        });

        String queryProductModelSql = String.format(
                "SELECT pm.id, pm.product_id AS productId, pm.category, pm.packet, pm.model_number AS modelNumber, pm.pdf_file_id AS pdfFileId, CONCAT(f.uuid,'.',f.extension) AS pdfFilePath, pm.is_in_stock AS isInStock, pm.is_new AS isNew, pm.create_by AS createBy, pm.create_time AS createTime %s FROM t_product_model pm LEFT JOIN t_file f ON pm.pdf_file_id = f.id WHERE pm.product_id = ? %s AND pm.del_flag = 0",
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
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        String userName = user.getUserName();

        Long productId = Long.parseLong(info.get("productId").toString());
        List<ProductField> productFieldList = getProductFieldListByProductId(productId);

        NamedParameterJdbcTemplate namedJdbc = new NamedParameterJdbcTemplate(jdbcTemplate);
        Map<String, Object> params = new HashMap<>();
        params.put("productId", info.get("productId"));
        params.put("modelNumber", info.get("modelNumber"));
        params.put("category", info.get("category"));
        params.put("packet", info.get("packet"));
        params.put("pdfFileId", info.get("pdfFileId"));
        params.put("isInStock", info.get("isInStock"));
        params.put("isNew", info.get("isNew"));
        params.put("createBy", userName);
        StringBuilder insertSqlSb = new StringBuilder("INSERT INTO t_product_model(`product_id`, `model_number`, `category`, `packet`, `pdf_file_id`, `is_in_stock`, `is_new`, `del_flag`, `create_by`, `create_time` %s) VALUES (:productId, :modelNumber, :category, :packet, :pdfFileId, :isInStock, :isNew, '0', :createBy, NOW() %s)");
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

        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        String userName = user.getUserName();
        List<ProductField> productFieldList = getProductFieldListByProductId(productModel.getProductId());

        NamedParameterJdbcTemplate namedJdbc = new NamedParameterJdbcTemplate(jdbcTemplate);
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("modelNumber", info.get("modelNumber"));
        params.put("category", info.get("category"));
        params.put("packet", info.get("packet"));
        params.put("pdfFileId", info.get("pdfFileId"));
        params.put("isInStock", info.get("isInStock"));
        params.put("isNew", info.get("isNew"));
        params.put("updateBy", userName);
        StringBuilder updateSqlSb = new StringBuilder("UPDATE t_product_model SET model_number=:modelNumber, category=:category, packet=:packet, pdf_file_id=:pdfFileId, is_in_stock=:isInStock, is_new=:isNew, update_by=:updateBy, update_time=NOW() %s WHERE id=:id");
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
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
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

        StringBuilder showColumns = new StringBuilder();
        String querySql = "SELECT category, packet %s FROM t_product_model WHERE product_id = ? %s GROUP BY category, packet %s";
        for (ProductField field : productFieldList) {
            Long id = field.getId();
            String columnName = Constants.COLUMN_NAME_PREFIX + id;
            showColumns.append(", ").append(columnName);
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

        querySql = String.format(querySql, showColumns, filterColumns, showColumns);

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
    public List<Map<String, Object>> search(String keyword) {
        ProductField productField = new ProductField();
        List<ProductField> productFieldList = productFieldMapper.selectProductFieldList(productField);

        String querySql = "SELECT pm.id, pm.model_number AS modelNumber, pm.category, pm.packet, pm.pdf_file_id AS pdfFileId, " +
                " p.id AS productId, p.name AS productName, p.catalogue AS productCatalogue FROM t_product_model pm " +
                " LEFT JOIN t_product p ON p.id = pm.product_id " +
                " WHERE (pm.model_number LIKE CONCAT('%', :keyword, '%') " +
                " OR pm.category LIKE CONCAT('%', :keyword, '%') " +
                " OR pm.packet LIKE CONCAT('%', :keyword, '%') " +
                " OR p.name LIKE CONCAT('%', :keyword, '%') " +
                " OR p.catalogue LIKE CONCAT('%', :keyword, '%')) ";

        StringBuilder whereSql = new StringBuilder();
        for (ProductField p : productFieldList) {
            Long id = p.getId();
            String columnName = Constants.COLUMN_NAME_PREFIX + id;
            whereSql.append(" OR ").append("pm.").append(columnName).append(" LIKE CONCAT('%', :keyword, '%') ");
        }

        // 动态拼接 WHERE 子句
        String sql = querySql + whereSql;

        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);

        NamedParameterJdbcTemplate namedJdbc = new NamedParameterJdbcTemplate(jdbcTemplate);

        try {
            return namedJdbc.queryForList(sql, params);
        } catch (Exception e) {
            logger.error("Error executing search query: {}", sql, e);
            throw new ServiceException("查询异常，请联系管理员");
        }
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
