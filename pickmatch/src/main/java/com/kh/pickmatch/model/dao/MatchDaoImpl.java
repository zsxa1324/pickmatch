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


}
