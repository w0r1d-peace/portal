package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.Feedback;
import org.apache.ibatis.annotations.Param;

/**
 * 留言反馈Mapper接口
 *
 * @author tangJM.
 * @date 2024-12-05
 */
public interface FeedbackMapper
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
     * 删除留言反馈
     *
     * @param id 留言反馈主键
     * @return 结果
     */
    public int deleteFeedbackById(Long id);

    /**
     * 批量删除留言反馈
     *
     * @param idList 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFeedbackByIds(@Param("idList") List<Integer> idList, @Param("updateBy") String updateBy);

    /**
     * 更新状态
     * @param id
     */
    void updateStatus(@Param("id") Long id);
}
