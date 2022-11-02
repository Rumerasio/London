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
	
	public List<Survey> selectList(SurveyVo vo){
		return sqlSession.selectList(namespace + ".selectList", vo);
	}
	public int getListNum(SurveyVo vo) {return sqlSession.selectOne(namespace+".getListNum", vo);}
	public List<Survey> selectSurveyCommentList(SurveyVo vo){return sqlSession.selectList(namespace+".selectSurveyCommentList",vo);}
	public List<Survey> selectSurveyContentQuestion(SurveyVo vo) {return sqlSession.selectList(namespace+".selectSurveyContentQuestion",vo);}
	public List<Survey> selectSurveyContentChoice(SurveyVo vo) {return sqlSession.selectList(namespace+".selectSurveyContentChoice",vo);}
	public List<Survey> selectResultList(SurveyVo vo) {return sqlSession.selectList(namespace+".selectResultList", vo);}
	public List<Survey> selectCommentList(SurveyVo vo) {return sqlSession.selectList(namespace+".selectCommentList", vo);}
	public int getCommentNum(SurveyVo vo) {return sqlSession.selectOne(namespace+".getCommentNum", vo);}
	
	public List<Survey> selectImgList() {return sqlSession.selectList(namespace+".selectImgList", "");}
	
	public int insertSurveyRecord(Survey dto) {return sqlSession.insert(namespace+".insertSurveyRecord", dto);}
	public int getTotalScore(SurveyVo vo) {return sqlSession.selectOne(namespace+".getTotalScore",vo);}
	public int getsrSeq(SurveyVo vo) {return sqlSession.selectOne(namespace+".getsrSeq", vo);}
	public int totalScoreUpdt(Survey dto) {return sqlSession.update(namespace+".totalScoreUpdt", dto);}
	public int srSeqUpdt(Survey dto) {return sqlSession.update(namespace+".srSeqUpdt", dto);}
	public int insertSurveySelected(Survey dto) {return sqlSession.insert(namespace+".insertSurveySelected", dto);}
	
	public int selectSurveyCommentCount(SurveyVo vo) {return sqlSession.selectOne(namespace+".selectSurveyCommentCount", vo);}
	public int CommentInst(Survey dto) {return sqlSession.insert(namespace+".CommentInst", dto);}
	public int CommentVele(Survey dto) {return sqlSession.update(namespace+".CommentVele", dto);}
	public int CommentUpdt(Survey dto) {return sqlSession.update(namespace+".CommentUpdt", dto);}
	public Survey selectOne(SurveyVo vo){
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}
	public Survey selectCurrentRecord(SurveyVo vo) {return sqlSession.selectOne(namespace+".selectCurrentRecord", vo);}
	public List<Survey> selectMyComment(Survey dto){return sqlSession.selectList(namespace+".selectMyComment", dto);}
	
	public List<Survey> selectUserRecord(Survey dto){return sqlSession.selectList(namespace+".selectUserRecord", dto );}
	public List<Survey> selectContentRecordList(SurveyVo vo) {return sqlSession.selectList(namespace+".selectContentRecordList", vo);}
	
	public int selectContentRecordCount(SurveyVo vo) { return sqlSession.selectOne(namespace+".selectContentRecordCount", vo);}
	
	public int insertSurveyName(Survey dto) { return sqlSession.insert(namespace+".insertSurveyName",dto);}
	public int insertSurveyQuestion(Survey dto) { return sqlSession.insert(namespace+".insertSurveyQuestion",dto);}
	public int insertChoice(Survey dto) { return sqlSession.insert(namespace+".insertChoice",dto);}
	public int insertResult(Survey dto) { return sqlSession.insert(namespace+".insertResult",dto);}
	
	public int insertUploaded(Survey dto) { return sqlSession.insert("Base" + ".insertUploaded", dto); }
}
