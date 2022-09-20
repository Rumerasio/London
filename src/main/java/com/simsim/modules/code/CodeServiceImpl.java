package com.simsim.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	CodeDao dao;
	
	@Override
	public List<Code> selectList(CodeVo vo) throws Exception {
		
		List<Code> list = dao.selectList(vo);
		return list;
	}

	@Override
	public int selectOneCount(CodeVo vo) throws Exception {
		int result=dao.selectOneCount(vo);
		return result;
	}

	@Override
	public Code selectOne(CodeVo vo) throws Exception {
		Code result = dao.selectOne(vo);
		return result;
	}
	
	@Override
	public int insert(Code dto) throws Exception {
		int result= dao.insert(dto);
		return result;
	}

	@Override
	public int update(Code dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int velete(Code dto) throws Exception {
		return dao.velete(dto);
	}

	@Override
	public int delete(CodeVo vo) throws Exception {
		return dao.delete(vo);
	}
	
	
}
