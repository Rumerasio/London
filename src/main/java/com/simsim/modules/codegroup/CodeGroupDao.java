package com.simsim.modules.codegroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeGroupDao {

	@Inject
	@Resource(name = "sqlSession") //여러개의 DB가 연결될 경우를 위한 이름설정
	private SqlSession sqlSession;
	
	@Inject
	@Resource(name = "sqlSessionOracle") //여러개의 DB가 연결될 경우를 위한 이름설정
	private SqlSession sqlSessionOracle;
	
	private static String namespace = "com.simsim.modules.codegroup.CodeGroupMapper";
	
	
	public List<CodeGroup> selectList(CodeGroupVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	//List Array에 <이 객체를> 넣겠다
	
//	public List<CodeGroup> selectList(CodeGroupVo vo) {
//		List<CodeGroup> list = sqlSession.selectList("com.simsim.modules.codegroup.CodeGroupMapper.selectList",vo); 
//		return list;
//	}
	
	public List<CodeGroup> selectListSm(CodeGroupVo vo) {return sqlSession.selectList(namespace + ".selectListSm", vo);}
	
	public CodeGroup selectOne(CodeGroupVo vo) { return sqlSession.selectOne(namespace+ ".selectOne", vo);}
	
	public int selectOneCount(CodeGroupVo vo) { return sqlSession.selectOne(namespace+ ".selectOneCount", vo);}	
	
	public List<CodeGroup> selectList() {
		List<CodeGroup> list = sqlSession.selectList(namespace+".selectList","");
		return list; 
	}
	
	public int insert(CodeGroup dto) {
		int result= sqlSession.insert(namespace+".insert", dto);
		System.out.println("dao result: "+ result);
		return result;
	}
	
	public int update(CodeGroup dto) {return sqlSession.update(namespace + ".update",dto);}
	
	public int velete(CodeGroup dto) {return sqlSession.update(namespace + ".velete",dto);}
	
	public int delete(CodeGroupVo vo) {return sqlSession.delete(namespace + ".delete",vo);}

	public int selectOneCodeCheck(CodeGroup dto) {return sqlSession.selectOne(namespace+".selectOneCodeCheck",dto); }
	public int selectOneCodeAnotherCheck(CodeGroup dto) {return sqlSession.selectOne(namespace+".selectOneCodeAnotherCheck",dto); }
	
	
	//오라클!
//	public List<CodeGroup> selectList(CodeGroupVo vo){ return sqlSessionOracle.selectList(namespace + ".selectList", vo); }
//	
//	public List<CodeGroup> selectListSm(CodeGroupVo vo) {return sqlSessionOracle.selectList(namespace + ".selectListSm", vo);}
//	
//	public CodeGroup selectOne(CodeGroupVo vo) { return sqlSessionOracle.selectOne(namespace+ ".selectOne", vo);}
//	
//	public int selectOneCount(CodeGroupVo vo) { return sqlSessionOracle.selectOne(namespace+ ".selectOneCount", vo);}	
//	
//	public List<CodeGroup> selectList() {
//		List<CodeGroup> list = sqlSessionOracle.selectList(namespace+".selectList","");
//		return list; 
//	}
//	
//	public int insert(CodeGroup dto) {
//		int result= sqlSessionOracle.insert(namespace+".insert", dto);
//		System.out.println("dao result: "+ result);
//		return result;
//	}
//	
//	public int update(CodeGroup dto) {return sqlSessionOracle.update(namespace + ".update",dto);}
//	
//	public int velete(CodeGroup dto) {return sqlSessionOracle.update(namespace + ".velete",dto);}
//	
//	public int delete(CodeGroupVo vo) {return sqlSessionOracle.delete(namespace + ".delete",vo);}
//
//	public int selectOneCodeCheck(CodeGroup dto) {return sqlSessionOracle.selectOne(namespace+".selectOneCodeCheck",dto); }
//	public int selectOneCodeAnotherCheck(CodeGroup dto) {return sqlSessionOracle.selectOne(namespace+".selectOneCodeAnotherCheck",dto); }
	
}
