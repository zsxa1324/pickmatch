package com.kh.pickmatch.model.service;

import java.util.List;
import java.util.Map;

import com.kh.pickmatch.model.vo.Match;

public interface MatchService {

	public List<Match> matchList();
	public List<Map> tmatch();
	public List<Map> fmatch();
	
}
