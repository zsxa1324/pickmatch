package com.kh.pickmatch.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.MatchGoalResult;
import com.kh.pickmatch.model.vo.Mercenary;
import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.Score;
import com.kh.pickmatch.model.vo.Team;
import com.kh.pickmatch.model.vo.TeamBoard;
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
	
	
	
	
	//도원
	int selectCount();
	List<TeamBoard> selectList(int cPage, int numPerPage);
	Object selectTeamBoard(int boardNo);
	Object selectAttachment(int boardNo);
	List<TeamNotice> selectListN(int cPage, int numPerPage);
	int selectCountN();
	Object selectNoticeView(int noticeNo);
	
	//팀 공지사항 글쓰기
	int InsertNotice(TeamNotice teamnotice);
	//팀 공지사항 글삭제
	int deleteNotice(int noticeNo);
	//팀 공지사항 수정
	TeamNotice selectOne(int noticeNo);
	//팀 공지사항 수정
	int updateNotice(String noticeTitle, String noticeContent, int noticeNo);
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
	
	
}
