package com.ruoyi.web.controller.business;

import com.ruoyi.business.domain.vo.PayQrCodeVO;
import com.ruoyi.business.service.IPayService;
import com.ruoyi.business.util.PayTypeEnum;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

@RestController
@RequestMapping("/business/pay")
public class PayController {

    @Autowired
    private IPayService payService;

    /**
     * 生成支付二维码
     */
    @GetMapping("/generatePayQrCode")
    public AjaxResult generatePayQrCode(Long trxamt, String payType) {
        if (trxamt == null) {
            return AjaxResult.error("金额不能为空");
        }
        if (payType == null) {
            return AjaxResult.error("支付类型不能为空");
        }

        if (!PayTypeEnum.existsByCode(payType)) {
            throw new RuntimeException("支付类型不存在");
        }

        PayQrCodeVO payQrCodeVO = payService.generatePayQrCode(trxamt, payType);
        return AjaxResult.success(payQrCodeVO);
    }
}
