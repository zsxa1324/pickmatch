package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.MemberByTeam;
import com.kh.pickmatch.model.vo.MemberRequest;
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

	
	
	
	//도원
	
	//팀게시판
	List<TeamBoard> selectList(int cPage, int numPerPage);
	int selectCount();
	Object selectTeamBoard(int boardNo);
	Object selectAttachment(int boardNo);
	
	//팀공지사항
	List<TeamNotice> selectListN(int cPage, int numPerPage, String teamName);
	int selectCountN(String teamName);
	Object selectNoticeView(int noticeNo);
	
	//팀 공지사항 글쓰기
	int InsertNotice(TeamNotice teamnotice);
	//팀 공지사항 글 삭제
	int deleteNocice(int noticeNo);
	//팀 공지사항 가져오기..
	TeamNotice selectOne(int noticeNo);
	
	//팀 공지사항 수정
	int updateNotice(String noticeTitle, String noticeContent, int noticeNo);
	
	//팀 수정
	int InsertTeam(Team team, String memberId);
	
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
	
	//내팀정보 보여주기
	List<Team> TeamView(String teamName);
	
	//내팀원 팀원수
	int memberCount(String teamName);
	
	//내팀원 명수
	List<MemberByTeam> TeamMember(String teamName);
	
	//내팀 팀가입 신청 현황
	List<MemberRequest> MemberRequest(String teamName);
	
	//팀가입 승인
	int teamOk(String memberId, String teamName);
	
	//팀가입 거절
	int teamNo(String memberId, String teamName);
	
	//팀가입 승인
	int teamJoin(String memberId, String teamName, String position);
	
	//팀가입시 가입신청테이블 확인
	MemberRequest memberRequestCk(String memberId, String teamName);
	
	
	
	
	
	

}
