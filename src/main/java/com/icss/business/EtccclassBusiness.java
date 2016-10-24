package com.icss.business;

import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.icss.bean.Etcclass;
import com.icss.bean.Studentsinfo;
import com.icss.dao.EtcclassMapper;

public class EtccclassBusiness {
	
	private EtcclassMapper etcclassDao;

	public EtcclassMapper getEtcclassDao() {
		return etcclassDao;
	}

	public void setEtcclassDao(EtcclassMapper etcclassDao) {
		this.etcclassDao = etcclassDao;
	}
	
	//获得所有班级信息
	public List<Etcclass> getallclass(){
		return etcclassDao.allclassinfo();
	}
	
	//根据班级编号获得班级名称
	public String oneclassname(int etcid){
		return etcclassDao.selectByPrimaryKey(etcid).getEtcname();
	}
	
	//根据班级编号获得班级信息
	public Etcclass oneclassinfo(int etcid){
		return etcclassDao.selectByPrimaryKey(etcid);
	}

	//根据班级编号获得该班级人数
	public List<Studentsinfo> classstudent(int etcid){
		return etcclassDao.getStuByClass(etcid);
	}
	
	//根据班级名称和班级人数获得新学员学号
	public String newstuid(int etcid){
		String classname = oneclassname(etcid);
		int id = classstudent(etcid).size()+1;
		StringBuffer sb = new StringBuffer();
        String regex = "-(.*)-";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(classname);//匹配类
        if (matcher.find()) {
        	if(id<10){
    			sb.append(matcher.group(1));
    			sb.append("0");
    			sb.append(id);
    		}else{
    			sb.append(matcher.group(1));
    			sb.append(id);
    		}
        }
		return sb.toString();
	}

	//新增班级
	public int addclasa(Etcclass etcclass){
		etcclass = getdata(etcclass);
		return etcclassDao.insertSelective(etcclass);
	}
	
	//修改班级
	public int updateclass(Etcclass etcclass){
		etcclass = getdata(etcclass);
		return etcclassDao.updateByPrimaryKeySelective(etcclass);
	}
	
	//判断日期
	public static Etcclass getdata(Etcclass etcclass){
		if("".equals(etcclass.getStartdate()) || etcclass.getStartdate()==null){
			Format format = new SimpleDateFormat("yyyy-MM-dd");
			etcclass.setStartdate(format.format(new Date()));
		}
		if("".equals(etcclass.getEnddate()) || etcclass.getEnddate()==null){
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar ca = Calendar.getInstance();//得到一个Calendar的实例 
			try {
				ca.setTime(sf.parse(etcclass.getStartdate()));
			} catch (ParseException e) {
				ca.setTime(new Date());
			}
			ca.add(Calendar.MONTH, 4); //月份减1 
			Date lastMonth = ca.getTime(); //结果 
			etcclass.setEnddate(sf.format(lastMonth));
		}
		return etcclass;
	}
}
