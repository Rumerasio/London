package com.simsim.modules.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.simsim.modules.member.MemberMapper";
	
	public List<Member> selectList(MemberVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	
//	public List<Member> selectFavorite(Member dto){ return sqlSession.selectList(namespace +".selectFavorite", dto);}
	
	public Member selectOne(MemberVo vo) {return sqlSession.selectOne(namespace+".selectOne", vo);}
	
	public Member selectOneId(Member dto) {return sqlSession.selectOne(namespace+".selectOneId", dto);}
	
	public Member selectOneLogin(Member dto) {return sqlSession.selectOne(namespace+".selectOneLogin",dto);}
	
	public int selectOneCount(MemberVo vo) {return sqlSession.selectOne(namespace+".selectOneCount", vo);}
	
	public int insert(Member dto) {return sqlSession.insert(namespace+".insert", dto);}
	
	public int update(Member dto) {return sqlSession.update(namespace+".update", dto);}
	
	public int velete(Member dto) {return sqlSession.update(namespace+".velete", dto);}
	
	public int delete(MemberVo vo) {return sqlSession.delete(namespace+".delete", vo);}
	
}
