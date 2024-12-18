package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.dto.DeleteDTO;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.domain.Product;
import com.ruoyi.business.service.IProductService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 产品Controller
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@Controller
@RequestMapping("/business/product")
public class ProductController extends BaseController
{
    private String prefix = "business/product";

    @Autowired
    private IProductService productService;

    /**
     * 查询产品列表
     */
    @GetMapping("/list")
    @ResponseBody
    public TableDataInfo list(Product product)
    {
        startPage();
        List<Product> list = productService.selectProductList(product);
        return getDataTable(list);
    }

    /**
     * 新增保存产品
     */
    @Log(title = "新增产品", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestBody Product product)
    {
        if (StringUtils.isBlank(product.getName())) {
            throw new ServiceException("产品名称不能为空");
        }

        return toAjax(productService.insertProduct(product));
    }

    /**
     * 修改保存产品
     */
    @Log(title = "修改产品", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(@RequestBody Product product)
    {
        if (product.getId() == null) {
            throw new ServiceException("ID不能为空");
        }

        if (StringUtils.isBlank(product.getName())) {
            throw new ServiceException("产品名称不能为空");
        }

        return toAjax(productService.updateProduct(product));
    }

    /**
     * 删除产品
     */
    @Log(title = "删除产品", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(@RequestBody DeleteDTO dto)
    {
        if (dto == null || dto.getIdList().isEmpty()) {
            throw new ServiceException("请选择要删除的数据");
        }

        return toAjax(productService.deleteProductByIds(dto.getIdList()));
    }
}
