package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.EnterpriseInfo;
import com.ruoyi.business.domain.vo.EnterpriseInfoVO;

/**
 * 网站信息Service接口
 *
 * @author tangJM.
 * @date 2024-12-05
 */
public interface IEnterpriseInfoService
{
    /**
     * 查询网站信息
     *
     * @param id 网站信息主键
     * @return 网站信息
     */
    public EnterpriseInfo selectEnterpriseInfoById(Long id);

    /**
     * 查询网站信息列表
     *
     * @param enterpriseInfo 网站信息
     * @return 网站信息集合
     */
    public List<EnterpriseInfo> selectEnterpriseInfoList(EnterpriseInfo enterpriseInfo);

    /**
     * 新增网站信息
     *
     * @param enterpriseInfo 网站信息
     * @return 结果
     */
    public int insertEnterpriseInfo(EnterpriseInfo enterpriseInfo);

    /**
     * 修改网站信息
     *
     * @param enterpriseInfo 网站信息
     * @return 结果
     */
    public int updateEnterpriseInfo(EnterpriseInfo enterpriseInfo);

    /**
     * 批量删除网站信息
     *
     * @param ids 需要删除的网站信息主键集合
     * @return 结果
     */
    public int deleteEnterpriseInfoByIds(String ids);

    /**
     * 删除网站信息信息
     *
     * @param id 网站信息主键
     * @return 结果
     */
    public int deleteEnterpriseInfoById(Long id);

    /**
     * 获取公司信息
     *
     * @return
     */
    EnterpriseInfoVO info();
}
