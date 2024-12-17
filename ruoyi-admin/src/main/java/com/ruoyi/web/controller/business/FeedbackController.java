package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
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
 * @date 2024-12-05
 */
@RestController
@RequestMapping("/business/feedback")
public class FeedbackController extends BaseController
{

    @Autowired
    private IFeedbackService feedbackService;

    /**
     * 查询留言反馈列表
     */
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
     * 新增保存留言反馈
     */
    @Log(title = "留言反馈", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    public AjaxResult addSave(@RequestBody Feedback feedback)
    {
        if (StringUtils.isBlank(feedback.getName())) {
            throw new ServiceException("姓名不能为空");
        }

        if (StringUtils.isBlank(feedback.getInquiryContent())) {
            throw new ServiceException("留言内容不能为空");
        }

        return toAjax(feedbackService.insertFeedback(feedback));
    }

    /**
     * 修改保存留言反馈
     */
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
    @Log(title = "留言反馈", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(feedbackService.deleteFeedbackByIds(ids));
    }
}
