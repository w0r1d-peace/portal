package com.ruoyi.web.controller.business;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.business.domain.dto.DeleteDTO;
import com.ruoyi.common.constant.HttpStatus;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.util.Pair;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.service.IProductModelService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;

/**
 * 产品型号Controller
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@RestController
@RequestMapping("/business/product/model")
public class ProductModelController extends BaseController {

    @Autowired
    private IProductModelService productModelService;

    /**
     * 查询产品型号列表
     */
    @PostMapping("/list")
    public Map<String, Object> list(@RequestBody Map<String, Object> info) {
        if (info == null) {
            throw new ServiceException("参数不能为空");
        }

        if (ObjectUtils.isEmpty(info.get("productId"))) {
            throw new ServiceException("产品ID不能为空");
        }

        if (ObjectUtils.isEmpty(info.get("productCategoryId"))) {
            throw new ServiceException("产品种类ID不能为空");
        }

        if (ObjectUtils.isEmpty(info.get("pageNum"))) {
            info.put("pageNum", 1);
        }

        if (ObjectUtils.isEmpty(info.get("pageSize"))) {
            info.put("pageSize", 1000);
        }

        Pair<Long, List<Map<String, Object>>> pair = productModelService.selectProductModelList(info);
        Map<String, Object> result = new HashMap<>();
        result.put("code", HttpStatus.SUCCESS);
        result.put("msg", "查询成功");
        result.put("rows", pair.getSecond());
        result.put("total", pair.getFirst());
        return result;
    }

    /**
     * 新增保存产品型号
     */
    @Log(title = "新增产品型号", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult addSave(@RequestBody Map<String, Object> info) {
        if (info == null) {
            throw new ServiceException("参数不能为空");
        }
        if (ObjectUtils.isEmpty(info.get("productId"))) {
            throw new ServiceException("产品ID不能为空");
        }
        if (ObjectUtils.isEmpty(info.get("productCategoryId"))) {
            throw new ServiceException("产品种类ID不能为空");
        }
        if (ObjectUtils.isEmpty(info.get("modelNumber"))) {
            throw new ServiceException("型号不能为空");
        }

        return toAjax(productModelService.insertProductModel(info));
    }

    /**
     * 修改保存产品型号
     */
    @Log(title = "修改产品型号", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult editSave(@RequestBody Map<String, Object> info) {
        if (info == null) {
            throw new ServiceException("参数不能为空");
        }
        if (ObjectUtils.isEmpty(info.get("id"))) {
            throw new ServiceException("ID不能为空");
        }
        if (ObjectUtils.isEmpty(info.get("productCategoryId"))) {
            throw new ServiceException("产品种类ID不能为空");
        }
        if (ObjectUtils.isEmpty(info.get("modelNumber"))) {
            throw new ServiceException("型号不能为空");
        }
        return toAjax(productModelService.updateProductModel(info));
    }

    /**
     * 删除产品型号
     */
    @Log(title = "删除产品型号", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    public AjaxResult remove(@RequestBody DeleteDTO dto) {
        return toAjax(productModelService.deleteProductModelByIds(dto.getIdList()));
    }

    /**
     * 获取筛选数据
     */
    @PostMapping("/getFilterData")
    public AjaxResult getFilterData(@RequestBody Map<String, Object> info) {
        if (info == null) {
            throw new ServiceException("参数不能为空");
        }

        if (ObjectUtils.isEmpty(info.get("productId"))) {
            throw new ServiceException("产品ID不能为空");
        }

        if (ObjectUtils.isEmpty(info.get("productCategoryId"))) {
            throw new ServiceException("产品种类ID不能为空");
        }

        return AjaxResult.success(productModelService.getFilterData(info));
    }


    /**
     * 搜索
     */
    @GetMapping("/search")
    public AjaxResult search(String keyword) {
        if (StringUtils.isBlank(keyword)) {
            throw new ServiceException("关键字不能为空");
        }

        return AjaxResult.success(productModelService.search(keyword));
    }
}