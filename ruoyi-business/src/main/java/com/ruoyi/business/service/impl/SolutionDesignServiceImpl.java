package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.business.domain.vo.SolutionDesignListVO;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.SolutionDesignMapper;
import com.ruoyi.business.domain.SolutionDesign;
import com.ruoyi.business.service.ISolutionDesignService;

import static com.ruoyi.common.utils.SecurityUtils.getLoginUser;

/**
 * 方案设计Service业务层处理
 * 
 * @author tangJM.
 * @date 2024-12-18
 */
@Service
public class SolutionDesignServiceImpl implements ISolutionDesignService 
{
    @Autowired
    private SolutionDesignMapper solutionDesignMapper;

    /**
     * 查询方案设计
     * 
     * @param id 方案设计主键
     * @return 方案设计
     */
    @Override
    public SolutionDesign selectSolutionDesignById(Long id)
    {
        return solutionDesignMapper.selectSolutionDesignById(id);
    }

    /**
     * 查询方案设计列表
     * 
     * @param solutionDesign 方案设计
     * @return 方案设计
     */
    @Override
    public List<SolutionDesignListVO> selectSolutionDesignList(SolutionDesign solutionDesign)
    {
        return solutionDesignMapper.selectSolutionDesignList(solutionDesign);
    }

    /**
     * 新增方案设计
     * 
     * @param solutionDesign 方案设计
     * @return 结果
     */
    @Override
    public int insertSolutionDesign(SolutionDesign solutionDesign)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        solutionDesign.setCreateBy(user.getUserName());
        solutionDesign.setCreateTime(DateUtils.getNowDate());
        return solutionDesignMapper.insertSolutionDesign(solutionDesign);
    }

    /**
     * 修改方案设计
     * 
     * @param solutionDesign 方案设计
     * @return 结果
     */
    @Override
    public int updateSolutionDesign(SolutionDesign solutionDesign)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        solutionDesign.setUpdateBy(user.getUserName());
        solutionDesign.setUpdateTime(DateUtils.getNowDate());
        return solutionDesignMapper.updateSolutionDesign(solutionDesign);
    }

    /**
     * 批量删除方案设计
     * 
     * @param idList 需要删除的方案设计主键
     * @return 结果
     */
    @Override
    public int deleteSolutionDesignByIds(List<Integer> idList)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        return solutionDesignMapper.deleteSolutionDesignByIds(idList, user.getUserName());
    }

    /**
     * 删除方案设计信息
     * 
     * @param id 方案设计主键
     * @return 结果
     */
    @Override
    public int deleteSolutionDesignById(Long id)
    {
        return solutionDesignMapper.deleteSolutionDesignById(id);
    }
}
