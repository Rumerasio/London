package com.simsim.modules.code;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.simsim.modules.code.CodeMapper";
	
	public List<Code> selectList(CodeVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	
	public int selectOneCount(CodeVo vo) {return sqlSession.selectOne(namespace+".selectOneCount", vo);}
	
	public Code selectOne(CodeVo vo) {return sqlSession.selectOne(namespace+".selectOne", vo);}
	
	public int insert(Code dto) {
		int result = sqlSession.insert(namespace+".insert", dto);
		return result;
	}
}
