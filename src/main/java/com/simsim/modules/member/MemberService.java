package com.simsim.modules.member;

import java.util.List;

public interface MemberService {
	
	public List<Member> selectList(MemberVo vo) throws Exception;
	public List<Member> selectFavorite(Member dto) throws Exception;
	public List<Member> getIdList() throws Exception;
	public int selectOneCount(MemberVo vo) throws Exception; 
	public Member selectOne(MemberVo vo) throws Exception;
	public Member selectId(Member dto) throws Exception;
	public Member selectPassword(Member dto) throws Exception;
	public int selectOneIdCheck(Member dto) throws Exception;
	public int selectOneEmailCheck(Member dto) throws Exception;
	public int changePassword(Member dto) throws Exception;
	public Member selectOneId(Member dto) throws Exception;
	public Member selectOneLogin(Member dto) throws Exception;
	public int insert(Member dto) throws Exception;
	public int update(Member dto) throws Exception;
	public int velete(Member dto) throws Exception;
	public int delete(MemberVo vo) throws Exception;
	
	
	
}	
