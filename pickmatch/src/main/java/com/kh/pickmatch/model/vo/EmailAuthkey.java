package com.kh.pickmatch.model.vo;

import java.util.Date;

public class EmailAuthkey {
	
	private String memberId;
	private String authkey;
	private String email;
	private Date insertTime;
	
	public EmailAuthkey() {
		// TODO Auto-generated constructor stub
	}

	public EmailAuthkey(String memberId, String authkey, String email, Date insertTime) {
		super();
		this.memberId = memberId;
		this.authkey = authkey;
		this.email = email;
		this.insertTime = insertTime;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}

	@Override
	public String toString() {
		return "EmailAuthkey [memberId=" + memberId + ", authkey=" + authkey + ", email=" + email + ", insertTime="
				+ insertTime + "]";
	}
	
	

}