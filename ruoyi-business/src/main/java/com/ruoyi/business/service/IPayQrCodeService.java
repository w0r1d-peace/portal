package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.PayQrCode;

/**
 * 支付二维码Service接口
 * 
 * @author tangJM.
 * @date 2024-12-20
 */
public interface IPayQrCodeService 
{
    /**
     * 查询支付二维码
     * 
     * @param id 支付二维码主键
     * @return 支付二维码
     */
    public PayQrCode selectPayQrCodeById(Long id);

    /**
     * 查询支付二维码列表
     * 
     * @param payQrCode 支付二维码
     * @return 支付二维码集合
     */
    public List<PayQrCode> selectPayQrCodeList(PayQrCode payQrCode);

    /**
     * 新增支付二维码
     * 
     * @param payQrCode 支付二维码
     * @return 结果
     */
    public int insertPayQrCode(PayQrCode payQrCode);

    /**
     * 修改支付二维码
     * 
     * @param payQrCode 支付二维码
     * @return 结果
     */
    public int updatePayQrCode(PayQrCode payQrCode);

    /**
     * 批量删除支付二维码
     * 
     * @param ids 需要删除的支付二维码主键集合
     * @return 结果
     */
    public int deletePayQrCodeByIds(Long[] ids);

    /**
     * 删除支付二维码信息
     * 
     * @param id 支付二维码主键
     * @return 结果
     */
    public int deletePayQrCodeById(Long id);
}
