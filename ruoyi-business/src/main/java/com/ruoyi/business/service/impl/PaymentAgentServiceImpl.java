package com.ruoyi.business.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.PaymentAgentMapper;
import com.ruoyi.business.domain.PaymentAgent;
import com.ruoyi.business.service.IPaymentAgentService;

/**
 * 代缴学费Service业务层处理
 * 
 * @author tangJM.
 * @date 2024-12-17
 */
@Service
public class PaymentAgentServiceImpl implements IPaymentAgentService 
{
    @Autowired
    private PaymentAgentMapper paymentAgentMapper;

    /**
     * 查询代缴学费
     * 
     * @param id 代缴学费主键
     * @return 代缴学费
     */
    @Override
    public PaymentAgent selectPaymentAgentById(Long id)
    {
        return paymentAgentMapper.selectPaymentAgentById(id);
    }

    /**
     * 查询代缴学费列表
     * 
     * @param paymentAgent 代缴学费
     * @return 代缴学费
     */
    @Override
    public List<PaymentAgent> selectPaymentAgentList(PaymentAgent paymentAgent)
    {
        return paymentAgentMapper.selectPaymentAgentList(paymentAgent);
    }

    /**
     * 新增代缴学费
     * 
     * @param paymentAgent 代缴学费
     * @return 结果
     */
    @Override
    public int insertPaymentAgent(PaymentAgent paymentAgent)
    {
        paymentAgent.setCreateTime(DateUtils.getNowDate());
        return paymentAgentMapper.insertPaymentAgent(paymentAgent);
    }

    /**
     * 修改代缴学费
     * 
     * @param paymentAgent 代缴学费
     * @return 结果
     */
    @Override
    public int updatePaymentAgent(PaymentAgent paymentAgent)
    {
        paymentAgent.setUpdateTime(DateUtils.getNowDate());
        return paymentAgentMapper.updatePaymentAgent(paymentAgent);
    }

    /**
     * 批量删除代缴学费
     * 
     * @param ids 需要删除的代缴学费主键
     * @return 结果
     */
    @Override
    public int deletePaymentAgentByIds(Long[] ids)
    {
        return paymentAgentMapper.deletePaymentAgentByIds(ids);
    }

    /**
     * 删除代缴学费信息
     * 
     * @param id 代缴学费主键
     * @return 结果
     */
    @Override
    public int deletePaymentAgentById(Long id)
    {
        return paymentAgentMapper.deletePaymentAgentById(id);
    }
}
