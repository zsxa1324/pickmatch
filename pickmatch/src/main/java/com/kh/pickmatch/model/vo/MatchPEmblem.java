package com.kh.pickmatch.model.vo;

import java.sql.Date;

public class MatchPEmblem {

	private int matchNo;
	private String teamHome, teamAway;
	private Date matchDate;
	private String matchTime;
	private String matchType, playGround;
	private int homeScore, awayScore;
	private int cost;
	private double lat, lng;
	private String emblem;
	private String location;
	private String teamType;
	private String uniform;
	private int teamCount;
	private String introduce;
	private String matchContent;

	
	public MatchPEmblem() {}


	public MatchPEmblem(int matchNo, String teamHome, String teamAway, Date matchDate, String matchTime,
			String matchType, String playGround, int homeScore, int awayScore, int cost, double lat, double lng,
			String emblem, String location, String teamType, String uniform, int teamCount, String introduce,
			String matchContent) {
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
		this.lat = lat;
		this.lng = lng;
		this.emblem = emblem;
		this.location = location;
		this.teamType = teamType;
		this.uniform = uniform;
		this.teamCount = teamCount;
		this.introduce = introduce;
		this.matchContent = matchContent;
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


	public String getEmblem() {
		return emblem;
	}


	public void setEmblem(String emblem) {
		this.emblem = emblem;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getTeamType() {
		return teamType;
	}


	public void setTeamType(String teamType) {
		this.teamType = teamType;
	}


	public String getUniform() {
		return uniform;
	}


	public void setUniform(String uniform) {
		this.uniform = uniform;
	}


	public int getTeamCount() {
		return teamCount;
	}


	public void setTeamCount(int teamCount) {
		this.teamCount = teamCount;
	}


	public String getIntroduce() {
		return introduce;
	}


	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


	public String getMatchContent() {
		return matchContent;
	}


	public void setMatchContent(String matchContent) {
		this.matchContent = matchContent;
	}


	@Override
	public String toString() {
		return "MatchPEmblem [matchNo=" + matchNo + ", teamHome=" + teamHome + ", teamAway=" + teamAway + ", matchDate="
				+ matchDate + ", matchTime=" + matchTime + ", matchType=" + matchType + ", playGround=" + playGround
				+ ", homeScore=" + homeScore + ", awayScore=" + awayScore + ", cost=" + cost + ", lat=" + lat + ", lng="
				+ lng + ", emblem=" + emblem + ", location=" + location + ", teamType=" + teamType + ", uniform="
				+ uniform + ", teamCount=" + teamCount + ", introduce=" + introduce + ", matchContent=" + matchContent
				+ "]";
	}

	
	
	
}
