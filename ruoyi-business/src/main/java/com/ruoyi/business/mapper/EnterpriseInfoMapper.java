package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.EnterpriseInfo;

/**
 * 网站信息Mapper接口
 *
 * @author tangJM.
 * @date 2024-12-05
 */
public interface EnterpriseInfoMapper
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
     * 删除网站信息
     *
     * @param id 网站信息主键
     * @return 结果
     */
    public int deleteEnterpriseInfoById(Long id);

    /**
     * 批量删除网站信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteEnterpriseInfoByIds(String[] ids);
}
