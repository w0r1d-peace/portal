package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.NewsInformationMapper;
import com.ruoyi.business.domain.NewsInformation;
import com.ruoyi.business.service.INewsInformationService;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

/**
 * 新闻资讯Service业务层处理
 * 
 * @author tangJM.
 * @date 2024-12-18
 */
@Service
public class NewsInformationServiceImpl implements INewsInformationService 
{
    @Autowired
    private NewsInformationMapper newsInformationMapper;

    /**
     * 查询新闻资讯
     * 
     * @param id 新闻资讯主键
     * @return 新闻资讯
     */
    @Override
    public NewsInformation selectNewsInformationById(Long id)
    {
        return newsInformationMapper.selectNewsInformationById(id);
    }

    /**
     * 查询新闻资讯列表
     * 
     * @param newsInformation 新闻资讯
     * @return 新闻资讯
     */
    @Override
    public List<NewsInformation> selectNewsInformationList(NewsInformation newsInformation)
    {
        return newsInformationMapper.selectNewsInformationList(newsInformation);
    }

    /**
     * 新增新闻资讯
     * 
     * @param newsInformation 新闻资讯
     * @return 结果
     */
    @Override
    public int insertNewsInformation(NewsInformation newsInformation)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        newsInformation.setCreateBy(user.getUserName());
        newsInformation.setCreateTime(DateUtils.getNowDate());
        return newsInformationMapper.insertNewsInformation(newsInformation);
    }

    /**
     * 修改新闻资讯
     * 
     * @param newsInformation 新闻资讯
     * @return 结果
     */
    @Override
    public int updateNewsInformation(NewsInformation newsInformation)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        newsInformation.setUpdateBy(user.getUserName());
        newsInformation.setUpdateTime(DateUtils.getNowDate());
        return newsInformationMapper.updateNewsInformation(newsInformation);
    }

    /**
     * 批量删除新闻资讯
     * 
     * @param idList 需要删除的新闻资讯主键
     * @return 结果
     */
    @Override
    public int deleteNewsInformationByIds(List<Integer> idList)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        return newsInformationMapper.deleteNewsInformationByIds(idList, user.getUserName());
    }

    /**
     * 删除新闻资讯信息
     * 
     * @param id 新闻资讯主键
     * @return 结果
     */
    @Override
    public int deleteNewsInformationById(Long id)
    {
        return newsInformationMapper.deleteNewsInformationById(id);
    }
}
