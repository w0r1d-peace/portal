package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.dto.DeleteDTO;
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
import com.ruoyi.business.domain.Itineraries;
import com.ruoyi.business.service.IItinerariesService;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 旅游行程Controller
 * 
 * @author tangJM.
 * @date 2024-12-17
 */
@RestController
@RequestMapping("/business/itineraries")
public class ItinerariesController extends BaseController
{
    @Autowired
    private IItinerariesService itinerariesService;

    /**
     * 查询旅游行程列表
     */
    @PreAuthorize("@ss.hasPermi('business:itineraries:list')")
    @GetMapping("/list")
    public TableDataInfo list(Itineraries itineraries)
    {
        startPage();
        List<Itineraries> list = itinerariesService.selectItinerariesList(itineraries);
        return getDataTable(list);
    }

    /**
     * 获取旅游行程详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:itineraries:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(itinerariesService.selectItinerariesById(id));
    }

    /**
     * 新增旅游行程
     */
    @PreAuthorize("@ss.hasPermi('business:itineraries:add')")
    @Log(title = "新增旅游行程", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody Itineraries itineraries)
    {
        return toAjax(itinerariesService.insertItineraries(itineraries));
    }

    /**
     * 修改旅游行程
     */
    @PreAuthorize("@ss.hasPermi('business:itineraries:edit')")
    @Log(title = "修改旅游行程", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody Itineraries itineraries)
    {
        return toAjax(itinerariesService.updateItineraries(itineraries));
    }

    /**
     * 删除旅游行程
     */
    @PreAuthorize("@ss.hasPermi('business:itineraries:remove')")
    @Log(title = "删除旅游行程", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
    public AjaxResult remove(@RequestBody DeleteDTO dto)
    {
        if (dto.getIdList() == null || dto.getIdList().size() == 0) {
            return error("请选择要删除的数据");
        }

        return toAjax(itinerariesService.deleteItinerariesByIds(dto.getIdList()));
    }
}
