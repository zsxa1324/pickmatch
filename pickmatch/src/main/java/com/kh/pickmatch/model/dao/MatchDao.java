package com.kh.pickmatch.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.MatchPEmblem;
import com.kh.pickmatch.model.vo.MemberByTeam;

public interface MatchDao {
	
	public List<Match> matchList();
	public List<Map> tMatch();
	public List<Map> fMatch();
	public List<Map> matchContent(String matchDate);
	public List<Map> incomMatch(String matchDate);
	public int insertMatch(Match match);
	public MatchPEmblem matchInfo(MatchPEmblem m);
	public List<Map> memberInfo(String teamName);
	public MemberByTeam memberByTeam(String id);
	public int matchRequest(Map<String,Object> map);
	public List<Map> matchResponse(int matchNo);
	public int matchOk(Map<String, Object> map);
	
}
