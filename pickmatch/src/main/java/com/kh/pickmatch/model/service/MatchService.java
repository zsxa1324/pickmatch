package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import com.kh.pickmatch.model.vo.AwaySaInfo;
import com.kh.pickmatch.model.vo.HomeSaInfo;
import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.MatchPEmblem;
import com.kh.pickmatch.model.vo.MemberByTeam;

public interface MatchService {

	public List<Match> matchList();
	public List<Map> tmatch();
	public List<Map> fmatch();
	public List<Map> matchContent(String matchDate);
	public List<Map> incomMatch(String matchDate);
	public int insertMatch(Match match);
	public MatchPEmblem matchInfo(MatchPEmblem m);
	public List<Map> memberInfo(String teamName);
	public MemberByTeam memberByTeam(String id);
	public int matchRequest(Map<String,Object> map);
	public List<Map> matchResponse(int matchNo);
	public int matchOk(Map<String, Object> map);
	public HomeSaInfo matchSa(Map<String,Object> map);
	public AwaySaInfo matchSaa(Map<String, Object> map);
	
}
