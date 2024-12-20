package com.ruoyi.business.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.PayQrCodeMapper;
import com.ruoyi.business.domain.PayQrCode;
import com.ruoyi.business.service.IPayQrCodeService;

/**
 * 支付二维码Service业务层处理
 * 
 * @author tangJM.
 * @date 2024-12-20
 */
@Service
public class PayQrCodeServiceImpl implements IPayQrCodeService 
{
    @Autowired
    private PayQrCodeMapper payQrCodeMapper;

    /**
     * 查询支付二维码
     * 
     * @param id 支付二维码主键
     * @return 支付二维码
     */
    @Override
    public PayQrCode selectPayQrCodeById(Long id)
    {
        return payQrCodeMapper.selectPayQrCodeById(id);
    }

    /**
     * 查询支付二维码列表
     * 
     * @param payQrCode 支付二维码
     * @return 支付二维码
     */
    @Override
    public List<PayQrCode> selectPayQrCodeList(PayQrCode payQrCode)
    {
        return payQrCodeMapper.selectPayQrCodeList(payQrCode);
    }

    /**
     * 新增支付二维码
     * 
     * @param payQrCode 支付二维码
     * @return 结果
     */
    @Override
    public int insertPayQrCode(PayQrCode payQrCode)
    {
        payQrCode.setCreateTime(DateUtils.getNowDate());
        return payQrCodeMapper.insertPayQrCode(payQrCode);
    }

    /**
     * 修改支付二维码
     * 
     * @param payQrCode 支付二维码
     * @return 结果
     */
    @Override
    public int updatePayQrCode(PayQrCode payQrCode)
    {
        payQrCode.setUpdateTime(DateUtils.getNowDate());
        return payQrCodeMapper.updatePayQrCode(payQrCode);
    }

    /**
     * 批量删除支付二维码
     * 
     * @param ids 需要删除的支付二维码主键
     * @return 结果
     */
    @Override
    public int deletePayQrCodeByIds(Long[] ids)
    {
        return payQrCodeMapper.deletePayQrCodeByIds(ids);
    }

    /**
     * 删除支付二维码信息
     * 
     * @param id 支付二维码主键
     * @return 结果
     */
    @Override
    public int deletePayQrCodeById(Long id)
    {
        return payQrCodeMapper.deletePayQrCodeById(id);
    }
}
