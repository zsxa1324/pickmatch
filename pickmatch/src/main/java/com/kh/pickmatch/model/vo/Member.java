package com.kh.pickmatch.model.vo;

import java.util.Date;

public class Member {
	
	private String memberId;
	private String password;
	private String memberName;
	private String nickName;
	private String phone;
	private String email;
	private int birth;
	private String gender;
	private String position;
	private String location;
	private Date enrollDate;
	private String status;
	private String profile;
	private String introduce;
	private int activityPoint;
	
	public Member() {}

	public Member(String memberId, String password, String memberName, String nickName, String phone, String email,
			int birth, String gender, String position, String location, Date enrollDate, String status, String profile,
			String introduce, int activityPoint) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.nickName = nickName;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
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

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", memberName=" + memberName + ", nickName="
				+ nickName + ", phone=" + phone + ", email=" + email + ", birth=" + birth + ", gender=" + gender
				+ ", position=" + position + ", location=" + location + ", enrollDate=" + enrollDate + ", status="
				+ status + ", profile=" + profile + ", introduce=" + introduce + ", activityPoint=" + activityPoint
				+ "]";
	}
	
	

}
