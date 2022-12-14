package com.simsim.modules.survey;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface SurveyService {

	public List<Survey> selectList(SurveyVo vo) throws Exception;
	public int getListNum(SurveyVo vo) throws Exception;
	public List<Survey> selectUserRecord(SurveyVo vo) throws Exception;
	public int countUserRecord(SurveyVo vo) throws Exception;
	public List<Survey> selectMyComment(SurveyVo vo) throws Exception;
	public int countMyComment(SurveyVo vo) throws Exception;
	public List<Survey> selectSurveyCommentList(SurveyVo vo) throws Exception;
	public List<Survey> selectSurveyContentQuestion(SurveyVo vo) throws Exception;
	public List<Survey> selectSurveyContentChoice(SurveyVo vo) throws Exception;
	public List<Survey> selectResultList(SurveyVo vo) throws Exception;
	public List<Survey> selectCommentList(SurveyVo vo) throws Exception;
	public int getCommentNum(SurveyVo vo) throws Exception;
	public int getSurveyNum(SurveyVo vo) throws Exception;
	public int getTodayNewComment(SurveyVo vo) throws Exception;
	
	public List<Survey> selectContentRecordList(SurveyVo vo) throws Exception;
	
	public int selectContentRecordCount(SurveyVo vo) throws Exception;
	
	public List<Survey> selectImgList(SurveyVo vo) throws Exception;
	
	public int insertSurveyRecord(Survey dto) throws Exception;
	public int getTotalScore(SurveyVo vo) throws Exception;
	public int getsrSeq(SurveyVo vo) throws Exception;
	public int totalScoreUpdt(Survey dto) throws Exception;
	public int srSeqUpdt(Survey dto) throws Exception;
	public int insertSurveySelected(Survey dto) throws Exception;
	
	public int selectSurveyCommentCount(SurveyVo vo) throws Exception;
	public int CommentInst(Survey dto) throws Exception;
	public int CommentVele(Survey dto) throws Exception;
	public int CommentUpdt(Survey dto) throws Exception;
	public Survey selectOne(SurveyVo vo) throws Exception;
	public List<Survey> getQuestionListForSurvey(SurveyVo vo) throws Exception;
	public List<Survey> getChoiceListForSurvey(SurveyVo vo) throws Exception;
	public List<Survey> getResultListForSurvey(SurveyVo vo) throws Exception;
	
	public Survey selectCurrentRecord(SurveyVo vo) throws Exception;
	
//	public int insert (Survey dto) throws Exception;
	public int insertSurveyName(Survey dto) throws Exception;
	public int insertSurveyQuestion(Survey dto) throws Exception;
	public int insertChoice(Survey dto) throws Exception;
	public int insertResult(Survey dto) throws Exception;
	
	public void uploadFiles(MultipartFile[] multipartFiles, Survey dto, String tableName, int type, int maxNumber) throws Exception;
	
}
