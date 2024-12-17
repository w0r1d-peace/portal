package com.ruoyi.web.controller.business;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.business.domain.Itineraries;
import com.ruoyi.business.service.IItinerariesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
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
     * 导出旅游行程列表
     */
    @PreAuthorize("@ss.hasPermi('business:itineraries:export')")
    @Log(title = "旅游行程", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Itineraries itineraries)
    {
        List<Itineraries> list = itinerariesService.selectItinerariesList(itineraries);
        ExcelUtil<Itineraries> util = new ExcelUtil<Itineraries>(Itineraries.class);
        util.exportExcel(response, list, "旅游行程数据");
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
    @Log(title = "旅游行程", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Itineraries itineraries)
    {
        return toAjax(itinerariesService.insertItineraries(itineraries));
    }

    /**
     * 修改旅游行程
     */
    @PreAuthorize("@ss.hasPermi('business:itineraries:edit')")
    @Log(title = "旅游行程", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Itineraries itineraries)
    {
        return toAjax(itinerariesService.updateItineraries(itineraries));
    }

    /**
     * 删除旅游行程
     */
    @PreAuthorize("@ss.hasPermi('business:itineraries:remove')")
    @Log(title = "旅游行程", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(itinerariesService.deleteItinerariesByIds(ids));
    }
}
