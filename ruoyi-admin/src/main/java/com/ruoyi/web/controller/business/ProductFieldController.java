package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.dto.DeleteDTO;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.domain.ProductField;
import com.ruoyi.business.service.IProductFieldService;
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
@RequestMapping("/business/product/field")
public class ProductFieldController extends BaseController
{

    private String prefix = "business/product/field";

    @Autowired
    private IProductFieldService productFieldService;

    /**
     * 查询产品字段配置列表
     */
    @RequiresPermissions("business:field:list")
    @GetMapping("/list")
    public TableDataInfo list(ProductField productField)
    {
        startPage();
        List<ProductField> list = productFieldService.selectProductFieldList(productField);
        return getDataTable(list);
    }

    /**
     * 根据产品ID查询产品字段
     */
    @GetMapping("/getByProductId")
    public AjaxResult getByProductId(Long productId)
    {
        if (productId == null) {
            throw new ServiceException("产品ID不能为空");
        }

        return AjaxResult.success(productFieldService.getByProductId(productId));
    }

    /**
     * 新增保存产品字段配置
     */
    @RequiresPermissions("business:field:add")
    @Log(title = "新增产品字段配置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult addSave(@RequestBody ProductField productField)
    {
        if (productField.getProductId() == null) {
            throw new ServiceException("产品ID不能为空");
        }
        if (StringUtils.isBlank(productField.getFieldName())) {
            throw new ServiceException("字段名称不能为空");
        }
        if (productField.getSort() == null) {
            throw new ServiceException("排序不能为空");
        }
        if (productField.getIsFilter() == null) {
            throw new ServiceException("是否筛选不能为空");
        }
        return toAjax(productFieldService.insertProductField(productField));
    }

    /**
     * 修改保存产品字段配置
     */
    @RequiresPermissions("business:field:edit")
    @Log(title = "修改产品字段配置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult editSave(@RequestBody ProductField productField)
    {
        if (productField.getId() == null) {
            throw new ServiceException("ID不能为空");
        }
        if (productField.getProductId() == null) {
            throw new ServiceException("产品ID不能为空");
        }
        if (StringUtils.isBlank(productField.getFieldName())) {
            throw new ServiceException("字段名称不能为空");
        }
        if (productField.getSort() == null) {
            throw new ServiceException("排序不能为空");
        }
        if (productField.getIsFilter() == null) {
            throw new ServiceException("是否筛选不能为空");
        }
        return toAjax(productFieldService.updateProductField(productField));
    }

    /**
     * 删除产品字段配置
     */
    @RequiresPermissions("business:field:remove")
    @Log(title = "删除产品字段配置", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    public AjaxResult remove(@RequestBody DeleteDTO dto)
    {
        if (dto.getIdList() == null || dto.getIdList().isEmpty()) {
            throw new ServiceException("请选择要删除的数据");
        }
        return toAjax(productFieldService.deleteProductFieldByIds(dto.getIdList()));
    }

    @GetMapping()
    public String listView()
    {
        return prefix + "/list";
    }

    @GetMapping("/add/view")
    public String addView()
    {
        return prefix + "/add";
    }

    @GetMapping("/edit/view/{id}")
    public String editView() {
        return prefix + "/edit";
    }
}
