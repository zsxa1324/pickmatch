package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import com.kh.pickmatch.model.vo.StatusMember;

public interface AdminService {

	List<Map> memberList();
	int memberActive(String[] memberList);
	int memberUnActive(String[] memberList);
	List<Map> teamList();
	int teamUnaCTIVE(String[] teamList);
	int teamActive(String[] teamList);

}
