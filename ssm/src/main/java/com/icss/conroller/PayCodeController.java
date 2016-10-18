package com.icss.conroller;

import java.io.UnsupportedEncodingException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icss.bean.CodesInfo;
import com.icss.bean.Customerinfo;
import com.icss.bean.Detailed;
import com.icss.bean.PayCode;
import com.icss.bean.PayRecord;
import com.icss.bean.Receivables;
import com.icss.bean.SaleRanking;
import com.icss.business.CustomerBusiness;
import com.icss.business.PayCodeBusiness;
import com.icss.business.PayRecordBusiness;
import com.icss.util.PageBean;

@Controller
@RequestMapping("/paycode")
public class PayCodeController {
	@Resource(name = "paycodeBusiness")
	private PayCodeBusiness paycodeBusiness = null;

	public void setPaycodeBusiness(PayCodeBusiness paycodeBusiness) {
		this.paycodeBusiness = paycodeBusiness;
	}
	
	@Resource(name="payRecordBusiness")
	private PayRecordBusiness payRecordBusiness = null;

	public void setPayRecordBusiness(PayRecordBusiness payRecordBusiness) {
		this.payRecordBusiness = payRecordBusiness;
	}
	
	@Resource(name="customerBusiness")
	private CustomerBusiness customerBusiness = null;

	public void setCustomerBusiness(CustomerBusiness customerBusiness) {
		this.customerBusiness = customerBusiness;
	}

	List<String> bustypelist = null;

	// 新增签单(增加数据)
	@RequestMapping("addonecode.do")
	public String addonecode(@ModelAttribute("paycode") PayCode paycode,@ModelAttribute("customerinfo") Customerinfo customerinfo,@ModelAttribute("detailed") Detailed detailed,HttpServletRequest request) {
		customerinfo.setCronline(3);
		customerBusiness.updataCustomerInfo(customerinfo);
		detailed.setCdid(customerinfo.getCrid());
		customerBusiness.updatedeinfo(detailed);
		if("".equals(paycode.getCtime())||paycode.getCtime()==null){
			Format format = new SimpleDateFormat("yyyy-MM-dd");
	        paycode.setCtime(format.format(new Date()));
		}
		paycodeBusiness.inserCode(paycode);
		String[] strs =  request.getParameterValues("pay");
		if(strs!=null){//新增收款信息
			for(int i=0 ; i<strs.length;i++){
				PayRecord record = new PayRecord();
				record.setPrtime(paycode.getCtime());
				record.setPrhandler(paycode.getSale());
				record.setPrpaycode(paycode.getCid());
				String cost = strs[i];
				if(cost.startsWith("!")){
					cost = cost.substring(1);
					record.setPrpaytype(1);
				}else if(cost.startsWith("#")){
					record.setPrpaytype(2);
					cost = cost.substring(1);
				}
				record.setPrpaymoney(Float.valueOf(cost));
				payRecordBusiness.addrecord(record);
			}
		}
		return "customer/customer";
	}

	// 统计上月签单排名
	@RequestMapping("ranking.do")
	public @ResponseBody String ranking() {
		System.out.println("统计签单");
		List<SaleRanking> list = paycodeBusiness.ranking();
		JSONArray jsonArray = JSONArray.fromObject(list);
		return jsonArray.toString();
	}

	// 报表
	@RequestMapping("reports.do")
	public String reports(HttpSession session) {
		List<SaleRanking> list = paycodeBusiness.bustyperanking();
		Iterator<SaleRanking> it = list.iterator();
		bustypelist = new ArrayList<String>();
		while (it.hasNext()) {
			SaleRanking a = it.next();
			bustypelist.add(a.getEname());
		}
		JSONArray jsonArray = JSONArray.fromObject(list);
		session.setAttribute("typelist", jsonArray.toString());
		return "redirect:/paycode/selectDeptMoney.do";

	}

	// 部门月度排名
	@RequestMapping("selectDeptMoney.do")
	public String selectDeptMoney(HttpSession session) {
		List<SaleRanking> list = paycodeBusiness.deptranking();
		JSONArray jsonArray = JSONArray.fromObject(list);
		session.setAttribute("deptlist", jsonArray.toString());
		return "redirect:/paycode/selectAreaMoney.do";

	}

	// 地区月度排名
	@RequestMapping("selectAreaMoney.do")
	public String selectAreaMoney(HttpSession session) {
		List<SaleRanking> list = paycodeBusiness.arearanking();
		JSONArray jsonArray = JSONArray.fromObject(list);
		session.setAttribute("arealist", jsonArray.toString());
		return "redirect:/paycode/selectMonthMoney.do";
	}

	// 年度每月排名
	@RequestMapping("selectMonthMoney.do")
	public String selectMonthMoney(HttpSession session) {
		List<SaleRanking> list = paycodeBusiness.monthranking();
		JSONArray jsonArray = JSONArray.fromObject(list);
		session.setAttribute("monthlist", jsonArray.toString());
		return "redirect:/paycode/selectMonthTypeMoney.do";
	}

	// 年度每月类型呢排名
	@RequestMapping("selectMonthTypeMoney.do")
	public String selectMonthTypeMoney(HttpSession session) {
		List<List<SaleRanking>> lists = new ArrayList<List<SaleRanking>>();
		Iterator<String> it = bustypelist.iterator();
		while (it.hasNext()) {
			List<SaleRanking> list = paycodeBusiness
					.monthtyperanking(it.next());
			lists.add(list);
		}
		JSONArray jsonArray = JSONArray.fromObject(lists);
		session.setAttribute("monthtypelist", jsonArray.toString());
		System.out.println(jsonArray.toString());
		return "public/contents";
	}

	/************************************************** cq ***************************************************************/
	//待收款客户信息
	@RequestMapping("payment.do")
	public @ResponseBody String payment(HttpServletRequest request){
		
		int pagenum = Integer.valueOf(request.getParameter("pageNum"));
		System.out.println(pagenum);
		PageBean<Receivables> creceivables = paycodeBusiness.creceivables(pagenum);
		List<Receivables> receivables = creceivables.getList();
		JSONArray jsonArray = JSONArray.fromObject(receivables);
		return jsonArray.toString();
	}
	
	// 跳转业务管理页面
	@RequestMapping("Codes.do")
	public String business_code(HttpSession session) {
		PageBean<CodesInfo> page = paycodeBusiness.selectAllInfo(1);
		List<CodesInfo> Codes = page.getList();
		PageBean<Receivables> creceivables = paycodeBusiness.creceivables(1);
		List<Receivables> receivables = creceivables.getList();
		session.setAttribute("receivables", receivables);
		session.setAttribute("codes", Codes);
		session.setAttribute("pages", page.getPages());
		session.setAttribute("cpages", creceivables.getPages());
		return "business/Codes";
	}

	// 删除
	@RequestMapping("deletebyid.do")
	public String delete(HttpServletRequest request, Model model) {
		Integer cid = Integer.valueOf(request.getParameter("id"));
		paycodeBusiness.delete(cid);
		return "business/Codes";
	}

	// 更新
	@RequestMapping("updatebyid.do")
	public String update(@ModelAttribute("code") PayCode code) {
		System.out.println("2313");
		System.out.println(code.getCtype());
		System.out.println(code.getCremark());
		System.out.println(code.getCtime());
		System.out.println(code.getCarea());
		System.out.println(code.getCid());
		System.out.println(code.getCreceivables());
		paycodeBusiness.updataCodes(code);
		return "redirect:/paycode/Codes.do";

	}

	@RequestMapping(value = "selectByPrimaryKey.do", produces = "text/plain;charset=UTF-8")
	public String selectByPrimaryKey(HttpServletRequest request,
			HttpSession session) {
		String xx = request.getParameter("crname");
		System.out.println(xx);
		Integer cid = Integer.valueOf(request.getParameter("cid"));
		System.out.println(cid);
		try {
			xx = new String(xx.getBytes("iso8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PayCode code = paycodeBusiness.selectByPrimaryKey(cid);
		System.out.println(code.getCrid());
		session.setAttribute("code", code);
		session.setAttribute("crname", xx);
		return "redirect:/emp/selectemp.do";

	}

	// 分页
	@RequestMapping(value = "pageselect.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String pageselect(HttpServletRequest request,
			HttpSession session) {
		String pageNum = request.getParameter("pageNum");
		System.out.println(pageNum);
		int num;
		if (pageNum == null || "NaN".equals(pageNum)) {
			num = 0;
		} else {
			num = Integer.parseInt(pageNum);
		}

		PageBean<CodesInfo> page = paycodeBusiness.selectAllInfo(num);
		List<CodesInfo> Pers = page.getList();

		session.setAttribute("pages", page.getPages());
		JSONArray jsonArray = JSONArray.fromObject(Pers);
		return jsonArray.toString();
	}
}
