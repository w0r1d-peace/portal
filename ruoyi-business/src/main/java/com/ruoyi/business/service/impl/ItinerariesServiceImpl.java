package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.ItinerariesMapper;
import com.ruoyi.business.domain.Itineraries;
import com.ruoyi.business.service.IItinerariesService;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

/**
 * 旅游行程Service业务层处理
 * 
 * @author tangJM.
 * @date 2024-12-17
 */
@Service
public class ItinerariesServiceImpl implements IItinerariesService 
{
    @Autowired
    private ItinerariesMapper itinerariesMapper;

    /**
     * 查询旅游行程
     * 
     * @param id 旅游行程主键
     * @return 旅游行程
     */
    @Override
    public Itineraries selectItinerariesById(Long id)
    {
        return itinerariesMapper.selectItinerariesById(id);
    }

    /**
     * 查询旅游行程列表
     * 
     * @param itineraries 旅游行程
     * @return 旅游行程
     */
    @Override
    public List<Itineraries> selectItinerariesList(Itineraries itineraries)
    {
        return itinerariesMapper.selectItinerariesList(itineraries);
    }

    /**
     * 新增旅游行程
     * 
     * @param itineraries 旅游行程
     * @return 结果
     */
    @Override
    public int insertItineraries(Itineraries itineraries)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        itineraries.setCreateBy(user.getUserName());
        itineraries.setCreateTime(DateUtils.getNowDate());
        return itinerariesMapper.insertItineraries(itineraries);
    }

    /**
     * 修改旅游行程
     * 
     * @param itineraries 旅游行程
     * @return 结果
     */
    @Override
    public int updateItineraries(Itineraries itineraries)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        itineraries.setUpdateBy(user.getUserName());
        itineraries.setUpdateTime(DateUtils.getNowDate());
        return itinerariesMapper.updateItineraries(itineraries);
    }

    /**
     * 批量删除旅游行程
     * 
     * @param idList 需要删除的旅游行程主键
     * @return 结果
     */
    @Override
    public int deleteItinerariesByIds(List<Integer> idList)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        String userName = user.getUserName();
        return itinerariesMapper.deleteItinerariesByIds(idList, userName);
    }

    /**
     * 删除旅游行程信息
     * 
     * @param id 旅游行程主键
     * @return 结果
     */
    @Override
    public int deleteItinerariesById(Long id)
    {
        return itinerariesMapper.deleteItinerariesById(id);
    }
}
