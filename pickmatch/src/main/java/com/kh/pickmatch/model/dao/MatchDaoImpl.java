package com.kh.pickmatch.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pickmatch.model.vo.AwaySaInfo;
import com.kh.pickmatch.model.vo.HomeSaInfo;
import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.MatchPEmblem;
import com.kh.pickmatch.model.vo.MemberByTeam;

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

@Override
public MatchPEmblem matchInfo(MatchPEmblem m) {
	MatchPEmblem result = session.selectOne("match.matchInfo",m);
	return result;
}

@Override
public List<Map> memberInfo(String teamName) {
	List<Map> list=session.selectList("match.memberInfo",teamName);
	return list;
}

@Override
public MemberByTeam memberByTeam(String id) {
	MemberByTeam mbt=session.selectOne("match.memberByTeam",id);
	return mbt;
}

@Override
public int matchRequest(Map<String,Object> map) {
	int result=session.insert("match.matchRequest",map);
	
	return result;
}

@Override
public List<Map> matchResponse(int matchNo) {
	List<Map> matchResponse=session.selectList("match.matchResponse",matchNo);
	return matchResponse;
}

@Override
public int matchOk(Map<String, Object> map) {
	int result=session.update("match.matchOk",map);
	return result;
}

@Override
public HomeSaInfo matchSa(Map<String,Object> map) {
	HomeSaInfo list=session.selectOne("match.matchSa",map);
	return list;
}

@Override
public AwaySaInfo matchSaa(Map<String, Object> map) {
	AwaySaInfo list=session.selectOne("match.matchSaa",map);
	return list;
}

@Override
public List<Map> matchindexContent(String today) {
	List<Map> list=session.selectList("match.matchindexContent",today);
	return list;
}












}
