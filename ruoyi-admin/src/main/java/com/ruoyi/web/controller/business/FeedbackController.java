package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.dto.DeleteDTO;
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
    @GetMapping("/list")
    @ResponseBody
    public TableDataInfo list(Feedback feedback)
    {
        startPage();
        List<Feedback> list = feedbackService.selectFeedbackList(feedback);
        return getDataTable(list);
    }

    /**
     * 新增保存留言反馈
     */
    @PostMapping("/add")
    public AjaxResult addSave(@RequestBody Feedback feedback)
    {
        if (StringUtils.isBlank(feedback.getName())) {
            throw new ServiceException("姓名不能为空");
        }

        if (StringUtils.isBlank(feedback.getMessageContent())) {
            throw new ServiceException("留言内容不能为空");
        }

        return toAjax(feedbackService.insertFeedback(feedback));
    }

    /**
     * 修改保存留言反馈
     */
    @Log(title = "修改留言反馈", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    public AjaxResult editSave(@RequestBody Feedback feedback)
    {
        return toAjax(feedbackService.updateFeedback(feedback));
    }

    /**
     * 删除留言反馈
     */
    @Log(title = "删除留言反馈", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    public AjaxResult remove(@RequestBody DeleteDTO dto)
    {
        if (dto == null || dto.getIdList().isEmpty()) {
            throw new ServiceException("请选择要删除的数据");
        }

        return toAjax(feedbackService.deleteFeedbackByIds(dto.getIdList()));
    }

    /**
     * 更新状态
     */
    @Log(title = "更新状态", businessType = BusinessType.UPDATE)
    @PostMapping( "/updateStatus")
    public AjaxResult updateStatus(@RequestBody Feedback feedback)
    {
        if (feedback.getId() == null) {
            throw new ServiceException("ID不能为空");
        }

        return toAjax(feedbackService.updateStatus(feedback.getId()));
    }
}
