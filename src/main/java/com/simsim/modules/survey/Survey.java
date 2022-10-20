package com.simsim.modules.survey;

public class Survey {
	private String snSeq;
	private String jsSurveyName_snSeq;
	private String survey;
	private String surveyPhrase;
	private String surveyExplain;
	private Integer openNy;
	
	private String sqSeq;
	private String question; //질문 번호
	private String questionContent; //질문 내용
	private String[] questionGroup;
	private String[] questionContentGroup;
	
	private String sqcSeq;
	private Integer multiChoiceNy;
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
	private String[] ssQuestionGroup;
	private String[] ssChoosedGroup;
	private String ssQuestion;
	private String ssChoosed;
	
	private String seq;
	private String jsMember_seq;
	
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
	public Integer getOpenNy() {
		return openNy;
	}
	public void setOpenNy(Integer openNy) {
		this.openNy = openNy;
	}
	public String getSqSeq() {
		return sqSeq;
	}
	public void setSqSeq(String sqSeq) {
		this.sqSeq = sqSeq;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
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
	public Integer getMultiChoiceNy() {
		return multiChoiceNy;
	}
	public void setMultiChoiceNy(Integer multiChoiceNy) {
		this.multiChoiceNy = multiChoiceNy;
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
	public String getSsSeq() {
		return ssSeq;
	}
	public void setSsSeq(String ssSeq) {
		this.ssSeq = ssSeq;
	}
	public String[] getSsQuestionGroup() {
		return ssQuestionGroup;
	}
	public void setSsQuestionGroup(String[] ssQuestionGroup) {
		this.ssQuestionGroup = ssQuestionGroup;
	}
	public String[] getSsChoosedGroup() {
		return ssChoosedGroup;
	}
	public void setSsChoosedGroup(String[] ssChoosedGroup) {
		this.ssChoosedGroup = ssChoosedGroup;
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
	public String getJsSurveyName_snSeq() {
		return jsSurveyName_snSeq;
	}
	public void setJsSurveyName_snSeq(String jsSurveyName_snSeq) {
		this.jsSurveyName_snSeq = jsSurveyName_snSeq;
	}
	public String getJsMember_seq() {
		return jsMember_seq;
	}
	public void setJsMember_seq(String jsMember_seq) {
		this.jsMember_seq = jsMember_seq;
	}
	public String[] getQuestionContentGroup() {
		return questionContentGroup;
	}
	public void setQuestionContentGroup(String[] questionContentGroup) {
		this.questionContentGroup = questionContentGroup;
	}
	public String[] getQuestionGroup() {
		return questionGroup;
	}
	public void setQuestionGroup(String[] questionGroup) {
		this.questionGroup = questionGroup;
	}
	
	
	
	//*********************
	
	
}
