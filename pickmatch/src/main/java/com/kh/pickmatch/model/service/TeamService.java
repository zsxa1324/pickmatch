package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import com.kh.pickmatch.model.vo.MoneyHistory;
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
	List<TeamNotice> selectListN(int cPage, int numPerPage);
	int selectCountN();
	Object selectNoticeView(int noticeNo);
	
	//팀 공지사항 글쓰기
	int InsertNotice(TeamNotice teamnotice);
	//팀 공지사항 글 삭제
	int deleteNocice(int noticeNo);
	//팀 공지사항 가져오기..
	TeamNotice selectOne(int noticeNo);

}
