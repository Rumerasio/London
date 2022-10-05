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
	public List<Survey> selectSurveyCommentList(SurveyVo vo){return sqlSession.selectList(namespace+".selectSurveyCommentList",vo);}
	public int selectSurveyCommentCount(SurveyVo vo) {return sqlSession.selectOne(namespace+".selectSurveyCommentCount", vo);}
	public int CommentInst(Survey dto) {return sqlSession.insert(namespace+".CommentInst", dto);}
	public int CommentVele(Survey dto) {return sqlSession.update(namespace=".CommentVele",dto);}
	public int CommentUpdt(Survey dto) {return sqlSession.update(namespace+".CommentUpdt", dto);}
	public Survey selectOne(SurveyVo vo){
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}
	public List<Survey> selectMyComment(Survey dto){return sqlSession.selectList(namespace+".selectMyComment", dto);}
	
	public List<Survey> selectUserRecord(Survey dto){return sqlSession.selectList(namespace+".selectUserRecord", dto );}
	
	public int insertSurveyName(Survey dto) { return sqlSession.insert(namespace+".insertSurveyName",dto);}
	public int insertSurveyQuestion(Survey dto) { return sqlSession.insert(namespace+".insertSurveyQuestion",dto);}
	public int insertQuestionChoice(Survey dto) { return sqlSession.insert(namespace+".insertQuestionChoice",dto);}
	public int insertSurveyResult(Survey dto) { return sqlSession.insert(namespace+".insertSurveyResult",dto);}
	
	
}
