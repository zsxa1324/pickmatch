package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pickmatch.model.dao.TeamDao;
import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.Mercenary;
import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.Team;
import com.kh.pickmatch.model.vo.TeamBoard;
import com.kh.pickmatch.model.vo.TeamNotice;
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

		@Override
	public List<Match> selectMatchList(String teamName, int cPage, int numPerPage) {
		return dao.selectMatchList(teamName, cPage, numPerPage);
	}
	
	@Override
	public int selectMatchCount(String teamName) {
		return dao.selectMatchCount(teamName);
	}
	
	
	
	
	//도원
	
	
	



	@Override
	public List<TeamNotice> selectListN(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectListN(cPage, numPerPage);
	}

	@Override
	public Team TeamSearch(String search) {
		// TODO Auto-generated method stub
		return dao.TeamSearch(search);
	}

	@Override
	public Mercenary MercenarySearch(String search) {
		// TODO Auto-generated method stub
		return dao.MercenarySearch(search);
	}

	@Override
	public List<Mercenary> mercenaryranking(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.mercenaryranking(cPage, numPerPage);
	}

	@Override
	public int selectCountM() {
		// TODO Auto-generated method stub
		return dao.selectCountM();
	}

	@Override
	public int selectCountT() {
		// TODO Auto-generated method stub
		return dao.selectCountT();
	}

	@Override
	public List<Team> selectTeamRanking(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectTeamRanking(cPage, numPerPage);
	}


	@Override
	public Team selectTeamCheck(String teamname) {
		// TODO Auto-generated method stub
		return dao.selectTeamCheck(teamname);
	}

	@Override
	public int InsertTeam(Team team) {
		// TODO Auto-generated method stub
		return dao.insertTeam(team);
	}

	@Override
	public TeamNotice selectOne(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.selectOne(noticeNo);
	}

	@Override
	public int deleteNocice(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.deleteNotice(noticeNo);
	}

	@Override
	public Object selectNoticeView(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.selectNoticeView(noticeNo);
	}

	@Override
	public int selectCountN() {
		// TODO Auto-generated method stub
		return dao.selectCountN();
	}

	@Override
	public Object selectAttachment(int boardNo) {
		// TODO Auto-generated method stub
		return dao.selectAttachment(boardNo);
	}
	
	@Override
	public Object selectTeamBoard(int boardNo) {
		// TODO Auto-generated method stub
		return dao.selectTeamBoard(boardNo);
	}

	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return dao.selectCount();
	}
	
	@Override
	public List<TeamBoard> selectList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectList(cPage, numPerPage);
	}

	
	//팀 공지사항 글쓰기
	@Override
	public int InsertNotice(TeamNotice teamnotice) {
		// TODO Auto-generated method stub
		return dao.InsertNotice(teamnotice);
	}

	//팀 공지사항 수정
	@Override
	public int updateNotice(String noticeTitle, String noticeContent, int noticeNo) {
		// TODO Auto-generated method stub
		return dao.updateNotice(noticeTitle, noticeContent, noticeNo);
	}
	
	
	
}
