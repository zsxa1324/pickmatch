package com.kh.pickmatch.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.MatchGoalResult;
import com.kh.pickmatch.model.vo.Mercenary;
import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.Score;
import com.kh.pickmatch.model.vo.Team;
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
	public int insertMatchGoalResult(MatchGoalResult mgr) {
		return session.insert("team.insertMatchGoalResult", mgr);

	}

	@Override
	public Match selectOneMatch(int matchNo) {
		return session.selectOne("team.selectOneMatch", matchNo);
	}
	
	@Override
	public Team selectOneHomeTeam(String teamHome) {
		return session.selectOne("team.selectOneHomeTeam", teamHome);
	}

	@Override
	public Team selectOneAwayTeam(String teamAway) {
		return session.selectOne("team.selectOneAwayTeam", teamAway);
	}

	@Override
	public int updateScore(Score s) {
		return session.update("team.updateScore", s);
	}
	
	@Override
	public int updateTeamRating(Map<String, Object> map) {
		return session.update("team.updateTeamRating", map);
	}
	
	@Override
	public int updateMatchScore(Map<String, Integer> matchScoreMap) {
		return session.update("team.updateMatchScore", matchScoreMap);
	}

	@Override
	public int insertMatchResultDetail(Map<String, Object> matchResultDetailMap) {
		return session.insert("team.insertMatchResultDetail", matchResultDetailMap);
	}
	
	@Override
	public List<Map<String, Object>> selectMatchGoalResultList(int matchNo) {
		return session.selectList("team.selectMatchGoalResultList", matchNo);
	}
	
	@Override
	public String selectMatchResultDetail(int matchNo) {
		return session.selectOne("team.selectMatchResultDetail", matchNo);
	}
	
	@Override
	public List<Map<String, String>> selectMercenaryList(Map<String, String> map) {
		return session.selectList("team.selectMercenaryList",map);
	}

	@Override
	public String selectTeamAuthorityOne(String memberId) {
		return session.selectOne("team.selectTeamAuthorityOne", memberId);
	}
	
	
	
	
	
	
	//도원
	
	











	@Override
	public List<TeamNotice> selectListN(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("team.selectListN", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}


	@Override
	public Team TeamSearch(String search) {
		// TODO Auto-generated method stub
		return session.selectOne("team.TeamSearch",search);
	}

	@Override
	public Mercenary MercenarySearch(String search) {
		// TODO Auto-generated method stub
		//logger.debug("서치::::::"+search);
		return session.selectOne("team.MercenarySearch",search);
	}

	@Override
	public List<Mercenary> mercenaryranking(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("team.selectmercenaryranking", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectCountM() {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectCountM");
	}

	@Override
	public int selectCountT() {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectCountT");
	}

	@Override
	public List<Team> selectTeamRanking(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("team.selectTeamRanking", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public Team selectTeamCheck(String teamname) {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectTeamCheck", teamname);
	}

	@Override
	public int insertTeam(Team team) {
		// TODO Auto-generated method stub
		return session.insert("team.InsertTeam", team);
	}

	@Override
	public int updateNotice(String noticeTitle, String noticeContent, int noticeNo) {
		// TODO Auto-generated method stub
		
		TeamNotice notice = new TeamNotice();
		notice.setNoticeContent(noticeContent);
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeNo(noticeNo);
		return session.update("team.updateNotice", notice);
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
