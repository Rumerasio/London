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
	
	private static String namespace = "com.simsim.modules.codegroup.CodeGroupMapper";
	
	public List<CodeGroup> selectList(CodeGroupVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	//List Array에 <이 객체를> 넣겠다
	
//	public List<CodeGroup> selectList(CodeGroupVo vo) {
//		List<CodeGroup> list = sqlSession.selectList("com.simsim.modules.codegroup.CodeGroupMapper.selectList",vo); 
//		return list;
//	}
	
	public List<CodeGroup> selectList() {
		List<CodeGroup> list = sqlSession.selectList(namespace+".selectList","");
		return list; 
			
	}
	
	public int insert(CodeGroup dto) {
		int result= sqlSession.insert(namespace+".insert", dto);
		System.out.println("dao result: "+ result);
		return result;
	}
	
}
