package com.icss.conroller;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.bean.PayRecord;
import com.icss.bean.Sigdet;
import com.icss.bean.ViewEmpallinfo;
import com.icss.bean.ViewSigpayinfo;
import com.icss.business.PayRecordBusiness;

@Controller
@RequestMapping("payrecord")
public class PayRecordController {
	
	@Resource(name="payRecordBusiness")
	private PayRecordBusiness payRecordBusiness = null;

	public void setPayRecordBusiness(PayRecordBusiness payRecordBusiness) {
		this.payRecordBusiness = payRecordBusiness;
	}
	
	//新增某客户收款信息
	@RequestMapping("addrecord.do")
	public String addrecord(@ModelAttribute("record") PayRecord record){
		if("".equals(record.getPrtime())||record.getPrtime()==null){
			Format format = new SimpleDateFormat("yyyy-MM-dd");
			record.setPrtime(format.format(new Date()));
		}
		payRecordBusiness.addrecord(record);
		return "redirect:/customer/manager.do";
	}
	
	//新增退款信息
	@RequestMapping("rebatecode.do")
	public String rebatecode(@ModelAttribute("recode") PayRecord recode,HttpSession session){
		recode.setPrhandler(((ViewEmpallinfo)session.getAttribute("loginemp")).getEid());
		if(recode.getPrpaymoney()>=0){
			recode.setPrpaymoney(0-recode.getPrpaymoney());
		}
		if("".equals(recode.getPrtime())||recode.getPrtime()==null){
			Format format = new SimpleDateFormat("yyyy-MM-dd");
			recode.setPrtime(format.format(new Date()));
		}
		System.out.println(recode.getPrpaymoney());
		payRecordBusiness.addrecord(recode);
		return  "redirect:/customer/manager.do";
	}
	//查看某客户已交金额
	@RequestMapping("getcountmoney.do")
	public String getcountmoney(HttpServletRequest request,HttpSession session){
		int cid = Integer.valueOf(request.getParameter("cid"));
		Float summoney = payRecordBusiness.countmoney(cid);
		session.setAttribute("countmoney", summoney);
		return "redirect:/paytype/selectypeall.do?status="+request.getParameter("status");
	}
	
	//查看某用户已交金额详情
	@RequestMapping("sigdet.do")
	public @ResponseBody String sigdet(HttpServletRequest request){
		int cid = Integer.valueOf(request.getParameter("cid"));
		List<Sigdet> list = payRecordBusiness.sigset(cid);
		JSONArray jsonArray = JSONArray.fromObject(list);
		System.out.println(jsonArray);
		return jsonArray.toString();
	} 
}
