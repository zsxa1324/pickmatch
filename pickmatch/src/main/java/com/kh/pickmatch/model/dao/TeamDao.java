package com.kh.pickmatch.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.TeamOperationAccount;

public interface TeamDao {

	List<Map<String, String>> selectTMemberList(Map<String, String> map);
	String selectTeamOne(String memberId);
	TeamOperationAccount selectAccountOne(String teamName);
	List<Map<String, Object>> selectMoneyHistoryList(String teamName);
	int updateTeamAccount(TeamOperationAccount map);
	int insertTeamAccount(TeamOperationAccount toAccount);
	int insertMHistory(MoneyHistory mHistory);
	
}
