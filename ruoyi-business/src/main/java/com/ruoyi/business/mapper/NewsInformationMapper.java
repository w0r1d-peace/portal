package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.NewsInformation;
import org.apache.ibatis.annotations.Param;

/**
 * 新闻资讯Mapper接口
 * 
 * @author tangJM.
 * @date 2024-12-18
 */
public interface NewsInformationMapper 
{
    /**
     * 查询新闻资讯
     * 
     * @param id 新闻资讯主键
     * @return 新闻资讯
     */
    public NewsInformation selectNewsInformationById(Long id);

    /**
     * 查询新闻资讯列表
     * 
     * @param newsInformation 新闻资讯
     * @return 新闻资讯集合
     */
    public List<NewsInformation> selectNewsInformationList(NewsInformation newsInformation);

    /**
     * 新增新闻资讯
     * 
     * @param newsInformation 新闻资讯
     * @return 结果
     */
    public int insertNewsInformation(NewsInformation newsInformation);

    /**
     * 修改新闻资讯
     * 
     * @param newsInformation 新闻资讯
     * @return 结果
     */
    public int updateNewsInformation(NewsInformation newsInformation);

    /**
     * 删除新闻资讯
     * 
     * @param id 新闻资讯主键
     * @return 结果
     */
    public int deleteNewsInformationById(Long id);

    /**
     * 批量删除新闻资讯
     * 
     * @param idList 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNewsInformationByIds(@Param("idList") List<Integer> idList, @Param("updateBy") String updateBy);
}
