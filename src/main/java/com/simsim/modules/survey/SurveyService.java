package com.simsim.modules.survey;

import java.util.List;

public interface SurveyService {

	public List<Survey> selectList() throws Exception;
	
	public Survey selectOne(SurveyVo vo) throws Exception;
	
}
