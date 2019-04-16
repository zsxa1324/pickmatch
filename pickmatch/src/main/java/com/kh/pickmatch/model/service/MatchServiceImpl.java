package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pickmatch.model.dao.MatchDao;
import com.kh.pickmatch.model.vo.AwaySaInfo;
import com.kh.pickmatch.model.vo.HomeSaInfo;
import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.MatchPEmblem;
import com.kh.pickmatch.model.vo.MemberByTeam;

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

	@Override
	public MatchPEmblem matchInfo(MatchPEmblem m) {
		MatchPEmblem result = dao.matchInfo(m);
		return result;
	}

	@Override
	public List<Map> memberInfo(String teamName) {
		List<Map> memberList=dao.memberInfo(teamName);
		return memberList;
	}

	@Override
	public MemberByTeam memberByTeam(String id) {
		MemberByTeam mbt=dao.memberByTeam(id);
		return mbt;
	}

	@Override
	public int matchRequest(Map<String,Object> map) {
		int result=dao.matchRequest(map);
		return result;
	}

	@Override
	public List<Map> matchResponse(int matchNo) {
		List<Map> matchResponse=dao.matchResponse(matchNo);
		return matchResponse;
	}

	@Override
	public int matchOk(Map<String, Object> map) {
		int result=dao.matchOk(map);
		return result;
	}

	@Override
	public HomeSaInfo matchSa(Map<String,Object> map) {
		HomeSaInfo list=dao.matchSa(map);
		return list;
	}

	@Override
	public AwaySaInfo matchSaa(Map<String, Object> map) {
		AwaySaInfo list=dao.matchSaa(map);
		return list;
	}

	@Override
	public List<Map> matchindexContent(String today) {
		List<Map> list=dao.matchindexContent(today);
		return list;
	}

	@Override
	public Match selectOneMatch(int matchNo) {
		// TODO Auto-generated method stub
		return dao.selectOneMatch(matchNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	

	
	
}
