package com.kh.pickmatch.model.vo;

import java.sql.Date;

public class Match {
	private int matchNo;
	private String teamHome, teamAway;
	private Date matchDate;
	private String matchTime;
	private String matchType, playGround;
	private int homeScore, awayScore;
	private int cost;
	private String matchContent;
	private double lat, lng;
	private String result;
	
	public Match() {}
	
	public Match(int matchNo, String teamHome, String teamAway, Date matchDate, String matchTime, String matchType,
			String playGround, int homeScore, int awayScore, int cost, String matchContent, double lat, double lng,
			String result) {
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
		this.result = result;
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

	public String getMatchTime() {
		return matchTime;
	}

	public void setMatchTime(String matchTime) {
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

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "Match [matchNo=" + matchNo + ", teamHome=" + teamHome + ", teamAway=" + teamAway + ", matchDate="
				+ matchDate + ", matchTime=" + matchTime + ", matchType=" + matchType + ", playGround=" + playGround
				+ ", homeScore=" + homeScore + ", awayScore=" + awayScore + ", cost=" + cost + ", matchContent="
				+ matchContent + ", lat=" + lat + ", lng=" + lng + ", result=" + result + "]";
	}
	
}
