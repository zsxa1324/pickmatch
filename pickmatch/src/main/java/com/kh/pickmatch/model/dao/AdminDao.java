package com.kh.pickmatch.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.pickmatch.model.vo.StatusMember;

public interface AdminDao {

	List<Map> memberList();
	int memberActive(String[] memberList);
	int memberUnActive(String[] memberList);
	List<Map> teamList();
	int teamUnActive(String[] teamList);
	int teamActive(String[] teamList);

}
