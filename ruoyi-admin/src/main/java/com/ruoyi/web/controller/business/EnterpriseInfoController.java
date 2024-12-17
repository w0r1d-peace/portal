package com.ruoyi.web.controller.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.domain.EnterpriseInfo;
import com.ruoyi.business.service.IEnterpriseInfoService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;

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
     * 修改保存网站信息
     */
    @Log(title = "修改网站信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult editSave(@RequestBody EnterpriseInfo enterpriseInfo)
    {
        return toAjax(enterpriseInfoService.updateEnterpriseInfo(enterpriseInfo));
    }
}
