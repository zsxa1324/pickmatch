package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pickmatch.model.dao.AdminDao;

@Service
public class AdminServiceImpl implements AdminService {
	
@Autowired 
private AdminDao dao;

@Override
public List<Map> memberList() {
	List<Map> list=dao.memberList();
	
	return list;
}



}
