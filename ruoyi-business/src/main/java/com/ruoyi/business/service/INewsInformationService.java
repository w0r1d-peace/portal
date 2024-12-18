package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.NewsInformation;

/**
 * 新闻资讯Service接口
 * 
 * @author tangJM.
 * @date 2024-12-18
 */
public interface INewsInformationService 
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
     * 批量删除新闻资讯
     * 
     * @param idList 需要删除的新闻资讯主键集合
     * @return 结果
     */
    public int deleteNewsInformationByIds(List<Integer> idList);

    /**
     * 删除新闻资讯信息
     * 
     * @param id 新闻资讯主键
     * @return 结果
     */
    public int deleteNewsInformationById(Long id);
}
