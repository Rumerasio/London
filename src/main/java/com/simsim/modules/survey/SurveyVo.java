package com.simsim.modules.survey;

import com.simsim.common.constants.Constants;

public class SurveyVo {
	
	
	private String seq;
	
	private String snSeq;
	private String survey;
	private String surveyPhrase;
	private String surveyExplain;
	
	private String sqSeq;
	private Integer question; //질문 번호
	private String questionContent; //질문 내용
	
	private String sqcSeq;
	private Integer choice;
	private String choiceContent;
	private Integer choiceScore;

	private Integer srSeq;
	private Integer resultNum;
	private String resultTitle;
	private String resultSmTitle;
	private String resultContent;
	private Integer scoreRangeStart;
	private Integer scoreRangeEnd;
	private Integer relation1;
	private Integer relation2;
	
	private String srcSeq;
	private Integer totalScore;
	private String datetime;
	
	private String scSeq;
	private String nickname;
	private String commentContent;
	
	private String ssSeq;
	private String ssQuestion;
	private String ssChoosed;
	
	//search 
	
	private String ShRegiMod;
	private String ShdateStart;
	private String ShdateEnd;
	private String ShOption;
	private String ShValue;
	
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
	
	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getSnSeq() {
		return snSeq;
	}

	public void setSnSeq(String snSeq) {
		this.snSeq = snSeq;
	}

	public String getSurvey() {
		return survey;
	}

	public void setSurvey(String survey) {
		this.survey = survey;
	}

	public String getSurveyPhrase() {
		return surveyPhrase;
	}

	public void setSurveyPhrase(String surveyPhrase) {
		this.surveyPhrase = surveyPhrase;
	}

	public String getSurveyExplain() {
		return surveyExplain;
	}

	public void setSurveyExplain(String surveyExplain) {
		this.surveyExplain = surveyExplain;
	}

	public String getSqSeq() {
		return sqSeq;
	}

	public void setSqSeq(String sqSeq) {
		this.sqSeq = sqSeq;
	}

	public Integer getQuestion() {
		return question;
	}

	public void setQuestion(Integer question) {
		this.question = question;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getSqcSeq() {
		return sqcSeq;
	}

	public void setSqcSeq(String sqcSeq) {
		this.sqcSeq = sqcSeq;
	}

	public Integer getChoice() {
		return choice;
	}

	public void setChoice(Integer choice) {
		this.choice = choice;
	}

	public String getChoiceContent() {
		return choiceContent;
	}

	public void setChoiceContent(String choiceContent) {
		this.choiceContent = choiceContent;
	}

	public Integer getChoiceScore() {
		return choiceScore;
	}

	public void setChoiceScore(Integer choiceScore) {
		this.choiceScore = choiceScore;
	}

	public Integer getSrSeq() {
		return srSeq;
	}

	public void setSrSeq(Integer srSeq) {
		this.srSeq = srSeq;
	}

	public Integer getResultNum() {
		return resultNum;
	}

	public void setResultNum(Integer resultNum) {
		this.resultNum = resultNum;
	}

	public String getResultTitle() {
		return resultTitle;
	}

	public void setResultTitle(String resultTitle) {
		this.resultTitle = resultTitle;
	}

	public String getResultSmTitle() {
		return resultSmTitle;
	}

	public void setResultSmTitle(String resultSmTitle) {
		this.resultSmTitle = resultSmTitle;
	}

	public String getResultContent() {
		return resultContent;
	}

	public void setResultContent(String resultContent) {
		this.resultContent = resultContent;
	}

	public Integer getScoreRangeStart() {
		return scoreRangeStart;
	}

	public void setScoreRangeStart(Integer scoreRangeStart) {
		this.scoreRangeStart = scoreRangeStart;
	}

	public Integer getScoreRangeEnd() {
		return scoreRangeEnd;
	}

	public void setScoreRangeEnd(Integer scoreRangeEnd) {
		this.scoreRangeEnd = scoreRangeEnd;
	}

	public Integer getRelation1() {
		return relation1;
	}

	public void setRelation1(Integer relation1) {
		this.relation1 = relation1;
	}

	public Integer getRelation2() {
		return relation2;
	}

	public void setRelation2(Integer relation2) {
		this.relation2 = relation2;
	}

	public String getSrcSeq() {
		return srcSeq;
	}

	public void setSrcSeq(String srcSeq) {
		this.srcSeq = srcSeq;
	}

	public Integer getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(Integer totalScore) {
		this.totalScore = totalScore;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public String getScSeq() {
		return scSeq;
	}

	public void setScSeq(String scSeq) {
		this.scSeq = scSeq;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getSsSeq() {
		return ssSeq;
	}

	public void setSsSeq(String ssSeq) {
		this.ssSeq = ssSeq;
	}

	public String getSsQuestion() {
		return ssQuestion;
	}

	public void setSsQuestion(String ssQuestion) {
		this.ssQuestion = ssQuestion;
	}

	public String getSsChoosed() {
		return ssChoosed;
	}

	public void setSsChoosed(String ssChoosed) {
		this.ssChoosed = ssChoosed;
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
	
	public String getShRegiMod() {
		return ShRegiMod;
	}

	public void setShRegiMod(String shRegiMod) {
		ShRegiMod = shRegiMod;
	}

	public int getStartRnumForMysql() {
		return startRnumForMysql;
	}

	public void setStartRnumForMysql(int startRnumForMysql) {
		this.startRnumForMysql = startRnumForMysql;
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

	public String getShOption() {
		return ShOption;
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
