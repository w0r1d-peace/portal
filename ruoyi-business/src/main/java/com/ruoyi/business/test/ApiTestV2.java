package com.ruoyi.business.test;

import com.ruoyi.business.util.pay.SybPayService;

import java.util.Map;



public class ApiTestV2 {
	public static void main(String[] args) throws Exception{
//		testPay();//统一下单，异步类交易
//		testScanPay();//统一扫码，被扫交易
//		testCancel();//撤销
//		testRefund();//退款
		testQuery();//查询
	}
	

	public static void testScanPay() throws Exception {
		// TODO Auto-generated method stub
		SybPayService service = new SybPayService();
		String reqsn = String.valueOf(System.currentTimeMillis());
		Map<String, String> map = service.scanPay(1, reqsn,  "标题", "备注",  "134775931316089668","","","","");
		print(map);
	}

	public static void testQuery() throws Exception{
		SybPayService service = new SybPayService();
		Map<String, String> map = service.query("", "112094120001088317");
		print(map);
	}
	
	public static void testRefund() throws Exception{
		SybPayService service = new SybPayService();
		String reqsn = String.valueOf(System.currentTimeMillis());
		Map<String, String> map = service.refund(1, reqsn, "", "20160712167578.2547");
		print(map);
	}
	
	public static void testCancel() throws Exception{
		SybPayService service = new SybPayService();
		String reqsn = String.valueOf(System.currentTimeMillis());
		Map<String, String> map = service.cancel(1, reqsn, "112094120001088316", "");
		print(map);
	}
	
	public static void testPay() throws Exception{
		SybPayService service = new SybPayService();
		String reqsn = String.valueOf(System.currentTimeMillis());
		Map<String, String> map = service.pay(1, reqsn, "W01", "标题", "备注", "", "123","https://test.allinpaygd.com/JWeb/NotifyServlet","","","","", "", "", "", "", "", "", "","");
		print(map);
	}
	
	public static void print(Map<String, String> map){
		System.out.println("返回数据如下:");
		if(map!=null){
			for(String key:map.keySet()){
				System.out.println(key+";"+map.get(key));
			}
		}
	}
	
	
}
