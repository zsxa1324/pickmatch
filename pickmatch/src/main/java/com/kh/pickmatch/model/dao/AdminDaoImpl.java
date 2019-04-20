package com.kh.pickmatch.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Map> memberList() {
		
	List<Map> list=session.selectList("admin.memberList");	
		
		return list;
	}

	@Override
	public int memberActive(String[] memberList) {
		Map map=new HashMap();
		map.put("mapList",memberList);
		
		int result=session.update("admin.memberActive",map);
		return result;
	}

	@Override
	public int memberUnActive(String[] memberList) {
		Map map=new HashMap();
		map.put("mapList",memberList);
		int result=session.update("admin.memberUnActive",map);
		return result;
	}

	@Override
	public List<Map> teamList() {
		List<Map> list=session.selectList("admin.teamList");
		return list;
	}

	@Override
	public int teamUnActive(String[] teamList) {
		Map map=new HashMap();
		map.put("mapList",teamList);
		int result=session.update("admin.teamUnActive",map);
		return result;
	}

	@Override
	public int teamActive(String[] teamList) {
		Map map=new HashMap();
		map.put("mapList",teamList);
		int result=session.update("admin.teamActive",map);
		return result;
	}
	
	
	
	
	
	
}
