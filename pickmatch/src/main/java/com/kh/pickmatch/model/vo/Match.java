package com.kh.pickmatch.model.vo;

import java.util.Date;

public class Match {
	
	private int matchNo;
	private String teamHome;
	private String teamAway;
	private Date matchDate;
	private int matchTime;
	private String matchType;
	private String playGround;
	private int homeScore;
	private int awayScore;
	private int cost;
	private String matchContent;
	private int lat;
	private int lng;
	
	
	public Match() {
		// TODO Auto-generated constructor stub
	}


	public Match(int matchNo, String teamHome, String teamAway, Date matchDate, int matchTime, String matchType,
			String playGround, int homeScore, int awayScore, int cost, String matchContent, int lat, int lng) {
		super();
		this.matchNo = matchNo;
		this.teamHome = teamHome;
		this.teamAway = teamAway;
		this.matchDate = matchDate;
		this.matchTime = matchTime;
		this.matchType = matchType;
		this.playGround = playGround;
		this.homeScore = homeScore;
		this.awayScore = awayScore;
		this.cost = cost;
		this.matchContent = matchContent;
		this.lat = lat;
		this.lng = lng;
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


	public int getMatchTime() {
		return matchTime;
	}


	public void setMatchTime(int matchTime) {
		this.matchTime = matchTime;
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


	public String getMatchContent() {
		return matchContent;
	}


	public void setMatchContent(String matchContent) {
		this.matchContent = matchContent;
	}


	public int getLat() {
		return lat;
	}


	public void setLat(int lat) {
		this.lat = lat;
	}


	public int getLng() {
		return lng;
	}


	public void setLng(int lng) {
		this.lng = lng;
	}


	@Override
	public String toString() {
		return "Match [matchNo=" + matchNo + ", teamHome=" + teamHome + ", teamAway=" + teamAway + ", matchDate="
				+ matchDate + ", matchTime=" + matchTime + ", matchType=" + matchType + ", playGround=" + playGround
				+ ", homeScore=" + homeScore + ", awayScore=" + awayScore + ", cost=" + cost + ", matchContent="
				+ matchContent + ", lat=" + lat + ", lng=" + lng + "]";
	}



	
	

}
