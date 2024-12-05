package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.Feedback;

/**
 * 留言反馈Service接口
 *
 * @author tangJM.
 * @date 2024-12-05
 */
public interface IFeedbackService
{
    /**
     * 查询留言反馈
     *
     * @param id 留言反馈主键
     * @return 留言反馈
     */
    public Feedback selectFeedbackById(Long id);

    /**
     * 查询留言反馈列表
     *
     * @param feedback 留言反馈
     * @return 留言反馈集合
     */
    public List<Feedback> selectFeedbackList(Feedback feedback);

    /**
     * 新增留言反馈
     *
     * @param feedback 留言反馈
     * @return 结果
     */
    public int insertFeedback(Feedback feedback);

    /**
     * 修改留言反馈
     *
     * @param feedback 留言反馈
     * @return 结果
     */
    public int updateFeedback(Feedback feedback);

    /**
     * 批量删除留言反馈
     *
     * @param ids 需要删除的留言反馈主键集合
     * @return 结果
     */
    public int deleteFeedbackByIds(String ids);

    /**
     * 删除留言反馈信息
     *
     * @param id 留言反馈主键
     * @return 结果
     */
    public int deleteFeedbackById(Long id);
}
