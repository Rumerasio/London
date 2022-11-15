package com.simsim.modules.member;

import java.util.List;

public interface MemberService {
	
	public List<Member> selectList(MemberVo vo) throws Exception;
	public List<Member> selectFavorite(Member dto) throws Exception;
	public List<Member> getIdList() throws Exception;
	public int selectOneCount(MemberVo vo) throws Exception; 
	public Member selectOne(MemberVo vo) throws Exception;
	public Member selectId(MemberVo vo) throws Exception;
	public Member selectPassword(MemberVo vo) throws Exception;
	public Member getNickname(MemberVo vo) throws Exception;
	public int selectOneIdCheck(Member dto) throws Exception;
	public int selectOneEmailCheck(Member dto) throws Exception;
	public int changePassword(Member dto) throws Exception;
	public Member selectOneId(MemberVo vo) throws Exception;
	public Member selectOneLogin(MemberVo vo) throws Exception;
	public int insert(Member dto) throws Exception;
	public int kakaoInst(Member dto) throws Exception;
	public int naverInst(Member dto) throws Exception;
	public Member snsLoginCheck(Member dto) throws Exception;
	public int update(Member dto) throws Exception;
	public int velete(Member dto) throws Exception;
	public int delete(MemberVo vo) throws Exception;
	public Member selectAdminId(MemberVo vo) throws Exception;
	public Member selectAdminLogin(MemberVo vo) throws Exception;
	public int getTodayNewMember(MemberVo vo) throws Exception;
	
	
	
}	
