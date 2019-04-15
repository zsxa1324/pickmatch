package com.kh.pickmatch.model.dao;

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
	
	
	
}
