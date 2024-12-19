package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.dto.DeleteDTO;
import com.ruoyi.common.exception.ServiceException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.business.domain.SolutionDesign;
import com.ruoyi.business.service.ISolutionDesignService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 方案设计Controller
 * 
 * @author tangJM.
 * @date 2024-12-18
 */
@RestController
@RequestMapping("/business/design")
public class SolutionDesignController extends BaseController
{
    @Autowired
    private ISolutionDesignService solutionDesignService;

    /**
     * 查询方案设计列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SolutionDesign solutionDesign)
    {
        startPage();
        List<SolutionDesign> list = solutionDesignService.selectSolutionDesignList(solutionDesign);
        return getDataTable(list);
    }

    /**
     * 获取方案设计详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:design:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(solutionDesignService.selectSolutionDesignById(id));
    }

    /**
     * 新增方案设计
     */
    @PreAuthorize("@ss.hasPermi('business:design:add')")
    @Log(title = "新增方案设计", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody SolutionDesign solutionDesign)
    {
        return toAjax(solutionDesignService.insertSolutionDesign(solutionDesign));
    }

    /**
     * 修改方案设计
     */
    @PreAuthorize("@ss.hasPermi('business:design:edit')")
    @Log(title = "编辑方案设计", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody SolutionDesign solutionDesign)
    {
        return toAjax(solutionDesignService.updateSolutionDesign(solutionDesign));
    }

    /**
     * 删除方案设计
     */
    @PreAuthorize("@ss.hasPermi('business:design:remove')")
    @Log(title = "删除方案设计", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
    public AjaxResult remove(@RequestBody DeleteDTO dto)
    {
        if (dto == null || dto.getIdList().isEmpty()) {
            throw new ServiceException("请选择要删除的数据");
        }

        return toAjax(solutionDesignService.deleteSolutionDesignByIds(dto.getIdList()));
    }
}
