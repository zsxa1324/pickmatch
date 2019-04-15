package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pickmatch.common.exception.BoardException;
import com.kh.pickmatch.model.dao.TeamDao;
import com.kh.pickmatch.model.vo.MemberByTeam;
import com.kh.pickmatch.model.vo.MemberRequest;
import com.kh.pickmatch.model.vo.Mercenary;
import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.Team;
import com.kh.pickmatch.model.vo.TeamBoard;
import com.kh.pickmatch.model.vo.TeamBoardAttachment;
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

	
	
	
	
	//도원
	
	
	



	@Override
	public List<TeamNotice> selectListN(int cPage, int numPerPage, String teamName) {
		// TODO Auto-generated method stub
		return dao.selectListN(cPage, numPerPage, teamName);
	}

	@Override
	public int teambreakup(String teamName) {
		// TODO Auto-generated method stub
		return dao.teambreakup(teamName);
	}

	@Override
	public int teamleave(String memberId) {
		// TODO Auto-generated method stub
		return dao.teamleave(memberId);
	}

	@Override
	public String authority(String memberId) {
		// TODO Auto-generated method stub
		return dao.authority(memberId);
	}

	@Override
	public int teamleader(String memberId, String teamName) {
		// TODO Auto-generated method stub
		
		String beforeleader = dao.leadercheck(teamName);
		
		int result = dao.teamleader(memberId);
		int finalresult = 0;
		
		if(result > 0) {
			finalresult = dao.leaderchange(beforeleader);
		}
		return finalresult;
	}

	@Override
	public int levelup(String memberId) {
		// TODO Auto-generated method stub
		return dao.levelup(memberId);
	}

	@Override
	public int leveldown(String memberId) {
		// TODO Auto-generated method stub
		return dao.leveldown(memberId);
	}

	@Override
	public int teambye(String memberId) {
		// TODO Auto-generated method stub
		return dao.teambye(memberId);
	}

	@Override
	public int deleteTeamBoard(int boardNo) {
		// TODO Auto-generated method stub
		return dao.deleteTeamBoard(boardNo);
	}

	@Override
	public int updateTeamBoard(String boardTitle, String boardContent, int boardNo) {
		// TODO Auto-generated method stub
		return dao.updateTeamBoard(boardTitle, boardContent, boardNo);
	}

	@Override
	public int insertFreeBoard(TeamBoard fb, List<TeamBoardAttachment> list) {
		int result = 0;
		result = dao.insertFreeBoard(fb);
		if(result == 0 ) throw new BoardException();
		if(list.size() > 0 )
		{
			for(TeamBoardAttachment a : list)
			{
				a.setBoardNoRef(fb.getBoardNo());
				System.out.println(a);
				result = dao.insertFreeAttachment(a);
				if(result == 0) throw new BoardException();
			}
		}
		return result;
	}

	@Override
	public MemberRequest memberRequestCk(String memberId, String teamName) {
		// TODO Auto-generated method stub
		return dao.memberRequestCk(memberId, teamName);
	}

	@Override
	public int teamJoin(String memberId, String teamName,String position) {
		// TODO Auto-generated method stub
		return dao.teamJoin(memberId, teamName, position);
	}

	@Override
	public int teamNo(String memberId, String teamName) {
		// TODO Auto-generated method stub
		return dao.teamNo(memberId, teamName);
	}

	@Override
	public int teamOk(String memberId, String teamName) {
		// TODO Auto-generated method stub
		return dao.teamOk(memberId, teamName);
	}

	@Override
	public List<MemberRequest> MemberRequest(String teamName) {
		// TODO Auto-generated method stub
		return dao.MemberRequest(teamName);
	}

	@Override
	public List<MemberByTeam>TeamMember(String teamName) {
		// TODO Auto-generated method stub
		return dao.TeamMember(teamName);
	}

	@Override
	public int memberCount(String teamName) {
		// TODO Auto-generated method stub
		return dao.memberCount(teamName);
	}

	@Override
	public List<Team> TeamView(String teamName) {
		// TODO Auto-generated method stub
		return dao.TeamView(teamName);
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
	public int InsertTeam(Team team, String memberId) {
		// TODO Auto-generated method stub
		int result = dao.insertTeam(team);
		int result2 = 0;
		MemberByTeam mbt = new MemberByTeam();
		
		mbt.setTeamName(team.getTeamName());
		mbt.setMemberId(memberId);
		mbt.setAuthority("팀장");
		
		
		if(result>0) {
			result2 = dao.memberByTeam(mbt);
		}
		
		
		return result2;
		
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
	public int selectCountN(String teamName) {
		// TODO Auto-generated method stub
		return dao.selectCountN(teamName);
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
