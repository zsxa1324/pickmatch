package com.kh.pickmatch.model.vo;

public class Score {
	
	
	private String teamName;
	private int teamScore;
	private int win;
	private int draw;
	private int lose;
	
	public Score() {
		// TODO Auto-generated constructor stub
	}

	public Score(String teamName, int teamScore, int win, int draw, int lose) {
		super();
		this.teamName = teamName;
		this.teamScore = teamScore;
		this.win = win;
		this.draw = draw;
		this.lose = lose;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public int getTeamScore() {
		return teamScore;
	}

	public void setTeamScore(int teamScore) {
		this.teamScore = teamScore;
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
		return "Score [teamName=" + teamName + ", teamScore=" + teamScore + ", win=" + win + ", draw=" + draw
				+ ", lose=" + lose + "]";
	}
	
	
	
	
	
	
	
	
	

}
