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
	
	public List<Member> selectFavorite(Member dto){ return sqlSession.selectList(namespace +".selectFavorite", dto);}
	
	public List<Member> getIdList() {return sqlSession.selectList(namespace+".getIdList","");}
	
	public Member selectOne(MemberVo vo) {return sqlSession.selectOne(namespace+".selectOne", vo);}
	
	public int selectOneIdCheck(Member dto) {return sqlSession.selectOne(namespace+".selectOneIdCheck", dto);}
	public int selectOneEmailCheck(Member dto) {return sqlSession.selectOne(namespace+".selectOneEmailCheck", dto);}
	
	public Member selectId(MemberVo vo) {return sqlSession.selectOne(namespace+".selectId",vo);}
	
	public Member selectPassword(MemberVo vo) {return sqlSession.selectOne(namespace+".selectPassword", vo);}
	
	public Member getNickname(MemberVo vo) {return sqlSession.selectOne(namespace+".getNickname", vo);}
	
	public int changePassword(Member dto) {return sqlSession.update(namespace+".changePassword", dto);}
	
	public Member selectOneId(MemberVo vo) {return sqlSession.selectOne(namespace+".selectOneId", vo);}
	
	public Member selectOneLogin(MemberVo vo) {return sqlSession.selectOne(namespace+".selectOneLogin",vo);}
	
	public int selectOneCount(MemberVo vo) {return sqlSession.selectOne(namespace+".selectOneCount", vo);}
	
	public int insert(Member dto) {return sqlSession.insert(namespace+".insert", dto);}
	
	public int kakaoInst(Member dto) {return sqlSession.insert(namespace+".kakaoInst", dto);}
	
	public Member snsLoginCheck(Member dto) {return sqlSession.selectOne(namespace+".snsLoginCheck", dto);}
	
	public int update(Member dto) {return sqlSession.update(namespace+".update", dto);}
	
	public int velete(Member dto) {return sqlSession.update(namespace+".velete", dto);}
	
	public int delete(MemberVo vo) {return sqlSession.delete(namespace+".delete", vo);}
	
	public int getTodayNewMember(MemberVo vo) {return sqlSession.selectOne(namespace+".getTodayNewMember", vo);}
	public Member selectAdminId(MemberVo vo) {return sqlSession.selectOne(namespace+".selectAdminId", vo);}
	public Member selectAdminLogin(MemberVo vo) {return sqlSession.selectOne(namespace+".selectAdminLogin", vo);}
	
}
