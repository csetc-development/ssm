package com.icss.business;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

import com.icss.bean.Customerinfo;
import com.icss.bean.Etcclass;
import com.icss.bean.Score;
import com.icss.bean.Space;
import com.icss.bean.Stay;
import com.icss.bean.Students;
import com.icss.bean.StudentsManagement;
import com.icss.bean.Studentsinfo;
import com.icss.bean.ViewAllcustomerinfo;
import com.icss.bean.ViewSigpayinfo;
import com.icss.dao.StudentsMapper;
import com.icss.util.PageBean;
import com.icss.util.PinyinTool;

public class StudentsBusiness {
	
	private StudentsMapper studentsDao;

	public StudentsMapper getStudentsDao() {
		return studentsDao;
	}

	public void setStudentsDao(StudentsMapper studentsDao) {
		this.studentsDao = studentsDao;
	}
	
	/**
	 * 查询所有学员信息
	 */
	public PageBean<Studentsinfo> studentsinfo(int pagenum){
		return  studentsDao.studentsinfo(pagenum);
	}
	

	/**
	 * 为班级新增单个学生
	 * @param stu
	 * @return
	 */
	public int insertstudent(Students stu){
		Customerinfo c = new Customerinfo();
		c.setCrid(stu.getCrid());
		c.setCronline(4);
		studentsDao.updatecustomerstatus(c);
		try {
			//将姓名中文转成拼音
			stu.setSphonetic(new PinyinTool().toPinYin(studentsDao.selectnamebyid(Integer.valueOf(stu.getSphonetic())), ""));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadHanyuPinyinOutputFormatCombination e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(stu.getEtcid());
		//是否填写日期
		if("".equals(stu.getSdate())){
			Format format = new SimpleDateFormat("yyyy-MM-dd");
			stu.setSdate(format.format(new Date()));
		}
		return studentsDao.insertSelective(stu);
	}
	
	/**
	 * 根据班级编查询学生信息
	 * @return
	 */
	public List<Studentsinfo> stulist(int etcid){
		return studentsDao.getStuByClass(etcid);
	}
	
	
	public ViewAllcustomerinfo getonecusinfo(int crid){
		return studentsDao.customeroneinfo(crid);
	}
	/**  
     *学员管理--根据学号显示一个学员（多表联合查询）
     * @param  int sid
     * @param  无
     * @return StudentsManagement
     */ 
	public StudentsManagement selectBysid(int sid){
		return studentsDao.selectBysid(sid);
	}	
	
	/**  
     *学员管理--根据学号显示一个学员（学生表）
     * @param  int sid
     * @param  无
     * @return Students
     */ 
	public Students selectstuBysid(int sid){
		return studentsDao.selectByPrimaryKey(sid);
	}
	
	/**  
     *学员管理--根据学号更新某个学员
     * @param  Students student
     * @param  int sid
     * @return 无
     */ 
	public int updatestuinfo(Students student) {
		System.out.println(student.getStatus());
		return studentsDao.updateByPrimaryKeySelective(student);
	}
	
	
	/**
	 * 查看学生交的住宿费
	 */
	public ViewSigpayinfo stuaccopay(int crid){
		return studentsDao.payacco(crid);
	}

	/**
	 * 查看住宿地区
	 */
	public List<Space> accoadd(int belongid){
		return studentsDao.accoadd(belongid);
		
	}
	
	/**
	 * 新增住宿信息
	 */
	public int addstay(Stay stay){
		return studentsDao.addstay(stay);
	}
	
	public String selectbynameinfo(String sname){
		List<Studentsinfo> list;
		if(sname.matches("^[a-zA-Z]*")){
			System.out.println("输入的全是英文");
			list = studentsDao.selectstuinfoBypy(sname);
		}else{
			System.out.println("输入的不全是英文");
			list = studentsDao.selectstuinfoBycn(sname.replaceAll("[^0-9\\u4e00-\\u9fa5]", ""));
		}
		
		return JSONArray.fromObject(list).toString();
	}
	
	/**
	 * 根据输入框中的内容查询学生姓名
	 * @param sname
	 * @return
	 */
	public String selectbyname(String sname){
		JSONArray jsonArray; 
		if(sname.matches("^[a-zA-Z]*")){
			jsonArray = JSONArray.fromObject(studentsDao.selectBystupy(sname));
		}else{
			jsonArray = JSONArray.fromObject(studentsDao.selectBystucha(sname.replaceAll("[^0-9\\u4e00-\\u9fa5]", "")));
		}
		if(jsonArray.isEmpty()){
			return null;
		}
		return jsonArray.toString();
	}
	
	
	/**
	 * 批量删除学员信息
	 * @return
	 */
	public int deletestuinfo(String str){
        return studentsDao.deletestusinfo(strToStrlist(str));
	}
	
	/**
	 * 修改客户为已退学信息
	 * @return
	 */
	public int updateoutofinfo(String str){
		return studentsDao.variousupdatacus(strToStrlist(str));
	}
	
	/**
	 * 批量删除学生入住信息
	 * @return
	 */
	public int deletestayinfo(String str){
        try{
        	return studentsDao.deletestaysinfo(strToStrlist(str));
        }catch(Exception e){
        	return 0;
        }
	}
	
	
	/**
	 * 班级学生考核（信息查询）
	 */
	public List<Studentsinfo> kaohe(HttpServletRequest request){
		int etcid = Integer.valueOf(request.getParameter("etcid"));
		return studentsDao.kaohebyclass(etcid);
	}
	
	/**
	 * 考核信息录入
	 */
	public String checkinappraise(HttpServletRequest request){
		String str = request.getParameter("jsondata");
		String strarray[] = str.split(",");
		/*System.out.println(strarray[0].substring(0, strarray[0].indexOf(":")));
		System.out.println(strarray[0].substring(strarray[0].indexOf(":")+1,strarray[0].length()));*/
		for(int i=0;i<strarray.length;i++){
			int flag = studentsDao.addcheckinfo(
					new Score(
							strarray[i].substring(0, strarray[i].indexOf(":")), 
							request.getParameter("stage"), 
							Integer.valueOf(request.getParameter("etcid")),
							strarray[i].substring(strarray[i].indexOf(":")+1,strarray[i].length()), request.getParameter("appraisedate")
							)
					);
			System.out.println(flag);
			if(flag==0){
				return "11";
			}
		}
		return "";
	}
	
	/**
	 * 考核成绩查询
	 */
	public List<Studentsinfo> selectscore(int etcid){
		return studentsDao.selectstuscore(etcid);
	}
	
	
	/**
	 * 考核成绩更改
	 */
	public int updatestuscore(Score score){
		return studentsDao.updatastuscore(score);
	}
	
	/**
	 * 阶段考核成绩
	 */
	public List<Studentsinfo> stagescore(){
		return studentsDao.stagescore();
	}
	
	/**
	 * 将字符串转成list<String>
	 * @return
	 */
	public List<String> strToStrlist(String str){
		String [] strArrays = str.trim().split(",");
        List<String> list  = Arrays.asList(strArrays);
        return list;
	}
	
	
	public List<Etcclass> allowaddstuclass(){
		return studentsDao.allowaddstuclass();
	}

}
