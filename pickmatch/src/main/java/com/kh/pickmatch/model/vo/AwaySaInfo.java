package com.kh.pickmatch.model.vo;

import java.util.Date;

public class AwaySaInfo {
	
	private int matchNo;
	private String teamAway;
	private Date matchDate;
	private String matchTime;
	private String matchType;
	private String playGround;
	private int cost;
	private String matchContent;
	private int lat;
	private int lng;
	private int totalPlayCount;
	private int win;
	private int draw;
	private int lose;
	private String location;
	private String awayEmblem;
	
	public AwaySaInfo() {}

	public AwaySaInfo(int matchNo, String teamAway, Date matchDate, String matchTime, String matchType,
			String playGround, int cost, String matchContent, int lat, int lng, int totalPlayCount, int win, int draw,
			int lose, String location, String awayEmblem) {
		super();
		this.matchNo = matchNo;
		this.teamAway = teamAway;
		this.matchDate = matchDate;
		this.matchTime = matchTime;
		this.matchType = matchType;
		this.playGround = playGround;
		this.cost = cost;
		this.matchContent = matchContent;
		this.lat = lat;
		this.lng = lng;
		this.totalPlayCount = totalPlayCount;
		this.win = win;
		this.draw = draw;
		this.lose = lose;
		this.location = location;
		this.awayEmblem = awayEmblem;
	}

	public int getMatchNo() {
		return matchNo;
	}

	public void setMatchNo(int matchNo) {
		this.matchNo = matchNo;
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

	public int getTotalPlayCount() {
		return totalPlayCount;
	}

	public void setTotalPlayCount(int totalPlayCount) {
		this.totalPlayCount = totalPlayCount;
	}

	public int getWin() {
		return win;
	}

	public void setWin(int win) {
		this.win = win;
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getLose() {
		return lose;
	}

	public void setLose(int lose) {
		this.lose = lose;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAwayEmblem() {
		return awayEmblem;
	}

	public void setAwayEmblem(String awayEmblem) {
		this.awayEmblem = awayEmblem;
	}

	@Override
	public String toString() {
		return "AwaySaInfo [matchNo=" + matchNo + ", teamAway=" + teamAway + ", matchDate=" + matchDate + ", matchTime="
				+ matchTime + ", matchType=" + matchType + ", playGround=" + playGround + ", cost=" + cost
				+ ", matchContent=" + matchContent + ", lat=" + lat + ", lng=" + lng + ", totalPlayCount="
				+ totalPlayCount + ", win=" + win + ", draw=" + draw + ", lose=" + lose + ", location=" + location
				+ ", awayEmblem=" + awayEmblem + "]";
	}

	

}
