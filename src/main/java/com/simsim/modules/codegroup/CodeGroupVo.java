package com.simsim.modules.codegroup;

public class CodeGroupVo {

	private String ShOption;
	private String ShValue;
	private String ShdelNy;
	private String ShdateStart;
	private String ShdateEnd;
	
	private String seq;
	
	//*************
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getShOption() {
		return ShOption;
	}
	public String getShdateStart() {
		return ShdateStart;
	}
	public void setShdateStart(String shdateStart) {
		ShdateStart = shdateStart;
	}
	public String getShdateEnd() {
		return ShdateEnd;
	}
	public void setShdateEnd(String shdateEnd) {
		ShdateEnd = shdateEnd;
	}
	public String getShdelNy() {
		return ShdelNy;
	}
	public void setShdelNy(String shdelNy) {
		ShdelNy = shdelNy;
	}
	public void setShOption(String shOption) {
		ShOption = shOption;
	}
	public String getShValue() {
		return ShValue;
	}
	public void setShValue(String shValue) {
		ShValue = shValue;
	}
	
}
