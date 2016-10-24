/**
 * @date 2016/10/17
 * @author 李敏
 */
package com.icss.conroller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.icss.bean.Iaer;
import com.icss.bean.Signed;
import com.icss.business.SignedBusiness;
import com.icss.util.PageBean;
import com.icss.util.ReadExcel;

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
	
	/**
	 * @param request
	 * @return 一条签单的信息
	 */
	@RequestMapping("onesign.do")
	public @ResponseBody String onesign(HttpServletRequest request){
		JSONArray jsonArray = JSONArray.fromObject(signedBusiness.selectSignedById(request));
		System.out.println(jsonArray.toString());
		return jsonArray.toString();
	}
	
	/**
	 * 增加一条收款记录，修改签单信息（有需要的话）
	 * @param signed
	 * @param request
	 * @return
	 */
	@RequestMapping("addoneiaer.do")
	public String addoneiaer(@ModelAttribute("iaer") Iaer iaer, HttpServletRequest request){
		signedBusiness.addAndChange(request, iaer);
		return null;
	}
	
	/** 
     * 读取Excel数据到数据库 
     * @param file 
     * @param request 
     * @return 
     * @throws IOException 
     * @author chen
	 * @throws ServletException 
     */  
    @RequestMapping(value="readExcel.do")   
    public ModelAndView readExcel(@RequestParam(value="mFile") MultipartFile mFile,HttpServletRequest request,HttpSession session,HttpServletResponse response) throws IOException, ServletException{  
   
   	
    	MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
    	mFile = multipartRequest.getFile("mFile");
    	String path = request.getSession().getServletContext().getRealPath("/WEB-INF/upload/");//获取文件名 的路径
    	System.out.println(path);
    	String name = mFile.getOriginalFilename();   //获取文件名     
    	System.out.println(name);
    	InputStream inputStream = mFile.getInputStream();
    	 
    	 byte[] b = new byte[1048576];
    	 int length = inputStream.read(b);
    	 path += "\\" + name;
    	 FileOutputStream outputStream = new FileOutputStream(path);
    	 outputStream.write(b, 0, length);
    	 inputStream.close();
    	 outputStream.close();
       

    	ReadExcel xlsMain = new ReadExcel();
    	Signed signed=null;
    	try {
			List<Signed> ListResult =xlsMain.ReadInExcel(path);
			if(ListResult!=null){				
				for(int i=0;i<ListResult.size();i++){
					signed=ListResult.get(i);				
					signedBusiness.InsertSigned(signed);
					
				}				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
        return new ModelAndView("sale/signed") ;  
    }
    /**
	 * @param request
	 * @return 返款签单的信息
	 */ 
    @RequestMapping(value="BackFreeId.do")   
	public String BackFree(HttpServletRequest request,HttpSession session){
    	Integer sid= Integer.parseInt(request.getParameter("sid"));
    	List<Signed> list=	signedBusiness.SelecByid(sid);
    	session.setAttribute("listbackfree", list);
		
		return "financial/financial";
	

	}
	
}
