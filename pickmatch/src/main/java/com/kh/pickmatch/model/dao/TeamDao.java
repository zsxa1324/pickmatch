package com.kh.pickmatch.model.dao;

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
import com.kh.pickmatch.model.vo.TeamBoardComment;
import com.kh.pickmatch.model.vo.TeamNotice;
import com.kh.pickmatch.model.vo.TeamOperationAccount;

public interface TeamDao {

	List<Map<String, String>> selectTMemberList(Map<String, String> map);
	String selectTeamOne(String memberId);
	TeamOperationAccount selectAccountOne(String teamName);
	List<Map<String, Object>> selectMoneyHistoryList(Map<String, String> map);
	int updateTeamAccount(TeamOperationAccount map);
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
	String selectTeamEmblemOne(String teamName);
	int updateTeamInfo(Team team);
	int selectMercenaryCount(String memberId, String teamName);
	List<Map<String, Object>> selectMemberReuestList(String teamName);
	List<Map<String, Object>> selectMercenaryManagementList(String teamName);
	int insertMercenary(String memberId, String teamName);
	int deleteTeamMercenary(Map<String, String> map);
	List<Map<String, Object>> selectMyTeamMercenaryList(String memberId);
	
	
	
	
	
	
	//도원
	
	
	
	
	
	
	
	int selectCount();
	List<TeamBoard> selectList(int cPage, int numPerPage, String teamName);
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
	List<Team> TeamSearch(String search);
	
	//용병랭킹
	List<Mercenary> mercenaryranking(int cPage, int numPerPage);
	int selectCountM();
	
	//용병랭킹 검색
	List<Mercenary> MercenarySearch(String search);
	
	//내팀정보 보여주기
	List<Team> TeamView(String teamName);
	
	//팀생성시 팀장되게함
	int memberByTeam(MemberByTeam mbt);
	
	//내팀 팀원수
	int memberCount(String teamName);
	
	
	List<MemberByTeam> TeamMember(String teamName);
	
	//내팀 팀가입 신청현황
	List<MemberRequest> MemberRequest(String teamName);
	
	//팀가입 승인
	int teamOk(String memberId, String teamName);
	
	//팀가입 거절
	int teamNo(String memberId, String teamName, String type);
	
	//팀가입 승인
	int teamJoin(String memberId, String teamName, String position);
	
	//팀가입신청시 멤버리퀘스트테이블 비교
	MemberRequest memberRequestCk(String memberId, String teamName, String type);
	
	
	//팀게시판 글쓰기
	int insertFreeBoard(TeamBoard fb);
	int insertFreeAttachment(TeamBoardAttachment a);
	
	//팀게시판 수정
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
	int teamleader(String memberId);
	//팀장체크;;
	String leadercheck(String teamName);
	//팀장 체인지
	int leaderchange(String beforeleader);
	String authority(String memberId);
	//팀탈퇴
	int teamleave(String memberId);
	//팀해체
	int teambreakup(String teamName);
	
	//팀게시판 댓글리스트
	List<TeamBoardComment> tbcView(int boardNo);
	//팀게시판 댓글작성
	int insertTeamBoardComment(int boardNoRef, String memberId, int commentNoRef, String commentContent);
	//팀게시판 댓글 삭제
	int deleteComment(int commentNo);
	
	
	
	
	
	
	
	
}
