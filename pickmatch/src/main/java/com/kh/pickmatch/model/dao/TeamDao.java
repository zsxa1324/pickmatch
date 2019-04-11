package com.kh.pickmatch.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.pickmatch.model.vo.MemberByTeam;
import com.kh.pickmatch.model.vo.Mercenary;
import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.Team;
import com.kh.pickmatch.model.vo.TeamBoard;
import com.kh.pickmatch.model.vo.TeamNotice;
import com.kh.pickmatch.model.vo.TeamOperationAccount;

public interface TeamDao {

	List<Map<String, String>> selectTMemberList(Map<String, String> map);
	String selectTeamOne(String memberId);
	TeamOperationAccount selectAccountOne(String teamName);
	List<Map<String, Object>> selectMoneyHistoryList(String teamName);
	int updateTeamAccount(TeamOperationAccount map);
	int insertTeamAccount(TeamOperationAccount toAccount);
	int insertMHistory(MoneyHistory mHistory);
	
	
	
	//도원
	int selectCount();
	List<TeamBoard> selectList(int cPage, int numPerPage);
	Object selectTeamBoard(int boardNo);
	Object selectAttachment(int boardNo);
	List<TeamNotice> selectListN(int cPage, int numPerPage, String teamName);
	int selectCountN(String teamName);
	Object selectNoticeView(int noticeNo);
	
	//팀 공지사항 글쓰기
	int InsertNotice(TeamNotice teamnotice);
	//팀 공지사항 글삭제
	int deleteNotice(int noticeNo);
	//팀 공지사항 수정
	TeamNotice selectOne(int noticeNo);
	//팀 공지사항 수정
	int updateNotice(String noticeTitle, String noticeContent, int noticeNo);
	
	//팀생성
	int insertTeam(Team team);
	
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
	//용병랭킹 검색
	Mercenary MercenarySearch(String search);
	
	//내팀정보 보여주기
	List<Team> TeamView(String teamName);
	
	//팀생성시 팀장되게함
	int memberByTeam(MemberByTeam mbt);
	
	//내팀 팀원수
	int memberCount(String teamName);
	
	
	List<MemberByTeam> TeamMember(String teamName);
	
	
	
	
	
	
	
}
