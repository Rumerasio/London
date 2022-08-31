package com.simsim.modules.codegroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeGroupDao {
	
	@Inject	//new 
	@Resource(name = "sqlSession")	//이름
	private SqlSession sqlSession;	//root-context.xml에 생성해놨음
	
	private static String namespace = "com.simsim.modules.codegroup.CodeGroupMapper";
	
	public List<CodeGroup> selectList(){ return sqlSession.selectList(namespace + ".selectList", ""); }
	
}
