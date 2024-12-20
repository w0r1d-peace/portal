package com.ruoyi.business.service.impl;

import com.ruoyi.business.domain.PayQrCode;
import com.ruoyi.business.domain.vo.PayQrCodeVO;
import com.ruoyi.business.service.IPayQrCodeService;
import com.ruoyi.business.service.IPayService;
import com.ruoyi.business.util.pay.SybPayService;
import com.ruoyi.common.exception.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class IPayServiceImpl implements IPayService {

    @Autowired
    private IPayQrCodeService payQrCodeService;

    /**
     * 生成支付二维码
     * @param trxamt
     * @param payType
     * @return
     */
    @Override
    public PayQrCodeVO generatePayQrCode(Long trxamt, String payType) {
        SybPayService service = new SybPayService();
        String reqsn = String.valueOf(System.currentTimeMillis());
        try {
            Map<String, String> map = service.pay(trxamt, reqsn, payType, "", "", "", "120",null,"","","","", "", "", "", "", "", "", "","");
            if (!map.get("retcode").equals("SUCCESS")) {
                throw new ServiceException("生成二维码异常，请联系管理员");
            }

            PayQrCode payQrCode = new PayQrCode();
            payQrCode.setAppid(map.get("appid"));
            payQrCode.setCusid(map.get("cusid"));
            payQrCode.setPayinfo(map.get("payinfo"));
            payQrCode.setRandomstr(map.get("randomstr"));
            payQrCode.setReqsn(map.get("reqsn"));
            payQrCode.setRetcode(map.get("retcode"));
            payQrCode.setSign(map.get("sign"));
            payQrCode.setTrxcode(map.get("trxcode"));
            payQrCode.setTrxid(map.get("trxid"));
            payQrCode.setTrxstatus(map.get("trxstatus"));
            payQrCodeService.insertPayQrCode(payQrCode);


            PayQrCodeVO payQrCodeVO = new PayQrCodeVO();
            payQrCodeVO.setPayinfo(map.get("payinfo"));

        } catch (Exception e) {
            throw new ServiceException("生成二维码异常，请联系管理员");
        }

        return null;
    }
}
