package com.kh.pickmatch.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.TeamBoard;
import com.kh.pickmatch.model.vo.TeamOperationAccount;

@Repository
public class TeamDaoImpl implements TeamDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> selectTMemberList(Map<String, String> map) {
		return session.selectList("team.selectTMemberList", map);
	}

	@Override
	public String selectTeamOne(String memberId) {
		return session.selectOne("team.selectTeamOne", memberId);
	}

	@Override
	public TeamOperationAccount selectAccountOne(String teamName) {
		return session.selectOne("team.selectAccountOne", teamName);
	}

	@Override
	public List<Map<String, Object>> selectMoneyHistoryList(Map<String, String> map) {
		return session.selectList("team.selectMoneyHistoryList", map);
	}

	@Override
	public int updateTeamAccount(TeamOperationAccount toAccount) {
		return session.update("team.updateTeamAccount", toAccount);
	}

	@Override
	public int insertTeamAccount(TeamOperationAccount toAccount) {
		return session.insert("team.insertTeamAccount", toAccount);
	}

	@Override
	public int insertMHistory(MoneyHistory mHistory) {
		return session.insert("team.insertMHistory", mHistory);
	}

	@Override
	public List<Match> selectMatchList(String teamName, int cPage, int numPerPgae) {
		return session.selectList("team.selectMatchList", teamName, new RowBounds((cPage-1) * numPerPgae, numPerPgae));
	}
	
	@Override
	public int selectMatchCount(String teamName) {
		return session.selectOne("team.selectMatchCount", teamName);
	}
	
	
	
	

	
	
	
	
	
	


	@Override
	public Object selectTeamBoard(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectteamBoard", boardNo);
	}

	@Override
	public Object selectAttachment(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectList("team.selectAttachment", boardNo);
	}

	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectCount");
	}
	
	@Override
	public List<TeamBoard> selectList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub;
		return session.selectList("team.selectList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}
	
	
	
	
	
	
	
	
}
