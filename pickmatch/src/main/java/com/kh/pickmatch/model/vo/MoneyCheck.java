package com.kh.pickmatch.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MoneyCheck implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1821725330837026246L;
	private Date moneyDate;
	private String teamName;
	private String memberId;
	private String status;
	
	public MoneyCheck() {}

	public MoneyCheck(Date moneyDate, String teamName, String memberId, String status) {
		super();
		this.moneyDate = moneyDate;
		this.teamName = teamName;
		this.memberId = memberId;
		this.status = status;
	}

	public Date getMoneyDate() {
		return moneyDate;
	}

	public void setMoneyDate(Date moneyDate) {
		this.moneyDate = moneyDate;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MoneyCheck [moneyDate=" + moneyDate + ", teamName=" + teamName + ", memberId=" + memberId + ", status="
				+ status + "]";
	}
	
}
