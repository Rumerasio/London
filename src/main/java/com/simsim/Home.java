package com.simsim;

public class Home {

	//	대구우수숙박 목록
//	private String status;
//	private String total;
//	private Object[] data;
//	private String num;
//	private String shop;
//	private String address;
//	private String tel;
//	private String korean_style;
//	private String western_style;
	
	//	역별 시간대별 승하차인원정보
	
	private String currentCount;
	private String matchCount;
	private String page;
	private String perPage;
	private String totalCount;
	
	// 던파 API
	private Object[] rows;
	private String serverId;
	private String serverName;
	private String characterId;
	private String characterName;
	private String level;
	private String jobId;
	private String jobGrowId;
	private String jobName;
	private String jobGrowName;
	private String adventureName;
	private String guildId;
	private String guildName;
	private Object[] buff;
	private Object[] status;
	private String name;
	private String value;
	
	
	
	public Object[] getStatus() {
		return status;
	}
	public String getCharacterId() {
		return characterId;
	}
	public void setCharacterId(String characterId) {
		this.characterId = characterId;
	}
	public String getCharacterName() {
		return characterName;
	}
	public void setCharacterName(String characterName) {
		this.characterName = characterName;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	public String getJobGrowId() {
		return jobGrowId;
	}
	public void setJobGrowId(String jobGrowId) {
		this.jobGrowId = jobGrowId;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getJobGrowName() {
		return jobGrowName;
	}
	public void setJobGrowName(String jobGrowName) {
		this.jobGrowName = jobGrowName;
	}
	public String getAdventureName() {
		return adventureName;
	}
	public void setAdventureName(String adventureName) {
		this.adventureName = adventureName;
	}
	public String getGuildId() {
		return guildId;
	}
	public void setGuildId(String guildId) {
		this.guildId = guildId;
	}
	public String getGuildName() {
		return guildName;
	}
	public void setGuildName(String guildName) {
		this.guildName = guildName;
	}
	public Object[] getBuff() {
		return buff;
	}
	public void setBuff(Object[] buff) {
		this.buff = buff;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public void setStatus(Object[] status) {
		this.status = status;
	}
	public Object[] getRows() {
		return rows;
	}
	public void setRows(Object[] rows) {
		this.rows = rows;
	}
	public String getServerId() {
		return serverId;
	}
	public void setServerId(String serverId) {
		this.serverId = serverId;
	}
	public String getServerName() {
		return serverName;
	}
	public void setServerName(String serverName) {
		this.serverName = serverName;
	}
	public String getMatchCount() {
		return matchCount;
	}
	public void setMatchCount(String matchCount) {
		this.matchCount = matchCount;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPerPage() {
		return perPage;
	}
	public void setPerPage(String perPage) {
		this.perPage = perPage;
	}
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public String getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(String currentCount) {
		this.currentCount = currentCount;
	}
	
	
	
}
