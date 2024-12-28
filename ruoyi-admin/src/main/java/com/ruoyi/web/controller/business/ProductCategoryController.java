package com.ruoyi.web.controller.business;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.business.domain.dto.DeleteDTO;
import com.ruoyi.common.exception.ServiceException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.domain.ProductCategory;
import com.ruoyi.business.service.IProductCategoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 产品种类Controller
 * 
 * @author tangJM.
 * @date 2024-12-27
 */
@RestController
@RequestMapping("/business/product/category")
public class ProductCategoryController extends BaseController
{
    @Autowired
    private IProductCategoryService productCategoryService;

    /**
     * 查询产品种类列表
     */
    @GetMapping("/list")
    public TableDataInfo list(ProductCategory productCategory)
    {
        startPage();
        List<ProductCategory> list = productCategoryService.selectProductCategoryList(productCategory);
        return getDataTable(list);
    }

    /**
     * 新增产品种类
     */
    @PreAuthorize("@ss.hasPermi('business:product:category:add')")
    @Log(title = "新增产品种类", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody ProductCategory productCategory)
    {
        return toAjax(productCategoryService.insertProductCategory(productCategory));
    }

    /**
     * 修改产品种类
     */
    @PreAuthorize("@ss.hasPermi('business:product:category:edit')")
    @Log(title = "产品种类", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody ProductCategory productCategory)
    {
        return toAjax(productCategoryService.updateProductCategory(productCategory));
    }

    /**
     * 删除产品种类
     */
    @PreAuthorize("@ss.hasPermi('business:product:category:remove')")
    @Log(title = "产品种类", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
    public AjaxResult remove(@RequestBody DeleteDTO dto)
    {
        if (dto.getIdList() == null || dto.getIdList().isEmpty()) {
            throw new ServiceException("请选择要删除的数据");
        }

        return toAjax(productCategoryService.deleteProductCategoryByIds(dto.getIdList()));
    }
}
