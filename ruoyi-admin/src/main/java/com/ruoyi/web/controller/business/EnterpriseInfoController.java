package com.ruoyi.business.controller;

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
import com.ruoyi.business.domain.EnterpriseInfo;
import com.ruoyi.business.service.IEnterpriseInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 网站信息Controller
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@Controller
@RequestMapping("/business/info")
public class EnterpriseInfoController extends BaseController
{
    private String prefix = "business/info";

    @Autowired
    private IEnterpriseInfoService enterpriseInfoService;

    @RequiresPermissions("business:info:view")
    @GetMapping()
    public String info()
    {
        return prefix + "/info";
    }

    /**
     * 查询网站信息列表
     */
    @RequiresPermissions("business:info:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(EnterpriseInfo enterpriseInfo)
    {
        startPage();
        List<EnterpriseInfo> list = enterpriseInfoService.selectEnterpriseInfoList(enterpriseInfo);
        return getDataTable(list);
    }

    /**
     * 导出网站信息列表
     */
    @RequiresPermissions("business:info:export")
    @Log(title = "网站信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(EnterpriseInfo enterpriseInfo)
    {
        List<EnterpriseInfo> list = enterpriseInfoService.selectEnterpriseInfoList(enterpriseInfo);
        ExcelUtil<EnterpriseInfo> util = new ExcelUtil<EnterpriseInfo>(EnterpriseInfo.class);
        return util.exportExcel(list, "网站信息数据");
    }

    /**
     * 新增网站信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存网站信息
     */
    @RequiresPermissions("business:info:add")
    @Log(title = "网站信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(EnterpriseInfo enterpriseInfo)
    {
        return toAjax(enterpriseInfoService.insertEnterpriseInfo(enterpriseInfo));
    }

    /**
     * 修改网站信息
     */
    @RequiresPermissions("business:info:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        EnterpriseInfo enterpriseInfo = enterpriseInfoService.selectEnterpriseInfoById(id);
        mmap.put("enterpriseInfo", enterpriseInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存网站信息
     */
    @RequiresPermissions("business:info:edit")
    @Log(title = "网站信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(EnterpriseInfo enterpriseInfo)
    {
        return toAjax(enterpriseInfoService.updateEnterpriseInfo(enterpriseInfo));
    }

    /**
     * 删除网站信息
     */
    @RequiresPermissions("business:info:remove")
    @Log(title = "网站信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(enterpriseInfoService.deleteEnterpriseInfoByIds(ids));
    }
}
