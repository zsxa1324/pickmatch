package com.kh.pickmatch.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Team implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8890263015785295768L;
	private String teamName;
	private int teamRating;
	private String teamLocation;
	private String teamField;
	private String teamType;
	private String teamColor;
	private String teamContent;
	private Date openingDate;
	private String teamEmblem;
	private String teamStatus;
	private int rank;
	private int win;
	private int draw;
	private int lose;
	
	public Team() {}

	public Team(String teamName, int teamRating, String teamLocation, String teamField, String teamType,
			String teamColor, String teamContent, Date openingDate, String teamEmblem, String teamStatus) {
		super();
		this.teamName = teamName;
		this.teamRating = teamRating;
		this.teamLocation = teamLocation;
		this.teamField = teamField;
		this.teamType = teamType;
		this.teamColor = teamColor;
		this.teamContent = teamContent;
		this.openingDate = openingDate;
		this.teamEmblem = teamEmblem;
		this.teamStatus = teamStatus;
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

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public int getTeamRating() {
		return teamRating;
	}

	public void setTeamRating(int teamRating) {
		this.teamRating = teamRating;
	}

	public String getTeamLocation() {
		return teamLocation;
	}

	public void setTeamLocation(String teamLocation) {
		this.teamLocation = teamLocation;
	}

	public String getTeamField() {
		return teamField;
	}

	public void setTeamField(String teamField) {
		this.teamField = teamField;
	}

	public String getTeamType() {
		return teamType;
	}

	public void setTeamType(String teamType) {
		this.teamType = teamType;
	}

	public String getTeamColor() {
		return teamColor;
	}

	public void setTeamColor(String teamColor) {
		this.teamColor = teamColor;
	}

	public String getTeamContent() {
		return teamContent;
	}

	public void setTeamContent(String teamContent) {
		this.teamContent = teamContent;
	}

	public Date getOpeningDate() {
		return openingDate;
	}

	public void setOpeningDate(Date openingDate) {
		this.openingDate = openingDate;
	}

	public String getTeamEmblem() {
		return teamEmblem;
	}

	public void setTeamEmblem(String teamEmblem) {
		this.teamEmblem = teamEmblem;
	}

	public String getTeamStatus() {
		return teamStatus;
	}

	public void setTeamStatus(String teamStatus) {
		this.teamStatus = teamStatus;
	}

	@Override
	public String toString() {
		return "Team [teamName=" + teamName + ", teamRating=" + teamRating + ", teamLocation=" + teamLocation
				+ ", teamField=" + teamField + ", teamType=" + teamType + ", teamColor=" + teamColor + ", teamContent="
				+ teamContent + ", openingDate=" + openingDate + ", teamEmblem=" + teamEmblem + ", teamStatus="
				+ teamStatus + "]";
	}
	
}
