package com.simsim.modules.code;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.simsim.modules.codegroup.CodeGroup;

@Repository
public class CodeDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.simsim.modules.code.CodeMapper";
	
	public List<Code> selectList(CodeVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	
	public int selectOneCount(CodeVo vo) {return sqlSession.selectOne(namespace+".selectOneCount", vo);}
	
	public Code selectOne(CodeVo vo) {return sqlSession.selectOne(namespace+".selectOne", vo);}
	
	public int insert(Code dto) { return sqlSession.insert(namespace+".insert", dto);}
	public int update(Code dto) {return sqlSession.update(namespace+".update", dto);}
	public int velete(Code dto) {return sqlSession.update(namespace+".velete", dto);}
	public int delete(CodeVo vo) {return sqlSession.delete(namespace+".delete", vo);}
	
	public int selectOneCodeCheck(Code dto) {return sqlSession.selectOne(namespace+".selectOneCodeCheck",dto); }
	
//	for cache
	public List<Code> selectListCachedCodeArrayList(){ return sqlSession.selectList(namespace + ".selectListCachedCodeArrayList", null); }
}
