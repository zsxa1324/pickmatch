package com.kh.pickmatch.model.vo;

import java.util.Date;

public class HomeSaInfo {
	private int matchNo;
	private String teamHome;
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
	
	public HomeSaInfo() {}

	public HomeSaInfo(int matchNo, String teamHome, Date matchDate, String matchTime, String matchType,
			String playGround, int cost, String matchContent, int lat, int lng, int totalPlayCount, int win, int draw,
			int lose) {
		super();
		this.matchNo = matchNo;
		this.teamHome = teamHome;
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

	@Override
	public String toString() {
		return "HomeSaInfo [matchNo=" + matchNo + ", teamHome=" + teamHome + ", matchDate=" + matchDate + ", matchTime="
				+ matchTime + ", matchType=" + matchType + ", playGround=" + playGround + ", cost=" + cost
				+ ", matchContent=" + matchContent + ", lat=" + lat + ", lng=" + lng + ", totalPlayCount="
				+ totalPlayCount + ", win=" + win + ", draw=" + draw + ", lose=" + lose + "]";
	}
	
	
}
