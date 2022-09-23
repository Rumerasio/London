package com.simsim.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CodeGroupServiceImpl implements CodeGroupService {
	
	@Autowired
	CodeGroupDao dao;
	
	@Override
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception {
		
		List<CodeGroup> list = dao.selectList(vo);
		return list;
	}

	
//	@Override
//	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception {
//		List<CodeGroup> list = dao.selectList(vo);
//		return list;
//	}
	
	@Override
	public int selectOneCodeCheck(CodeGroup dto) throws Exception {
		int result = dao.selectOneCodeCheck(dto);
		return result;
	}
	
	@Override
	public int selectOneCodeAnotherCheck(CodeGroup dto) throws Exception {
		return dao.selectOneCodeAnotherCheck(dto);
	}
	
	@Override
	public int insert(CodeGroup dto) throws Exception {
		int result = dao.insert(dto);
		System.out.println("service result: "+ result);
		return result;
	}


	@Override
	public List<CodeGroup> selectList() throws Exception {
		List<CodeGroup> list = dao.selectList();
		return list;
	}
	
	@Override
	public List<CodeGroup> selectListSm(CodeGroupVo vo) throws Exception {
		List<CodeGroup> list = dao.selectListSm(vo);
		return list;
	}


	@Override
	public CodeGroup selectOne(CodeGroupVo vo) throws Exception {
		CodeGroup result = dao.selectOne(vo);
		return result;
	}
	
	@Override
	public int selectOneCount(CodeGroupVo vo) throws Exception {
		int result = dao.selectOneCount(vo);
		return result;
	}


	@Override
	public int update(CodeGroup dto) throws Exception {

		return dao.update(dto);
	}


	@Override
	public int velete(CodeGroup dto) throws Exception {
		return dao.velete(dto);
	}


	@Override
	public int delete(CodeGroupVo vo) throws Exception {
		return dao.delete(vo);
	}


}
