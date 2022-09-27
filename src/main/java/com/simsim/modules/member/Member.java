package com.simsim.modules.member;

public class Member {

	private String seq;
	private String nickname;
	private String dob;
	private Integer gender;
	private Integer phoneAgency;
	private String phoneNum;
	private String email;
	private String emailInsert;
	private String emailDomain;
	private String id;
	private String password;
	private Integer delNy;
	private Integer lgResultNy;
	
	private String codeNameKor;
	private String registerDateTime;
	private String modifyDateTime;
	
	//****************
	
	public String getSeq() {
		return seq;
	}
	public Integer getLgResultNy() {
		return lgResultNy;
	}
	public void setLgResultNy(Integer lgResultNy) {
		this.lgResultNy = lgResultNy;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Integer getPhoneAgency() {
		return phoneAgency;
	}
	public void setPhoneAgency(Integer phoneAgency) {
		this.phoneAgency = phoneAgency;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailInsert() {
		return emailInsert;
	}
	public void setEmailInsert(String emailInsert) {
		this.emailInsert = emailInsert;
	}
	public String getEmailDomain() {
		return emailDomain;
	}
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getDelNy() {
		return delNy;
	}
	public void setDelNy(Integer delNy) {
		this.delNy = delNy;
	}
	public String getCodeNameKor() {
		return codeNameKor;
	}
	public void setCodeNameKor(String codeNameKor) {
		this.codeNameKor = codeNameKor;
	}
	public String getRegisterDateTime() {
		return registerDateTime;
	}
	public void setRegisterDateTime(String registerDateTime) {
		this.registerDateTime = registerDateTime;
	}
	public String getModifyDateTime() {
		return modifyDateTime;
	}
	public void setModifyDateTime(String modifyDateTime) {
		this.modifyDateTime = modifyDateTime;
	}
	
}
