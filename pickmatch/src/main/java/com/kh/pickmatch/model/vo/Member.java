package com.kh.pickmatch.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6534814008227138973L;
	private String memberId;
	private String password;
	private String memberName;
	private String nickname;
	private String phone;
	private String email;
	private String birth;
	private String gender;
	private String position;
	private String location;
	private Date enrollDate;
	private String status;
	private String profile;
	private String introduce;
	private int activityPoint;
	private String teamName;
	private String authority;
	


	public Member() {}

	public Member(String memberId, String password, String memberName, String nickname, String phone, String email,
			String birth, String gender, String position, String location, Date enrollDate, String status,
			String profile, String introduce, int activityPoint) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.nickname = nickname;
		this.phone = phone;
		this.email = email;
		this.birth = birth;
		this.gender = gender;
		this.position = position;
		this.location = location;
		this.enrollDate = enrollDate;
		this.status = status;
		this.profile = profile;
		this.introduce = introduce;
		this.activityPoint = activityPoint;
	}

	
	public Member(String memberId, String password, String memberName, String nickname, String phone, String email,
			String birth, String gender, String position, String location, Date enrollDate, String status,
			String profile, String introduce, int activityPoint, String teamName) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.nickname = nickname;
		this.phone = phone;
		this.email = email;
		this.birth = birth;
		this.gender = gender;
		this.position = position;
		this.location = location;
		this.enrollDate = enrollDate;
		this.status = status;
		this.profile = profile;
		this.introduce = introduce;
		this.activityPoint = activityPoint;
		this.teamName = teamName;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public int getActivityPoint() {
		return activityPoint;
	}

	public void setActivityPoint(int activityPoint) {
		this.activityPoint = activityPoint;
	}
	

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", memberName=" + memberName + ", nickname="
				+ nickname + ", phone=" + phone + ", email=" + email + ", birth=" + birth + ", gender=" + gender
				+ ", position=" + position + ", location=" + location + ", enrollDate=" + enrollDate + ", status="
				+ status + ", profile=" + profile + ", introduce=" + introduce + ", activityPoint=" + activityPoint
				+ ", teamName=" + teamName + "]";
	}



	
}
