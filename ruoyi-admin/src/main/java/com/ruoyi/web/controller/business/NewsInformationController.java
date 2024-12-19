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
import com.ruoyi.business.domain.NewsInformation;
import com.ruoyi.business.service.INewsInformationService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 新闻资讯Controller
 * 
 * @author tangJM.
 * @date 2024-12-18
 */
@RestController
@RequestMapping("/business/information")
public class NewsInformationController extends BaseController
{
    @Autowired
    private INewsInformationService newsInformationService;

    /**
     * 查询新闻资讯列表
     */
    @GetMapping("/list")
    public TableDataInfo list(NewsInformation newsInformation)
    {
        startPage();
        List<NewsInformation> list = newsInformationService.selectNewsInformationList(newsInformation);
        return getDataTable(list);
    }

    /**
     * 获取新闻资讯详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:information:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(newsInformationService.selectNewsInformationById(id));
    }

    /**
     * 新增新闻资讯
     */
    @PreAuthorize("@ss.hasPermi('business:information:add')")
    @Log(title = "新增新闻资讯", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult add(@RequestBody NewsInformation newsInformation)
    {
        return toAjax(newsInformationService.insertNewsInformation(newsInformation));
    }

    /**
     * 修改新闻资讯
     */
    @PreAuthorize("@ss.hasPermi('business:information:edit')")
    @Log(title = "修改新闻资讯", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult edit(@RequestBody NewsInformation newsInformation)
    {
        return toAjax(newsInformationService.updateNewsInformation(newsInformation));
    }

    /**
     * 删除新闻资讯
     */
    @PreAuthorize("@ss.hasPermi('business:information:remove')")
    @Log(title = "删除新闻资讯", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
    public AjaxResult remove(@RequestBody DeleteDTO dto)
    {
        if (dto == null || dto.getIdList().isEmpty()) {
            throw new ServiceException("请选择要删除的数据");
        }

        return toAjax(newsInformationService.deleteNewsInformationByIds(dto.getIdList()));
    }
}
