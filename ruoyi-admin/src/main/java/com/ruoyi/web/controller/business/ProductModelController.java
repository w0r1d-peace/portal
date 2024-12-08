package com.ruoyi.web.controller.business;

import java.util.List;
import java.util.Map;

import com.ruoyi.business.domain.dto.DeleteDTO;
import com.ruoyi.common.exception.ServiceException;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.domain.ProductModel;
import com.ruoyi.business.service.IProductModelService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 产品型号Controller
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@RestController
@RequestMapping("/business/model")
public class ProductModelController extends BaseController
{

    @Autowired
    private IProductModelService productModelService;

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
     * 新增保存产品型号
     */
    @RequiresPermissions("business:model:add")
    @Log(title = "新增产品型号", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult addSave(@RequestBody Map<String, Object> info)
    {
        if (info == null) {
            throw new ServiceException("参数不能为空");
        }
        if (ObjectUtils.isEmpty(info.get("productId"))) {
            throw new ServiceException("产品ID不能为空");
        }
        if (ObjectUtils.isEmpty(info.get("modelNumber"))) {
            throw new ServiceException("型号不能为空");
        }

        return toAjax(productModelService.insertProductModel(info));
    }

    /**
     * 修改保存产品型号
     */
    @RequiresPermissions("business:model:edit")
    @Log(title = "修改产品型号", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult editSave(@RequestBody Map<String, Object> info)
    {
        if (info == null) {
            throw new ServiceException("参数不能为空");
        }
        if (ObjectUtils.isEmpty(info.get("id"))) {
            throw new ServiceException("ID不能为空");
        }
        if (ObjectUtils.isEmpty(info.get("productId"))) {
            throw new ServiceException("产品ID不能为空");
        }
        if (ObjectUtils.isEmpty(info.get("modelNumber"))) {
            throw new ServiceException("型号不能为空");
        }
        return toAjax(productModelService.updateProductModel(info));
    }

    /**
     * 删除产品型号
     */
    @RequiresPermissions("business:model:remove")
    @Log(title = "删除产品型号", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    public AjaxResult remove(@RequestBody DeleteDTO dto)
    {
        return toAjax(productModelService.deleteProductModelByIds(dto.getIdList()));
    }
}
