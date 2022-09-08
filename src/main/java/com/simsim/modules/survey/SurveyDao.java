package com.simsim.modules.survey;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyDao {

	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.simsim.modules.survey.SurveyMapper";
	
	public List<Survey> selectList(){
		return sqlSession.selectList(namespace + ".selectList","");
	}
	
	
	public Survey selectOne(SurveyVo vo){
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}
}
