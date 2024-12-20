package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.FeedbackMapper;
import com.ruoyi.business.domain.Feedback;
import com.ruoyi.business.service.IFeedbackService;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

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
        feedback.setStatus(1);
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
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        feedback.setUpdateBy(user.getUserName());
        feedback.setUpdateTime(DateUtils.getNowDate());
        return feedbackMapper.updateFeedback(feedback);
    }

    /**
     * 批量删除留言反馈
     *
     * @param idList 需要删除的留言反馈主键
     * @return 结果
     */
    @Override
    public int deleteFeedbackByIds(List<Integer> idList)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        return feedbackMapper.deleteFeedbackByIds(idList, user.getUserName());
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

    /**
     * 更新状态
     * @param id
     * @return
     */
    @Override
    public boolean updateStatus(Long id) {
        feedbackMapper.updateStatus(id);
        return true;
    }
}
