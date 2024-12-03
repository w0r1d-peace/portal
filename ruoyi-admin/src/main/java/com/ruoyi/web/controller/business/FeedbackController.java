package com.ruoyi.web.controller.business;

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
import com.ruoyi.business.domain.Feedback;
import com.ruoyi.business.service.IFeedbackService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 留言反馈Controller
 * 
 * @author tangJM.
 * @date 2024-12-03
 */
@Controller
@RequestMapping("/business/feedback")
public class FeedbackController extends BaseController
{
    private String prefix = "business/feedback";

    @Autowired
    private IFeedbackService feedbackService;

    @RequiresPermissions("business:feedback:view")
    @GetMapping()
    public String feedback()
    {
        return prefix + "/feedback";
    }

    /**
     * 查询留言反馈列表
     */
    @RequiresPermissions("business:feedback:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Feedback feedback)
    {
        startPage();
        List<Feedback> list = feedbackService.selectFeedbackList(feedback);
        return getDataTable(list);
    }

    /**
     * 导出留言反馈列表
     */
    @RequiresPermissions("business:feedback:export")
    @Log(title = "留言反馈", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Feedback feedback)
    {
        List<Feedback> list = feedbackService.selectFeedbackList(feedback);
        ExcelUtil<Feedback> util = new ExcelUtil<Feedback>(Feedback.class);
        return util.exportExcel(list, "留言反馈数据");
    }

    /**
     * 新增留言反馈
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存留言反馈
     */
    @RequiresPermissions("business:feedback:add")
    @Log(title = "留言反馈", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Feedback feedback)
    {
        return toAjax(feedbackService.insertFeedback(feedback));
    }

    /**
     * 修改留言反馈
     */
    @RequiresPermissions("business:feedback:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Feedback feedback = feedbackService.selectFeedbackById(id);
        mmap.put("feedback", feedback);
        return prefix + "/edit";
    }

    /**
     * 修改保存留言反馈
     */
    @RequiresPermissions("business:feedback:edit")
    @Log(title = "留言反馈", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Feedback feedback)
    {
        return toAjax(feedbackService.updateFeedback(feedback));
    }

    /**
     * 删除留言反馈
     */
    @RequiresPermissions("business:feedback:remove")
    @Log(title = "留言反馈", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(feedbackService.deleteFeedbackByIds(ids));
    }
}
