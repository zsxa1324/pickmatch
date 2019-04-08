package com.kh.pickmatch.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.TeamBoard;
import com.kh.pickmatch.model.vo.TeamNotice;
import com.kh.pickmatch.model.vo.TeamOperationAccount;


@Repository
public class TeamDaoImpl implements TeamDao {

	private Logger logger = LoggerFactory.getLogger(TeamDaoImpl.class);
	
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
	public List<Map<String, Object>> selectMoneyHistoryList(String teamName) {
		return session.selectList("team.selectMoneyHistoryList", teamName);
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



	
	
	//도원
	
	


	@Override
	public List<TeamNotice> selectListN(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("team.selectListN", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public TeamNotice selectOne(int noticeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectOne", noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return session.delete("team.deleteNotice", noticeNo);
	}

	@Override
	public int selectCountN() {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectCountN");
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

	@Override
	public Object selectNoticeView(int noticeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectNoticeView", noticeNo);
	}

	//팀 공지사항 글쓰기
	@Override
	public int InsertNotice(TeamNotice teamnotice) {
		// TODO Auto-generated method stub
		
		//logger.debug("before teamnotice"+teamnotice);
		String teamname = session.selectOne("team.selectTeamOne",teamnotice.getMemberId());
		teamnotice.setTeamName(teamname);
		//logger.debug("after teamnotice"+teamnotice);
		return session.insert("team.insertNotice",teamnotice);
	}
	
	
	
	
	
	
	
	
}
