package com.simsim.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simsim.util.UtilSecurity;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public List<Member> selectFavorite(Member dto) throws Exception {
		return dao.selectFavorite(dto);
	}
	
	@Override
	public int selectOneCount(MemberVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		Member result = dao.selectOne(vo);
		return result;
	}

	@Override
	public Member selectId(MemberVo vo) throws Exception {
		return dao.selectId(vo);
	}
	
	@Override
	public Member selectPassword(MemberVo vo) throws Exception {
		return dao.selectPassword(vo);
	}

	@Override
	public int changePassword(Member dto) throws Exception {
		dto.setPassword(UtilSecurity.encryptSha256(dto.getPassword()));
		return dao.changePassword(dto);
	}
	
	@Override
	public int insert(Member dto) throws Exception {
		dto.setPassword(UtilSecurity.encryptSha256(dto.getPassword()));
    	
		return dao.insert(dto);
	}

	@Override
	public int update(Member dto) throws Exception {
		/* dto.setPassword(UtilSecurity.encryptSha256(dto.getPassword())); */ 
		return dao.update(dto);
	}

	@Override
	public int velete(Member dto) throws Exception {
		return dao.velete(dto);
	}

	@Override
	public int delete(MemberVo vo) throws Exception {
		return dao.delete(vo);
	}

	@Override
	public Member selectOneId(MemberVo vo) throws Exception {
		return dao.selectOneId(vo);
	}

	@Override
	public Member selectOneLogin(MemberVo vo) throws Exception {
		vo.setPassword(UtilSecurity.encryptSha256(vo.getPassword()));
		
		return dao.selectOneLogin(vo);
	}

	@Override
	public int selectOneIdCheck(Member dto) throws Exception {
		return dao.selectOneIdCheck(dto);
	}

	@Override
	public int selectOneEmailCheck(Member dto) throws Exception {
		return dao.selectOneEmailCheck(dto);
	}

	@Override
	public List<Member> getIdList() throws Exception {
		return dao.getIdList();
	}

	@Override
	public int kakaoInst(Member dto) throws Exception {return dao.kakaoInst(dto);}

	@Override
	public Member snsLoginCheck(Member dto) throws Exception {return dao.snsLoginCheck(dto);}

	@Override
	public Member getNickname(MemberVo vo) throws Exception {return dao.getNickname(vo);
	}

	@Override
	public Member selectAdminId(MemberVo vo) throws Exception {
		return dao.selectAdminId(vo);
	}

	@Override
	public Member selectAdminLogin(MemberVo vo) throws Exception {
		vo.setPassword(UtilSecurity.encryptSha256(vo.getPassword()));
		return dao.selectAdminLogin(vo);
	}

}
