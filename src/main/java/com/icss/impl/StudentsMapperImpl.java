package com.icss.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
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
import com.icss.util.BasicSqlSupport;
import com.icss.util.PageBean;

public class StudentsMapperImpl extends BasicSqlSupport implements StudentsMapper{

	@Override
	public int deleteByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Students record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Students record) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.StudentsMapper.insertSelective",record);
	}

	@Override
	public Students selectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.StudentsMapper.selectByPrimaryKey",sid);
	}

	@Override
	public int updateByPrimaryKeySelective(Students record) {
		// TODO Auto-generated method stub
		System.out.println(record.getSid());
		return this.session.update("com.icss.dao.StudentsMapper.updateByPrimaryKeySelective",record);
	}

	@Override
	public int updateByPrimaryKey(Students record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Studentsinfo> getStuByClass(int etcid) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.StudentsMapper.getStuByClass",etcid);
	}

	@Override
	public StudentsManagement selectBysid(int sid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.StudentsMapper.selectBysid_manage",sid);
	}
	
	@Override 
	public ViewAllcustomerinfo customeroneinfo(int crid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.CustomerinfoMapper.customeroneinfo", crid);
	}

	@Override
	public int updatecustomerstatus(Customerinfo cus) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.CustomerinfoMapper.updateByPrimaryKeySelective", cus);
	}

	@Override
	public ViewSigpayinfo payacco(int crid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.ViewSigpayinfoMapper.payacco", crid);
	}

	@Override
	public List<Space> accoadd(int belongid) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.StudentsMapper.accoadd",belongid);
	}

	@Override
	public int addstay(Stay stay) {
		// TODO Auto-generated method stub
		return this.session.insert("com.icss.dao.StudentsMapper.addstay", stay);
	}

	@Override
	public String selectnamebyid(int crid) {
		// TODO Auto-generated method stub
		return this.session.selectOne("com.icss.dao.CustomerinfoMapper.selectnamebyid", crid);
	}

	@Override
	public List<String> selectBystupy(String namepinyin) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.StudentsMapper.selectBystupy",namepinyin);
	}

	@Override
	public List<String> selectBystucha(String namecha) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.StudentsMapper.selectBystucha",namecha);
	}

	@Override
	public List<Studentsinfo> selectstuinfoBypy(String name) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.StudentsMapper.selectstuinfoBypy",name);
	}

	@Override
	public List<Studentsinfo> selectstuinfoBycn(String name) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.StudentsMapper.selectstuinfoBycn",name);
	}

	@Override
	public PageBean<Studentsinfo> studentsinfo(int pagenum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pagenum, CustomerinfoMapperImpl.PAGESIZE);
		List<Studentsinfo> list = this.session.selectList("com.icss.dao.StudentsMapper.studentsinfo");
		return new PageBean<Studentsinfo>(list);
	}

	@Override
	public List<Etcclass> allowaddstuclass() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.EtcclassMapper.allowaddstuclass");
	}

	@Override
	public int deletestusinfo(List<String> list) {
		// TODO Auto-generated method stub 删除学员（更新）
		System.out.println(list);
		return this.session.update("com.icss.dao.StudentsMapper.deletestusinfo", list);
	}

	@Override
	public int deletestaysinfo(List<String> list) {
		// TODO Auto-generated method stub
		return this.session.delete("com.icss.dao.StudentsMapper.deletestaysinfo", list);
	}

	@Override
	public int variousupdatacus(List<String> list) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.CustomerinfoMapper.variousupdatacus", list);
	}

	@Override
	public List<Studentsinfo> kaohebyclass(int etcid) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.StudentsMapper.kaohebyclass", etcid);
	}

	@Override
	public int addcheckinfo(Score score) {
		// TODO Auto-generated method stub
		try{
			this.session.insert("com.icss.dao.StudentsMapper.addcheckinfo", score);
		}catch(Exception e){
			return 0;
		}
		return 1;
	}

	@Override
	public List<Studentsinfo> selectstuscore(int etcid) {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.StudentsMapper.selectstuscore", etcid);
	}

	@Override
	public int updatastuscore(Score score) {
		// TODO Auto-generated method stub
		return this.session.update("com.icss.dao.StudentsMapper.updatastuscore", score);
	}

	@Override
	public List<Studentsinfo> stagescore() {
		// TODO Auto-generated method stub
		return this.session.selectList("com.icss.dao.StudentsMapper.stagescore");
	}

}
