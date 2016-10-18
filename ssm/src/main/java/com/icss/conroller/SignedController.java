/**
 * @date 2016/10/17
 * @author 李敏
 */
package com.icss.conroller;

import java.util.List;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icss.bean.Signed;
import com.icss.business.SignedBusiness;
import com.icss.util.PageBean;

@Controller
@RequestMapping("signed")
public class SignedController {
					
	@Resource(name="signedBusiness")
	private SignedBusiness signedBusiness=null;

	public void setSignedBusiness(SignedBusiness signedBusiness) {
		this.signedBusiness = signedBusiness;
	}



	/**
	 * @param session
	 * @return 已签单客户的信息(查询第一页信息十条数据)
	 */
	@RequestMapping("signedinfo.do")
	public ModelAndView signed(HttpSession session){
		List<Signed> list = (signedBusiness.getSignedinfo(session)).getList();
		session.setAttribute("pages", (signedBusiness.getSignedinfo(session)).getPages());
		return new ModelAndView("sale/signed","signedinfo",list);
	}
		
	/**
	 * 从导航栏查询（jsp显示）
	 * @param request
	 * @return 待收款的签单信息(查询第一页十条数据)
	 */
	@RequestMapping("firstincomepay.do")
	public ModelAndView incomepay(HttpSession session){
		List<Signed> list = (signedBusiness.financeSignedinfo(1,1)).getList();
		session.setAttribute("pages", (signedBusiness.financeSignedinfo(1,1)).getPages());
		return new ModelAndView("financial/financial","financial",list);
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("nextsignedinfo.do")
	public @ResponseBody String nextsignedinfo(HttpServletRequest request){
		return null;
	}
	
	/**
	 * 从下拉列表中查询
	 * @param request
	 * @return 查看不同状态的签单信息
	 * 用ajax传递数据(@ResponseBody)
	 */
	@RequestMapping("signstatus.do")
	public @ResponseBody String signstatus(HttpServletRequest request){
		int stateid = Integer.parseInt(request.getParameter("status"));
		int pagenum = Integer.parseInt(request.getParameter("pagenum"));
		PageBean<Signed> list = signedBusiness.financeSignedinfo(stateid,pagenum);
		JSONArray jsonArray = JSONArray.fromObject(list);
		return jsonArray.toString();
	} 
	
	
}
