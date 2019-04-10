package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.Mercenary;
import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.Team;
import com.kh.pickmatch.model.vo.TeamBoard;
import com.kh.pickmatch.model.vo.TeamNotice;
import com.kh.pickmatch.model.vo.TeamOperationAccount;

public interface TeamService {
	
	List<Map<String, String>> selectTMemberList(Map<String, String> map);
	String selectTeamOne(String memberId);
	TeamOperationAccount selectAccountOne(String teamName);
	List<Map<String, Object>> selectMoneyHistoryList(String teamName);
	int updateTeamAccount(TeamOperationAccount toAccount);
	int insertTeamAccount(TeamOperationAccount toAccount);
	int insertMHistory(MoneyHistory mHistory);
	List<Match> selectMatchList(String teamName, int cPage, int numPerPage);
	int selectMatchCount(String teamName);
	
	
	
	//도원
	
	//팀게시판
	List<TeamBoard> selectList(int cPage, int numPerPage);
	int selectCount();
	Object selectTeamBoard(int boardNo);
	Object selectAttachment(int boardNo);
	
	//팀공지사항
	List<TeamNotice> selectListN(int cPage, int numPerPage);
	int selectCountN();
	Object selectNoticeView(int noticeNo);
	
	//팀 공지사항 글쓰기
	int InsertNotice(TeamNotice teamnotice);
	//팀 공지사항 글 삭제
	int deleteNocice(int noticeNo);
	//팀 공지사항 가져오기..
	TeamNotice selectOne(int noticeNo);
	
	//팀 공지사항 수정
	int updateNotice(String noticeTitle, String noticeContent, int noticeNo);
	int InsertTeam(Team team);
	
	//팀 생성 팀명 중복검사
	Team selectTeamCheck(String teamname);
	
	//팀랭킹 
	List<Team> selectTeamRanking(int cPage, int numPerPage);
	int selectCountT();
	//팀랭킹 검색
	Team TeamSearch(String search);
	
	
	//용병랭킹
	List<Mercenary> mercenaryranking(int cPage, int numPerPage);
	int selectCountM();
	//용병랭킹검색
	Mercenary MercenarySearch(String search);
	
	
	
	
	
	

}
