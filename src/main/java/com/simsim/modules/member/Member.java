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
	private Integer adminNy;
	private Integer snsType;
	
	private String idp;
	private String emailp;
	private String dobp;
	
	private String codeNameKor;
	private String registerDateTime;
	private String modifiedDateTime;
	
	private String survey;
//	private String snSeq;
	
	// for kakoLogin
	private String snsId;
	private String token;
	
	//****************
	
	public String getSeq() {
		return seq;
	}
	public String getSurvey() {
		return survey;
	}
	public void setSurvey(String survey) {
		this.survey = survey;
	}
//	public String getSnSeq() {
//		return snSeq;
//	}
//	public void setSnSeq(String snSeq) {
//		this.snSeq = snSeq;
//	}
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
		return modifiedDateTime;
	}
	public void setModifyDateTime(String modifyDateTime) {
		this.modifiedDateTime = modifyDateTime;
	}
	public String getIdp() {
		return idp;
	}
	public void setIdp(String idp) {
		this.idp = idp;
	}
	public String getEmailp() {
		return emailp;
	}
	public void setEmailp(String emailp) {
		this.emailp = emailp;
	}
	public String getDobp() {
		return dobp;
	}
	public void setDobp(String dobp) {
		this.dobp = dobp;
	}
	public String getModifiedDateTime() {
		return modifiedDateTime;
	}
	public void setModifiedDateTime(String modifiedDateTime) {
		this.modifiedDateTime = modifiedDateTime;
	}
	public String getSnsId() {
		return snsId;
	}
	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public Integer getAdminNy() {
		return adminNy;
	}
	public void setAdminNy(Integer adminNy) {
		this.adminNy = adminNy;
	}
	public Integer getSnsType() {
		return snsType;
	}
	public void setSnsType(Integer snsType) {
		this.snsType = snsType;
	}
	

}
