package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pickmatch.model.dao.AdminDao;
import com.kh.pickmatch.model.vo.StatusMember;

@Service
public class AdminServiceImpl implements AdminService {
	
@Autowired 
private AdminDao dao;

@Override
public List<Map> memberList() {
	List<Map> list=dao.memberList();
	
	return list;
}

@Override
public int memberActive(String[] memberList) {
	int result=dao.memberActive(memberList);
	return result;
}

@Override
public int memberUnActive(String[] memberList) {
	int result=dao.memberUnActive(memberList);
	return result;
}

@Override
public List<Map> teamList() {
	List<Map> list=dao.teamList();
	return list;
}

@Override
public int teamUnaCTIVE(String[] teamList) {
	int result=dao.teamUnActive(teamList);
	return result;
}

@Override
public int teamActive(String[] teamList) {
	int result=dao.teamActive(teamList);
	return result;
}








}
