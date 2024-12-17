package com.ruoyi.business.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.FeedbackMapper;
import com.ruoyi.business.domain.Feedback;
import com.ruoyi.business.service.IFeedbackService;
import com.ruoyi.common.core.text.Convert;

/**
 * 留言反馈Service业务层处理
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@Service
public class FeedbackServiceImpl implements IFeedbackService
{
    @Autowired
    private FeedbackMapper feedbackMapper;

    /**
     * 查询留言反馈
     *
     * @param id 留言反馈主键
     * @return 留言反馈
     */
    @Override
    public Feedback selectFeedbackById(Long id)
    {
        return feedbackMapper.selectFeedbackById(id);
    }

    /**
     * 查询留言反馈列表
     *
     * @param feedback 留言反馈
     * @return 留言反馈
     */
    @Override
    public List<Feedback> selectFeedbackList(Feedback feedback)
    {
        return feedbackMapper.selectFeedbackList(feedback);
    }

    /**
     * 新增留言反馈
     *
     * @param feedback 留言反馈
     * @return 结果
     */
    @Override
    public int insertFeedback(Feedback feedback)
    {
        feedback.setCreateTime(DateUtils.getNowDate());
        return feedbackMapper.insertFeedback(feedback);
    }

    /**
     * 修改留言反馈
     *
     * @param feedback 留言反馈
     * @return 结果
     */
    @Override
    public int updateFeedback(Feedback feedback)
    {
        feedback.setUpdateTime(DateUtils.getNowDate());
        return feedbackMapper.updateFeedback(feedback);
    }

    /**
     * 批量删除留言反馈
     *
     * @param ids 需要删除的留言反馈主键
     * @return 结果
     */
    @Override
    public int deleteFeedbackByIds(String ids)
    {
        return feedbackMapper.deleteFeedbackByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除留言反馈信息
     *
     * @param id 留言反馈主键
     * @return 结果
     */
    @Override
    public int deleteFeedbackById(Long id)
    {
        return feedbackMapper.deleteFeedbackById(id);
    }
}
