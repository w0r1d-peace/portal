package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.PaymentAgent;

/**
 * 代缴学费Service接口
 * 
 * @author tangJM.
 * @date 2024-12-18
 */
public interface IPaymentAgentService 
{
    /**
     * 查询代缴学费
     * 
     * @param id 代缴学费主键
     * @return 代缴学费
     */
    public PaymentAgent selectPaymentAgentById(Long id);

    /**
     * 查询代缴学费列表
     * 
     * @param paymentAgent 代缴学费
     * @return 代缴学费集合
     */
    public List<PaymentAgent> selectPaymentAgentList(PaymentAgent paymentAgent);

    /**
     * 新增代缴学费
     * 
     * @param paymentAgent 代缴学费
     * @return 结果
     */
    public int insertPaymentAgent(PaymentAgent paymentAgent);

    /**
     * 修改代缴学费
     * 
     * @param paymentAgent 代缴学费
     * @return 结果
     */
    public int updatePaymentAgent(PaymentAgent paymentAgent);

    /**
     * 批量删除代缴学费
     * 
     * @param ids 需要删除的代缴学费主键集合
     * @return 结果
     */
    public int deletePaymentAgentByIds(List<Integer> ids);

    /**
     * 删除代缴学费信息
     * 
     * @param id 代缴学费主键
     * @return 结果
     */
    public int deletePaymentAgentById(Long id);
}
