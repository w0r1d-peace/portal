package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.business.domain.vo.EnterpriseInfoVO;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.EnterpriseInfoMapper;
import com.ruoyi.business.domain.EnterpriseInfo;
import com.ruoyi.business.service.IEnterpriseInfoService;
import com.ruoyi.common.core.text.Convert;

/**
 * 网站信息Service业务层处理
 *
 * @author tangJM.
 * @date 2024-12-05
 */
@Service
public class EnterpriseInfoServiceImpl implements IEnterpriseInfoService
{
    @Autowired
    private EnterpriseInfoMapper enterpriseInfoMapper;

    /**
     * 查询网站信息
     *
     * @param id 网站信息主键
     * @return 网站信息
     */
    @Override
    public EnterpriseInfo selectEnterpriseInfoById(Long id)
    {
        return enterpriseInfoMapper.selectEnterpriseInfoById(id);
    }

    /**
     * 查询网站信息列表
     *
     * @param enterpriseInfo 网站信息
     * @return 网站信息
     */
    @Override
    public List<EnterpriseInfo> selectEnterpriseInfoList(EnterpriseInfo enterpriseInfo)
    {
        return enterpriseInfoMapper.selectEnterpriseInfoList(enterpriseInfo);
    }

    /**
     * 新增网站信息
     *
     * @param enterpriseInfo 网站信息
     * @return 结果
     */
    @Override
    public int insertEnterpriseInfo(EnterpriseInfo enterpriseInfo)
    {
        enterpriseInfo.setCreateTime(DateUtils.getNowDate());
        return enterpriseInfoMapper.insertEnterpriseInfo(enterpriseInfo);
    }

    /**
     * 修改网站信息
     *
     * @param enterpriseInfo 网站信息
     * @return 结果
     */
    @Override
    public int updateEnterpriseInfo(EnterpriseInfo enterpriseInfo)
    {
        enterpriseInfo.setUpdateTime(DateUtils.getNowDate());
        return enterpriseInfoMapper.updateEnterpriseInfo(enterpriseInfo);
    }

    /**
     * 批量删除网站信息
     *
     * @param ids 需要删除的网站信息主键
     * @return 结果
     */
    @Override
    public int deleteEnterpriseInfoByIds(String ids)
    {
        return enterpriseInfoMapper.deleteEnterpriseInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除网站信息信息
     *
     * @param id 网站信息主键
     * @return 结果
     */
    @Override
    public int deleteEnterpriseInfoById(Long id)
    {
        return enterpriseInfoMapper.deleteEnterpriseInfoById(id);
    }

    /**
     * 获取公司信息
     * @return
     */
    @Override
    public EnterpriseInfoVO info() {
        List<EnterpriseInfo> enterpriseInfoList = enterpriseInfoMapper.selectEnterpriseInfoList(new EnterpriseInfo());
        if (enterpriseInfoList.size() > 0) {
            EnterpriseInfo enterpriseInfo = enterpriseInfoList.get(0);
            EnterpriseInfoVO enterpriseInfoVO = new EnterpriseInfoVO();
            BeanUtils.copyProperties(enterpriseInfo, enterpriseInfoVO);
            return enterpriseInfoVO;
        }

        return null;
    }
}
