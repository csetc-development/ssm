package com.icss.conroller;

import java.io.UnsupportedEncodingException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSON;
import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icss.bean.Codecustomer;
import com.icss.bean.Score;
import com.icss.bean.Space;
import com.icss.bean.Stay;
import com.icss.bean.Students;
import com.icss.bean.StudentsManagement;
import com.icss.bean.Studentsinfo;
import com.icss.business.EtccclassBusiness;
import com.icss.business.PayCodeBusiness;
import com.icss.business.StudentsBusiness;
import com.icss.util.PageBean;

@Controller
@RequestMapping("/student")
public class StudentsController {
	//该参数用于判断临时session的种类：0--清空，1--添加，2--删除,3--修改
	public static int stutemp = 0;
	
	@Resource(name="studentsBusiness")
	private StudentsBusiness studentsBusiness = null;

	public void setStudentsBusiness(StudentsBusiness studentsBusiness) {
		this.studentsBusiness = studentsBusiness;
	}

	@Resource(name="paycodeBusiness")
	private PayCodeBusiness paycodeBusiness = null;

	public void setPaycodeBusiness(PayCodeBusiness paycodeBusiness) {
		this.paycodeBusiness = paycodeBusiness;
	}
	
	@Resource(name="etcclassBusiness")
	private EtccclassBusiness etcclassBusiness =null;

	public void setEtcclassbusiness(EtccclassBusiness etcclassbusiness) {
		this.etcclassBusiness = etcclassbusiness;
	}
	

	@RequestMapping("management.do")
	public String stumanagement(HttpSession session,HttpServletRequest request){
		//查看学员信息
		PageBean<Studentsinfo> page = studentsBusiness.studentsinfo(1);
		List<Studentsinfo> list = page.getList();
		session.setAttribute("stusinfo", list);
		session.setAttribute("stupages", page.getPages());
		List<Codecustomer> codecustomer = paycodeBusiness.selectallcode();
		session.setAttribute("Comingsoon", codecustomer);//已签单未入学的客户
		if(request.getParameter("str")!=null||request.getParameter("str")!=""){
			request.setAttribute("deletemsg",request.getParameter("str"));
		}
		return "student/students";
	}
	
	/**
	 * 显示班级学生页面
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("classstudent.do")
	public String classstudent(HttpServletRequest request,HttpSession session){
		int etcid = Integer.parseInt(request.getParameter("etcid"));
		session.setAttribute("stulist", studentsBusiness.stulist(etcid));//某班级学生信息
		session.setAttribute("etcid", etcid);
		
		return "student/classstudents";
	}
	
	/**
	 * 跳转到新增学员页面
	 * @param session
	 * @return
	 */
	@RequestMapping("addstudents.do")
	public String addstudent(HttpSession session,HttpServletRequest request){
		int etcid = Integer.valueOf(request.getParameter("etcid"));
		session.setAttribute("classname",etcclassBusiness.oneclassinfo(etcid));//获得班级信息
		session.setAttribute("stuid", etcclassBusiness.newstuid(etcid));//获得学号
		session.setAttribute("students", paycodeBusiness.selectallcode());//学员姓名学号
		utilinfo(session);
		return "student/addstudent";
	}
	
	/**
	 * 跳转到新增学员页面2
	 * @param session
	 * @return
	 */
	@RequestMapping("addstudents2.do")
	public String addstudent2(HttpSession session,HttpServletRequest request){
//		int etcid = Integer.valueOf(request.getParameter("etcid"));
		/*session.setAttribute("classname",etcclassBusiness.oneclassinfo(etcid));//获得班级信息
		session.setAttribute("stuid", etcclassBusiness.newstuid(etcid));//获得学号
*/		session.setAttribute("students", paycodeBusiness.selectallcode());//学员姓名学号
		session.setAttribute("classname", studentsBusiness.allowaddstuclass());					
		utilinfo(session);
		return "student/addstudent2";
	}
	
	
	/**  
     *学员管理--根据学号查看某个学员信息（多表联合查询）
     * @param  HttpSession session
     * @param  HttpServletRequest request
     * @return 无 
     */
	@RequestMapping("selectBysid.do")
	public ModelAndView selectone(HttpSession session ,HttpServletRequest request){
		Integer sid = Integer.valueOf(request.getParameter("sid"));
		StudentsManagement stumanage_one = studentsBusiness.selectBysid(sid);
		return new ModelAndView("student/students_register","stumanage_one",stumanage_one);
	}

	
	/**  
     *学员管理--修改学员信息
     * @param  StudentsManagement studentmanagement
     * @param  HttpSession session
     * @return 无 
     */ 
	@RequestMapping("editstu.do")
	public String editstuinfo(@ModelAttribute("student") Students student){
		stutemp = 3;
		System.out.println(student.getStatus());
		studentsBusiness.updatestuinfo(student);
		return "redirect:/student/management.do";
	}
	
	//跳转到添加页面
		@RequestMapping("editstudent.do")
		public String editstudent(HttpSession session,HttpServletRequest request){
			Students stumanage_one = studentsBusiness.selectstuBysid(Integer.parseInt(request.getParameter("sid")));
			session.setAttribute("stumanage_one", stumanage_one);
			session.setAttribute("stuinfo_one", studentsBusiness.getonecusinfo(stumanage_one.getCrid()));
			utilinfo(session);
			return "student/editstudent";
		}
	
	
	/**
	 * 新增学员到数据库
	 * @param stu
	 * @return
	 */
	@RequestMapping("addstu.do")
	public String addstu(@ModelAttribute("stu") Students stu){
		studentsBusiness.insertstudent(stu);//新增学员信息更改客户状态
		return "redirect:/student/management.do";
	}
	
	/**
	 * 这里是新增和修改学员信息的页面信息的一些集合
	 */
	public void utilinfo(HttpSession session){
		session.setAttribute("studire", paycodeBusiness.studydi());//可供选择的学习方向
		session.setAttribute("langusges", paycodeBusiness.language());//以前曾经学过的语言
		session.setAttribute("citys", paycodeBusiness.ecity());//意向就业城市
	}
	
	
	/**
	 * 学生住宿页面跳转
	 */
	@RequestMapping("occupancy.do")
	public String occupancy(HttpServletRequest request,HttpSession session){
		int crid = Integer.valueOf(request.getParameter("crid"));
		session.setAttribute("stuaccopay", studentsBusiness.stuaccopay(crid));
		session.setAttribute("accoadd", studentsBusiness.accoadd(0));
		return "student/accommodation";
	}
	
	/**
	 * 获得宿舍房间号
	 */
	@RequestMapping("getroomid.do")
	public @ResponseBody String getroomid(HttpServletRequest request){
		int belongid = Integer.valueOf(request.getParameter("belongid"));
		System.out.println(belongid);
		List<Space> roomlist = studentsBusiness.accoadd(belongid);
		JSONArray jsonArray = JSONArray.fromObject(roomlist);
		return jsonArray.toString();
	}
	
	/**
	 * 新增学生入住信息
	 */
	@RequestMapping("addstay.do")
	public String addstay(@ModelAttribute("stay") Stay stay ){
		if("".equals(stay.getStdate())){
			Format format = new SimpleDateFormat("yyyy-MM-dd");
			stay.setStdate(format.format(new Date()));
		}
		studentsBusiness.addstay(stay);
		return "redirect:/customer/manager.do";
	}
	
	/**
	 * 按名字查询学生信息(submit后)
	 */
	@RequestMapping("searchbyname.do")
	public @ResponseBody String searchbyname(HttpServletRequest request){
		return studentsBusiness.selectbynameinfo(request.getParameter("sname"));
	}
	
	/**
	 * 查询学生姓名(输入框查询)
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("search.do")
	public @ResponseBody String search(HttpServletRequest request) throws UnsupportedEncodingException{
		String str=new String(request.getParameter("sname").getBytes("ISO8859-1"),"utf-8");
		if (studentsBusiness.selectbyname(str).toString() == ""|| studentsBusiness.selectbyname(str).toString() == null) {
			return null;
		}
		return studentsBusiness.selectbyname(str).toString();
	}
	
	/**
	 * 批量删除学员
	 */
	@RequestMapping("batchdeletestu.do")
	public String batchdeletestu(HttpServletRequest request,HttpSession session){
		String str = request.getParameter("str").substring(0, request.getParameter("str").length()-1);
		System.out.println(str);
		studentsBusiness.deletestuinfo(str);//更改学员状态
		studentsBusiness.updateoutofinfo(str);//更改客户状态
		return "redirect:/student/management.do";
	}
	
	/**
	 * 查询所有住宿信息
	 */
	@RequestMapping("stayinfo.do")
	public String stayinfo(HttpServletRequest request){
		System.out.println(request.getParameter("str"));
		return "student/stayinfo";
	}
	
	
	/**
	 * 删除住宿信息
	 */
	@RequestMapping("deletestayinfo.do")
	public String deletestayinfo(HttpServletRequest request){
		String str = request.getParameter("str");
		studentsBusiness.deletestayinfo(str);
		//return "redirect:/student/batchdeletestu.do?str="+str+",";
		return null;
	}
	
	/**
	 * 学生考核信息
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="appraise.do", produces="text/plain;charset=UTF-8")
	public String appraise(HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException{
		/*int etcid = Integer.valueOf(request.getParameter("etcid"));
		session.setAttribute("stukaohe", studentsBusiness.stulist(etcid));*/
		String etcname = new String(request.getParameter("etcname").getBytes("ISO8859-1"),"utf-8");
		session.setAttribute("etcname", etcname+"#"+request.getParameter("etcid"));
		session.setAttribute("stukaohe", studentsBusiness.kaohe(request));
		return "student/appraise"; 
	}
	
	/**
	 * 学生考核成绩信息录入
	 */										   
	@RequestMapping(value="checkinappraise.do",produces="text/plain;charset=UTF-8")
	public @ResponseBody String checkinappraise(HttpServletRequest request){
		return studentsBusiness.checkinappraise(request);
	}
	
	/**
	 * 某班级学生考核成绩查询
	 */
	@RequestMapping("selectstuscore.do")
	public String selectstuscore(HttpServletRequest request,HttpSession session){
		List<Studentsinfo> list = studentsBusiness.selectscore(Integer.parseInt(request.getParameter("etcid")));
		session.setAttribute("stuscore", list);
		return "student/studentsscore";
	}
	
	/**
	 * 更改某学生某阶段的成绩
	 */
	@RequestMapping("updatestuscore.do")
	public String updatestuscore(@ModelAttribute("score") Score score){
		System.out.println(score.getSid());
		System.out.println(score.getStage());
		studentsBusiness.updatestuscore(score);
		return "redirect:/student/selectstuscore.do?etcid="+score.getEtcid();
	}
	
	/**
	 * 查询学生阶段考核成绩
	 */
	@RequestMapping("stagescore.do")
	public @ResponseBody String stagescore(){
		JSONArray jsonArray = JSONArray.fromObject(studentsBusiness.stagescore());
		System.out.println(jsonArray);
		return jsonArray.toString();
	}
	
	/*************************************************************************************************************/
	
	/**
	 * 学生入住情况
	 */
	@RequestMapping("stustay.do")
	public String stustay(){
		return "student/stustayinfo";
	} 
}
