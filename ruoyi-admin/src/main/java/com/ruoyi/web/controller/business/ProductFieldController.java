package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.dto.DeleteDTO;
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
     * 新增保存产品字段配置
     */
    @RequiresPermissions("business:field:add")
    @Log(title = "新增产品字段配置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult addSave(@RequestBody ProductField productField)
    {
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
        return toAjax(productFieldService.updateProductField(productField));
    }

    /**
     * 删除产品字段配置
     */
    @RequiresPermissions("business:field:remove")
    @Log(title = "删除产品字段配置", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(@RequestBody DeleteDTO dto)
    {
        return toAjax(productFieldService.deleteProductFieldByIds(dto.getIdList()));
    }
}
