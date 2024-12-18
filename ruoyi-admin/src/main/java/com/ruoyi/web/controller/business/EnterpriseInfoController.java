package com.ruoyi.web.controller.business;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
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
     * 修改网站信息
     */
    @Log(title = "修改网站信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody EnterpriseInfo enterpriseInfo)
    {
        if (StringUtils.isBlank(enterpriseInfo.getName())) {
            throw new ServiceException("单位名称不能为空");
        }

        if (StringUtils.isBlank(enterpriseInfo.getAddress())) {
            throw new ServiceException("单位地址不能为空");
        }

        return toAjax(enterpriseInfoService.updateEnterpriseInfo(enterpriseInfo));
    }
}
