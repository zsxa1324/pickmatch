package com.kh.pickmatch.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.pickmatch.model.vo.Match;

public interface MatchDao {
	
	public List<Match> matchList();
	public List<Map> tMatch();
	public List<Map> fMatch();
	public List<Map> matchContent(String matchDate);
	public List<Map> incomMatch(String matchDate);

}
