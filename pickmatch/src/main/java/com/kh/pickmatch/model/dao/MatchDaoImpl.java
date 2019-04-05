package com.kh.pickmatch.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pickmatch.model.vo.Match;

@Repository
public class MatchDaoImpl implements MatchDao {

	@Autowired	
	private SqlSessionTemplate session;
	
	@Override
	public List<Match> matchList() {
		List<Match> list=session.selectList("match.matchList");
		return list;
	}
	
	@Override
	public List<Map> tMatch() {
		List<Map> list=session.selectList("match.tMatch");
		return list;
	}
	
	@Override
	public List<Map> fMatch() {
		List<Map> list=session.selectList("match.fMatch");
		return list;
	}
	
	@Override
	public List<Map> matchContent(String matchDate) {
		List<Map> list=session.selectList("match.matchContent",matchDate);
		return list;
	}
	
	@Override
	public List<Map> incomMatch(String matchDate) {
		List<Map> list=session.selectList("match.incomMatch",matchDate);
		return list;
	}
	
	@Override
	public int insertMatch(Match match) {
		int result = session.insert("match.insertMatch", match);
		return result;
	}

}
