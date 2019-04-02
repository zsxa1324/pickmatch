package com.kh.pickmatch.model.vo;

import java.util.Date;

public class Match {
	
	private int matchNo;
	private String teamHome;
	private String teamAway;
	private Date matchDate;
	private String matchType;
	private String playGround;
	private int homeScore;
	private int awayScore;
	private int cost;
	
	
	public Match() {
		// TODO Auto-generated constructor stub
	}


	public Match(int matchNo, String teamHome, String teamAway, Date matchDate, String matchType, String playGround,
			int homeScore, int awayScore, int cost) {
		super();
		this.matchNo = matchNo;
		this.teamHome = teamHome;
		this.teamAway = teamAway;
		this.matchDate = matchDate;
		this.matchType = matchType;
		this.playGround = playGround;
		this.homeScore = homeScore;
		this.awayScore = awayScore;
		this.cost = cost;
	}


	public int getMatchNo() {
		return matchNo;
	}


	public void setMatchNo(int matchNo) {
		this.matchNo = matchNo;
	}


	public String getTeamHome() {
		return teamHome;
	}


	public void setTeamHome(String teamHome) {
		this.teamHome = teamHome;
	}


	public String getTeamAway() {
		return teamAway;
	}


	public void setTeamAway(String teamAway) {
		this.teamAway = teamAway;
	}


	public Date getMatchDate() {
		return matchDate;
	}


	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}


	public String getMatchType() {
		return matchType;
	}


	public void setMatchType(String matchType) {
		this.matchType = matchType;
	}


	public String getPlayGround() {
		return playGround;
	}


	public void setPlayGround(String playGround) {
		this.playGround = playGround;
	}


	public int getHomeScore() {
		return homeScore;
	}


	public void setHomeScore(int homeScore) {
		this.homeScore = homeScore;
	}


	public int getAwayScore() {
		return awayScore;
	}


	public void setAwayScore(int awayScore) {
		this.awayScore = awayScore;
	}


	public int getCost() {
		return cost;
	}


	public void setCost(int cost) {
		this.cost = cost;
	}


	@Override
	public String toString() {
		return "Match [matchNo=" + matchNo + ", teamHome=" + teamHome + ", teamAway=" + teamAway + ", matchDate="
				+ matchDate + ", matchType=" + matchType + ", playGround=" + playGround + ", homeScore=" + homeScore
				+ ", awayScore=" + awayScore + ", cost=" + cost + "]";
	}
	
	

}
