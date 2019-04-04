package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pickmatch.model.dao.MatchDao;
import com.kh.pickmatch.model.vo.Match;

@Service
public class MatchServiceImpl implements MatchService {

@Autowired
private MatchDao dao;
	
	@Override
	public List<Match> matchList() {
		List<Match> list=dao.matchList();
		
		return list;
	}

	@Override
	public List<Map> tmatch() {
		List<Map> list=dao.tMatch();
		return list;
	}

	@Override
	public List<Map> fmatch() {
		List<Map> list=dao.fMatch();
		return list;
	}

	@Override
	public List<Map> matchContent(String matchDate) {
		List<Map> list=dao.matchContent(matchDate);
		return list;
	}

	@Override
	public List<Map> incomMatch(String matchDate) {
		List<Map> list=dao.incomMatch(matchDate);
		return list;
	}

	@Override
	public int insertMatch(Match match) {
		int result = dao.insertMatch(match);
		return result;
	}
	
	

	
	
}
