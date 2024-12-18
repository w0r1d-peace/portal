package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.Itineraries;
import org.apache.ibatis.annotations.Param;

/**
 * 旅游行程Mapper接口
 * 
 * @author tangJM.
 * @date 2024-12-17
 */
public interface ItinerariesMapper 
{
    /**
     * 查询旅游行程
     * 
     * @param id 旅游行程主键
     * @return 旅游行程
     */
    public Itineraries selectItinerariesById(Long id);

    /**
     * 查询旅游行程列表
     * 
     * @param itineraries 旅游行程
     * @return 旅游行程集合
     */
    public List<Itineraries> selectItinerariesList(Itineraries itineraries);

    /**
     * 新增旅游行程
     * 
     * @param itineraries 旅游行程
     * @return 结果
     */
    public int insertItineraries(Itineraries itineraries);

    /**
     * 修改旅游行程
     * 
     * @param itineraries 旅游行程
     * @return 结果
     */
    public int updateItineraries(Itineraries itineraries);

    /**
     * 删除旅游行程
     * 
     * @param id 旅游行程主键
     * @return 结果
     */
    public int deleteItinerariesById(Long id);

    /**
     * 批量删除旅游行程
     * 
     * @param idList 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteItinerariesByIds(@Param("idList") List<Integer> idList, @Param("updateBy") String updateBy);

    /**
     * 更新浏览次数
     * @param id
     */
    void updateViewCountById(@Param("id") Long id);
}
