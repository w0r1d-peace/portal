package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.SolutionDesign;
import org.apache.ibatis.annotations.Param;

/**
 * 方案设计Mapper接口
 * 
 * @author tangJM.
 * @date 2024-12-18
 */
public interface SolutionDesignMapper 
{
    /**
     * 查询方案设计
     * 
     * @param id 方案设计主键
     * @return 方案设计
     */
    public SolutionDesign selectSolutionDesignById(Long id);

    /**
     * 查询方案设计列表
     * 
     * @param solutionDesign 方案设计
     * @return 方案设计集合
     */
    public List<SolutionDesign> selectSolutionDesignList(SolutionDesign solutionDesign);

    /**
     * 新增方案设计
     * 
     * @param solutionDesign 方案设计
     * @return 结果
     */
    public int insertSolutionDesign(SolutionDesign solutionDesign);

    /**
     * 修改方案设计
     * 
     * @param solutionDesign 方案设计
     * @return 结果
     */
    public int updateSolutionDesign(SolutionDesign solutionDesign);

    /**
     * 删除方案设计
     * 
     * @param id 方案设计主键
     * @return 结果
     */
    public int deleteSolutionDesignById(Long id);

    /**
     * 批量删除方案设计
     * 
     * @param idList 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSolutionDesignByIds(@Param("idList") List<Integer> idList, @Param("updateBy") String updateBy);
}
