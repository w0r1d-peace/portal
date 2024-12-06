package com.ruoyi.web.controller.business;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.domain.ProductModel;
import com.ruoyi.business.service.IProductModelService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 产品型号Controller
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@Controller
@RequestMapping("/business/model")
public class ProductModelController extends BaseController
{
    private String prefix = "business/model";

    @Autowired
    private IProductModelService productModelService;

    @RequiresPermissions("business:model:view")
    @GetMapping()
    public String model()
    {
        return prefix + "/model";
    }

    /**
     * 查询产品型号列表
     */
    @RequiresPermissions("business:model:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ProductModel productModel)
    {
        startPage();
        List<ProductModel> list = productModelService.selectProductModelList(productModel);
        return getDataTable(list);
    }

    /**
     * 导出产品型号列表
     */
    @RequiresPermissions("business:model:export")
    @Log(title = "产品型号", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ProductModel productModel)
    {
        List<ProductModel> list = productModelService.selectProductModelList(productModel);
        ExcelUtil<ProductModel> util = new ExcelUtil<ProductModel>(ProductModel.class);
        return util.exportExcel(list, "产品型号数据");
    }

    /**
     * 新增产品型号
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存产品型号
     */
    @RequiresPermissions("business:model:add")
    @Log(title = "产品型号", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ProductModel productModel)
    {
        return toAjax(productModelService.insertProductModel(productModel));
    }

    /**
     * 修改产品型号
     */
    @RequiresPermissions("business:model:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ProductModel productModel = productModelService.selectProductModelById(id);
        mmap.put("productModel", productModel);
        return prefix + "/edit";
    }

    /**
     * 修改保存产品型号
     */
    @RequiresPermissions("business:model:edit")
    @Log(title = "产品型号", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ProductModel productModel)
    {
        return toAjax(productModelService.updateProductModel(productModel));
    }

    /**
     * 删除产品型号
     */
    @RequiresPermissions("business:model:remove")
    @Log(title = "产品型号", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(productModelService.deleteProductModelByIds(ids));
    }
}
