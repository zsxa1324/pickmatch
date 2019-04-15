package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.MatchGoalResult;
import com.kh.pickmatch.model.vo.MemberByTeam;
import com.kh.pickmatch.model.vo.MemberRequest;
import com.kh.pickmatch.model.vo.Mercenary;
import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.Score;
import com.kh.pickmatch.model.vo.Team;
import com.kh.pickmatch.model.vo.TeamBoard;
import com.kh.pickmatch.model.vo.TeamBoardAttachment;
import com.kh.pickmatch.model.vo.TeamNotice;
import com.kh.pickmatch.model.vo.TeamOperationAccount;

public interface TeamService {
	
	List<Map<String, String>> selectTMemberList(Map<String, String> map);
	String selectTeamOne(String memberId);
	TeamOperationAccount selectAccountOne(String teamName);
	List<Map<String, Object>> selectMoneyHistoryList(Map<String, String> map);
	int updateTeamAccount(TeamOperationAccount toAccount);
	int insertTeamAccount(TeamOperationAccount toAccount);
	int insertMHistory(MoneyHistory mHistory);
	List<Match> selectMatchList(String teamName, int cPage, int numPerPage);
	int selectMatchCount(String teamName);
	Match selectOneMatch(int matchNo);
	Team selectOneHomeTeam(String teamHome);
	Team selectOneAwayTeam(String teamAway);
	int insertMatchGoalResult(MatchGoalResult mgr);
	int updateScore(Score s);
	int updateTeamRating(Map<String, Object> map);
	int updateMatchScore(Map<String, Integer> matchScoreMap);
	int insertMatchResultDetail(Map<String, Object> matchResultDetailMap);
	List<Map<String, Object>> selectMatchGoalResultList(int matchNo);
	String selectMatchResultDetail(int matchNo);
	List<Map<String, String>> selectMercenaryList(Map<String, String> map);
	String selectTeamAuthorityOne(String memberId);

	
	
	
	//도원
	
	//팀게시판
	List<TeamBoard> selectList(int cPage, int numPerPage, String teamName);
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
	List<Team> TeamSearch(String search);
	
	
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
	
	//팀게시판 글쓰기
	int insertFreeBoard(TeamBoard fb, List<TeamBoardAttachment> list);
	
	//팀게시판 글 수정
	int updateTeamBoard(String boardTitle, String boardContent, int boardNo);
	
	//팀게시판 글 삭제
	int deleteTeamBoard(int boardNo);
	
	//팀 추방
	int teambye(String memberId);
	
	//매니저를 팀원으로 등급조절
	int leveldown(String memberId);
	
	//팀원을 매니저로 등급조절
	int levelup(String memberId);
	
	//팀장위임
	int teamleader(String memberId, String teamName);
	String authority(String memberId);
	
	//팀탈퇴
	int teamleave(String memberId);
	
	//팀 해체
	int teambreakup(String teamName);


	
	
	
	
	
	

}
