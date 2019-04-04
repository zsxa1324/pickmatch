package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pickmatch.model.dao.TeamDao;
import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.TeamOperationAccount;

@Service
public class TeamServiceImpl implements TeamService {

	@Autowired
	private TeamDao dao;
	
	@Override
	public List<Map<String, String>> selectTMemberList(Map<String, String> map) {
		return dao.selectTMemberList(map);
	}

	@Override
	public String selectTeamOne(String memberId) {
		return dao.selectTeamOne(memberId);
	}

	@Override
	public TeamOperationAccount selectAccountOne(String teamName) {
		return dao.selectAccountOne(teamName);
	}

	@Override
	public List<Map<String, Object>> selectMoneyHistoryList(String teamName) {
		return dao.selectMoneyHistoryList(teamName);
	}

	@Override
	public int updateTeamAccount(TeamOperationAccount toAccount) {
		return dao.updateTeamAccount(toAccount);
	}

	@Override
	public int insertTeamAccount(TeamOperationAccount toAccount) {
		return dao.insertTeamAccount(toAccount);
	}

	@Override
	public int insertMHistory(MoneyHistory mHistory) {
		return dao.insertMHistory(mHistory);
	}

	
	
	
}
