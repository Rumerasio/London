package com.simsim.modules.member;

import com.simsim.common.constants.Constants;

public class MemberVo {
	private Integer ShdelNy;
	private Integer Shgender;
	private String Shage;
	private String ShregDateStart;
	private String ShregDateEnd;
	private Integer ShOption;
	private String ShValue;
	
	private String id;
	private String password;
	private String nickname;
	private Integer lgResultNy;
	
	private String seq;
	
//	paging
	private int thisPage = 1;									// 현재 페이지
	private int rowNumToShow = Constants.ROW_NUM_TO_SHOW;		// 화면에 보여줄 데이터 줄 갯수
	
	private int pageNumToShow = Constants.PAGE_NUM_TO_SHOW;		// 화면에 보여줄 페이징 번호 갯수

	private int totalRows;										// 전체 데이터 갯수
	private int totalPages;										// 전체 페이지 번호
	private int startPage;										// 시작 페이지 번호
	private int endPage;										// 마지막 페이지 번호
	
	private int startRnumForOracle = 1;							// 쿼리 시작 row
	private int endRnumForOracle;								// 쿼리 끝 row
	private Integer RNUM;

	private int startRnumForMysql = 0;							// 쿼리 시작 row
	
	
	//**************
	
	public Integer getShdelNy() {
		return ShdelNy;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Integer getLgResultNy() {
		return lgResultNy;
	}
	public void setLgResultNy(Integer lgResultNy) {
		this.lgResultNy = lgResultNy;
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
	public void setShdelNy(Integer shdelNy) {
		ShdelNy = shdelNy;
	}
	public Integer getShgender() {
		return Shgender;
	}
	public void setShgender(Integer shgender) {
		Shgender = shgender;
	}
	public String getShage() {
		return Shage;
	}
	public void setShage(String shage) {
		Shage = shage;
	}
	public String getShregDateStart() {
		return ShregDateStart;
	}
	public void setShregDateStart(String shregDateStart) {
		ShregDateStart = shregDateStart;
	}
	public String getShregDateEnd() {
		return ShregDateEnd;
	}
	public void setShregDateEnd(String shregDateEnd) {
		ShregDateEnd = shregDateEnd;
	}
	public Integer getShOption() {
		return ShOption;
	}
	public void setShOption(Integer shOption) {
		ShOption = shOption;
	}
	public String getShValue() {
		return ShValue;
	}
	public void setShValue(String shValue) {
		ShValue = shValue;
	}
	public int getThisPage() {
		return thisPage;
	}
	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}
	public int getRowNumToShow() {
		return rowNumToShow;
	}
	public void setRowNumToShow(int rowNumToShow) {
		this.rowNumToShow = rowNumToShow;
	}
	public int getPageNumToShow() {
		return pageNumToShow;
	}
	public void setPageNumToShow(int pageNumToShow) {
		this.pageNumToShow = pageNumToShow;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartRnumForOracle() {
		return startRnumForOracle;
	}
	public void setStartRnumForOracle(int startRnumForOracle) {
		this.startRnumForOracle = startRnumForOracle;
	}
	public int getEndRnumForOracle() {
		return endRnumForOracle;
	}
	public void setEndRnumForOracle(int endRnumForOracle) {
		this.endRnumForOracle = endRnumForOracle;
	}
	public Integer getRNUM() {
		return RNUM;
	}
	public void setRNUM(Integer rNUM) {
		RNUM = rNUM;
	}
	public int getStartRnumForMysql() {
		return startRnumForMysql;
	}
	public void setStartRnumForMysql(int startRnumForMysql) {
		this.startRnumForMysql = startRnumForMysql;
	}
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public void setParamsPaging(int totalRows) {
		
		//		setThisPage(3);
		
				setTotalRows(totalRows);
		
				if (getTotalRows() == 0) {
					setTotalPages(1);
				} else {
					setTotalPages(getTotalRows() / getRowNumToShow());
				}
		
				if (getTotalRows() % getRowNumToShow() > 0) {
					setTotalPages(getTotalPages() + 1);
				}
		
				if (getTotalPages() < getThisPage()) {
					setThisPage(getTotalPages());
				}
				
				setStartPage(((getThisPage() - 1) / getPageNumToShow()) * getPageNumToShow() + 1);
		
				setEndPage(getStartPage() + getPageNumToShow() - 1);
		
				if (getEndPage() > getTotalPages()) {
					setEndPage(getTotalPages());
				}
				
				setEndRnumForOracle((getRowNumToShow() * getThisPage()));
				setStartRnumForOracle((getEndRnumForOracle() - getRowNumToShow()) + 1);
				if (getStartRnumForOracle() < 1) setStartRnumForOracle(1);
				
				if (thisPage == 1) {
					setStartRnumForMysql(0);
				} else {
					setStartRnumForMysql((getRowNumToShow() * (getThisPage()-1)));
				}
				
				
				System.out.println("getThisPage():" + getThisPage());
				System.out.println("getTotalRows():" + getTotalRows());
				System.out.println("getRowNumToShow():" + getRowNumToShow());
				System.out.println("getTotalPages():" + getTotalPages());
				System.out.println("getStartPage():" + getStartPage());
				System.out.println("getEndPage():" + getEndPage());		
				System.out.println("getStartRnumForOracle():" + getStartRnumForOracle());
				System.out.println("getEndRnumForOracle():" + getEndRnumForOracle());
				System.out.println("getStartRnumForMysql(): " + getStartRnumForMysql());
				
		}
}
