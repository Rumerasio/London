package com.simsim.modules.survey;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface SurveyService {

	public List<Survey> selectList() throws Exception;
	public List<Survey> selectUserRecord(Survey dto) throws Exception;
	public List<Survey> selectMyComment(Survey dto) throws Exception;
	public List<Survey> selectSurveyCommentList(SurveyVo vo) throws Exception;
	public List<Survey> selectSurveyContentQuestion(SurveyVo vo) throws Exception;
	public List<Survey> selectSurveyContentChoice(SurveyVo vo) throws Exception;
	public List<Survey> selectResultList(SurveyVo vo) throws Exception;
	public List<Survey> selectCommentList() throws Exception;
	public List<Survey> selectContentRecordList(SurveyVo vo) throws Exception;
	
	public int selectContentRecordCount(SurveyVo vo) throws Exception;
	
	public List<Survey> selectImgList() throws Exception;
	
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
	public Survey selectCurrentRecord(SurveyVo vo) throws Exception;
	
//	public int insert (Survey dto) throws Exception;
	public int insertSurveyName(Survey dto) throws Exception;
	public int insertSurveyQuestion(Survey dto) throws Exception;
	public int insertChoice(Survey dto) throws Exception;
	public int insertResult(Survey dto) throws Exception;
	
	public void uploadFiles(MultipartFile[] multipartFiles, Survey dto, String tableName, int type, int maxNumber) throws Exception;
	
}
