package com.ruoyi.web.controller.business;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.domain.EnterpriseInfo;
import com.ruoyi.business.service.IEnterpriseInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 网站信息Controller
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@RestController
@RequestMapping("/business/info")
public class EnterpriseInfoController extends BaseController
{

    @Autowired
    private IEnterpriseInfoService enterpriseInfoService;

    @GetMapping()
    public AjaxResult info()
    {
        return success(enterpriseInfoService.info());
    }

    /**
     * 查询网站信息列表
     */
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(EnterpriseInfo enterpriseInfo)
    {
        startPage();
        List<EnterpriseInfo> list = enterpriseInfoService.selectEnterpriseInfoList(enterpriseInfo);
        return getDataTable(list);
    }

    /**
     * 新增保存网站信息
     */
    @Log(title = "网站信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(EnterpriseInfo enterpriseInfo)
    {
        return toAjax(enterpriseInfoService.insertEnterpriseInfo(enterpriseInfo));
    }

    /**
     * 修改保存网站信息
     */
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
    @Log(title = "网站信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(enterpriseInfoService.deleteEnterpriseInfoByIds(ids));
    }
}
