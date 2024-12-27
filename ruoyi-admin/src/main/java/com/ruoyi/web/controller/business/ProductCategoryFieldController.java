package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.dto.DeleteDTO;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.domain.ProductCategoryField;
import com.ruoyi.business.service.IProductCategoryFieldService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 产品字段配置Controller
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@RestController
@RequestMapping("/business/product/category/field")
public class ProductCategoryFieldController extends BaseController
{

    @Autowired
    private IProductCategoryFieldService productFieldService;

    /**
     * 查询产品字段配置列表
     */
    @GetMapping("/list")
    public TableDataInfo list(ProductCategoryField productCategoryField)
    {
        startPage();
        List<ProductCategoryField> list = productFieldService.selectProductFieldList(productCategoryField);
        return getDataTable(list);
    }

    /**
     * 根据产品种类ID查询产品字段
     */
    @GetMapping("/getByProductCategoryId")
    public AjaxResult getByProductCategoryId(Long productCategoryId)
    {
        if (productCategoryId == null) {
            throw new ServiceException("产品种类ID不能为空");
        }

        return AjaxResult.success(productFieldService.getByProductCategoryId(productCategoryId));
    }

    /**
     * 新增保存产品字段配置
     */
    @Log(title = "新增产品字段配置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult addSave(@RequestBody ProductCategoryField productCategoryField)
    {
        if (productCategoryField.getProductId() == null) {
            throw new ServiceException("产品ID不能为空");
        }
        if (productCategoryField.getProductCategoryId() == null) {
            throw new ServiceException("产品种类ID不能为空");
        }
        if (StringUtils.isBlank(productCategoryField.getFieldName())) {
            throw new ServiceException("字段名称不能为空");
        }
        if (productCategoryField.getSort() == null) {
            throw new ServiceException("排序不能为空");
        }
        if (productCategoryField.getIsFilter() == null) {
            throw new ServiceException("是否筛选不能为空");
        }
        return toAjax(productFieldService.insertProductField(productCategoryField));
    }

    /**
     * 修改保存产品字段配置
     */
    @Log(title = "修改产品字段配置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult editSave(@RequestBody ProductCategoryField productCategoryField)
    {
        if (productCategoryField.getId() == null) {
            throw new ServiceException("ID不能为空");
        }
        if (StringUtils.isBlank(productCategoryField.getFieldName())) {
            throw new ServiceException("字段名称不能为空");
        }
        if (productCategoryField.getSort() == null) {
            throw new ServiceException("排序不能为空");
        }
        if (productCategoryField.getIsFilter() == null) {
            throw new ServiceException("是否筛选不能为空");
        }
        return toAjax(productFieldService.updateProductField(productCategoryField));
    }

    /**
     * 删除产品字段配置
     */
    @Log(title = "删除产品字段配置", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    public AjaxResult remove(@RequestBody DeleteDTO dto)
    {
        if (dto.getIdList() == null || dto.getIdList().isEmpty()) {
            throw new ServiceException("请选择要删除的数据");
        }
        return toAjax(productFieldService.deleteProductFieldByIds(dto.getIdList()));
    }
}
