package com.simsim.modules.survey;

import org.springframework.web.multipart.MultipartFile;

import com.simsim.base.Base;

public class Survey extends Base {
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
	private Integer[] choiceGroup;
	private String[] choiceContentGroup;
	private Integer[] choiceScoreGroup;
	private Integer[] choiceNumPerQuestion;
	
	private String srSeq;
	private Integer resultNum;
	private String resultTitle;
	private String resultSmTitle;
	private String resultContent;
	private Integer scoreRangeStart;
	private Integer scoreRangeEnd;
	private Integer relation1;
	private Integer relation2;
	private Integer[] resultNumGroup;
	private String[] resultTitleGroup;
	private String[] resultContentGroup;
	private Integer[] scoreRangeStartGroup;
	private Integer[] scoreRangeEndGroup;
	private Integer[] relation1Group;
	private Integer[] relation2Group;
	
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
	private String id;
	
	private MultipartFile[] uploadImgCard;
	private Integer uploadImgCardMaxNumber;
	private String[] uploadImgCardDeleteSeq;
	private String[] uploadImgCardDeletePathFile;
	
	private MultipartFile[] uploadImgMain;
	private Integer uploadImgMainMaxNumber;
	private String[] uploadImgMainDeleteSeq;
	private String[] uploadImgMainDeletePathFile;
	
	private MultipartFile[] uploadImgQuestion;
	private Integer uploadImgQuestionMaxNumber;
	private String[] uploadImgQuestionDeleteSeq;
	private String[] uploadImgQuestionDeletePathFile;
	private MultipartFile[] uploadImgQuestionGroup;
	private Integer[] uploadImgQuestionMaxNumberGroup;
	
	private MultipartFile[] uploadImgResult;
	private Integer uploadImgResultMaxNumber;
	private String[] uploadImgResultDeleteSeq;
	private String[] uploadImgResultDeletePathFile;
	private MultipartFile[] uploadImgResultGroup;
	private Integer[] uploadImgResultMaxNumberGroup;
	
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
	public String getSrSeq() {
		return srSeq;
	}
	public void setSrSeq(String srSeq) {
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
	public Integer[] getChoiceGroup() {
		return choiceGroup;
	}
	public void setChoiceGroup(Integer[] choiceGroup) {
		this.choiceGroup = choiceGroup;
	}
	public String[] getChoiceContentGroup() {
		return choiceContentGroup;
	}
	public void setChoiceContentGroup(String[] choiceContentGroup) {
		this.choiceContentGroup = choiceContentGroup;
	}
	public Integer[] getChoiceScoreGroup() {
		return choiceScoreGroup;
	}
	public void setChoiceScoreGroup(Integer[] choiceScoreGroup) {
		this.choiceScoreGroup = choiceScoreGroup;
	}
	public Integer[] getChoiceNumPerQuestion() {
		return choiceNumPerQuestion;
	}
	public void setChoiceNumPerQuestion(Integer[] choiceNumPerQuestion) {
		this.choiceNumPerQuestion = choiceNumPerQuestion;
	}
	public Integer[] getResultNumGroup() {
		return resultNumGroup;
	}
	public void setResultNumGroup(Integer[] resultNumGroup) {
		this.resultNumGroup = resultNumGroup;
	}
	public String[] getResultTitleGroup() {
		return resultTitleGroup;
	}
	public void setResultTitleGroup(String[] resultTitleGroup) {
		this.resultTitleGroup = resultTitleGroup;
	}
	public String[] getResultContentGroup() {
		return resultContentGroup;
	}
	public void setResultContentGroup(String[] resultContentGroup) {
		this.resultContentGroup = resultContentGroup;
	}
	public Integer[] getScoreRangeStartGroup() {
		return scoreRangeStartGroup;
	}
	public void setScoreRangeStartGroup(Integer[] scoreRangeStartGroup) {
		this.scoreRangeStartGroup = scoreRangeStartGroup;
	}
	public Integer[] getScoreRangeEndGroup() {
		return scoreRangeEndGroup;
	}
	public void setScoreRangeEndGroup(Integer[] scoreRangeEndGroup) {
		this.scoreRangeEndGroup = scoreRangeEndGroup;
	}
	public Integer[] getRelation1Group() {
		return relation1Group;
	}
	public void setRelation1Group(Integer[] relation1Group) {
		this.relation1Group = relation1Group;
	}
	public Integer[] getRelation2Group() {
		return relation2Group;
	}
	public void setRelation2Group(Integer[] relation2Group) {
		this.relation2Group = relation2Group;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public MultipartFile[] getUploadImgCard() {
		return uploadImgCard;
	}
	public void setUploadImgCard(MultipartFile[] uploadImgCard) {
		this.uploadImgCard = uploadImgCard;
	}
	public Integer getUploadImgCardMaxNumber() {
		return uploadImgCardMaxNumber;
	}
	public void setUploadImgCardMaxNumber(Integer uploadImgCardMaxNumber) {
		this.uploadImgCardMaxNumber = uploadImgCardMaxNumber;
	}
	public String[] getUploadImgCardDeleteSeq() {
		return uploadImgCardDeleteSeq;
	}
	public void setUploadImgCardDeleteSeq(String[] uploadImgCardDeleteSeq) {
		this.uploadImgCardDeleteSeq = uploadImgCardDeleteSeq;
	}
	public String[] getUploadImgCardDeletePathFile() {
		return uploadImgCardDeletePathFile;
	}
	public void setUploadImgCardDeletePathFile(String[] uploadImgCardDeletePathFile) {
		this.uploadImgCardDeletePathFile = uploadImgCardDeletePathFile;
	}
	public MultipartFile[] getUploadImgMain() {
		return uploadImgMain;
	}
	public void setUploadImgMain(MultipartFile[] uploadImgMain) {
		this.uploadImgMain = uploadImgMain;
	}
	public Integer getUploadImgMainMaxNumber() {
		return uploadImgMainMaxNumber;
	}
	public void setUploadImgMainMaxNumber(Integer uploadImgMainMaxNumber) {
		this.uploadImgMainMaxNumber = uploadImgMainMaxNumber;
	}
	public String[] getUploadImgMainDeleteSeq() {
		return uploadImgMainDeleteSeq;
	}
	public void setUploadImgMainDeleteSeq(String[] uploadImgMainDeleteSeq) {
		this.uploadImgMainDeleteSeq = uploadImgMainDeleteSeq;
	}
	public String[] getUploadImgMainDeletePathFile() {
		return uploadImgMainDeletePathFile;
	}
	public void setUploadImgMainDeletePathFile(String[] uploadImgMainDeletePathFile) {
		this.uploadImgMainDeletePathFile = uploadImgMainDeletePathFile;
	}
	public MultipartFile[] getUploadImgQuestion() {
		return uploadImgQuestion;
	}
	public void setUploadImgQuestion(MultipartFile[] uploadImgQuestion) {
		this.uploadImgQuestion = uploadImgQuestion;
	}
	public Integer getUploadImgQuestionMaxNumber() {
		return uploadImgQuestionMaxNumber;
	}
	public void setUploadImgQuestionMaxNumber(Integer uploadImgQuestionMaxNumber) {
		this.uploadImgQuestionMaxNumber = uploadImgQuestionMaxNumber;
	}
	public String[] getUploadImgQuestionDeleteSeq() {
		return uploadImgQuestionDeleteSeq;
	}
	public void setUploadImgQuestionDeleteSeq(String[] uploadImgQuestionDeleteSeq) {
		this.uploadImgQuestionDeleteSeq = uploadImgQuestionDeleteSeq;
	}
	public String[] getUploadImgQuestionDeletePathFile() {
		return uploadImgQuestionDeletePathFile;
	}
	public void setUploadImgQuestionDeletePathFile(String[] uploadImgQuestionDeletePathFile) {
		this.uploadImgQuestionDeletePathFile = uploadImgQuestionDeletePathFile;
	}
	public MultipartFile[] getUploadImgResult() {
		return uploadImgResult;
	}
	public void setUploadImgResult(MultipartFile[] uploadImgResult) {
		this.uploadImgResult = uploadImgResult;
	}
	public Integer getUploadImgResultMaxNumber() {
		return uploadImgResultMaxNumber;
	}
	public void setUploadImgResultMaxNumber(Integer uploadImgResultMaxNumber) {
		this.uploadImgResultMaxNumber = uploadImgResultMaxNumber;
	}
	public String[] getUploadImgResultDeleteSeq() {
		return uploadImgResultDeleteSeq;
	}
	public void setUploadImgResultDeleteSeq(String[] uploadImgResultDeleteSeq) {
		this.uploadImgResultDeleteSeq = uploadImgResultDeleteSeq;
	}
	public String[] getUploadImgResultDeletePathFile() {
		return uploadImgResultDeletePathFile;
	}
	public void setUploadImgResultDeletePathFile(String[] uploadImgResultDeletePathFile) {
		this.uploadImgResultDeletePathFile = uploadImgResultDeletePathFile;
	}
	public MultipartFile[] getUploadImgQuestionGroup() {
		return uploadImgQuestionGroup;
	}
	public void setUploadImgQuestionGroup(MultipartFile[] uploadImgQuestionGroup) {
		this.uploadImgQuestionGroup = uploadImgQuestionGroup;
	}
	public Integer[] getUploadImgQuestionMaxNumberGroup() {
		return uploadImgQuestionMaxNumberGroup;
	}
	public void setUploadImgQuestionMaxNumberGroup(Integer[] uploadImgQuestionMaxNumberGroup) {
		this.uploadImgQuestionMaxNumberGroup = uploadImgQuestionMaxNumberGroup;
	}
	public MultipartFile[] getUploadImgResultGroup() {
		return uploadImgResultGroup;
	}
	public void setUploadImgResultGroup(MultipartFile[] uploadImgResultGroup) {
		this.uploadImgResultGroup = uploadImgResultGroup;
	}
	public Integer[] getUploadImgResultMaxNumberGroup() {
		return uploadImgResultMaxNumberGroup;
	}
	public void setUploadImgResultMaxNumberGroup(Integer[] uploadImgResultMaxNumberGroup) {
		this.uploadImgResultMaxNumberGroup = uploadImgResultMaxNumberGroup;
	}
	
	
	//*********************
	
	
}
