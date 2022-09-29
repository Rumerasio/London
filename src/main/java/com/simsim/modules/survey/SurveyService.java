package com.simsim.modules.survey;

import java.util.List;

public interface SurveyService {

	public List<Survey> selectList() throws Exception;
	public List<Survey> selectUserRecord(Survey dto) throws Exception;
	public List<Survey> selectMyComment(Survey dto) throws Exception;
	
	
	public Survey selectOne(SurveyVo vo) throws Exception;
	
	public int insert (Survey dto) throws Exception;
//	public int insertSurveyName(Survey dto) throws Exception;
//	public int insertSurveyQuestion(Survey dto) throws Exception;
//	public int insertQuestionChoice(Survey dto) throws Exception;
//	public int insertSurveyResult(Survey dto) throws Exception;
	
}
