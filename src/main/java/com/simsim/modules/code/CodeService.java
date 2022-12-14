package com.simsim.modules.code;

import java.util.List;


public interface CodeService {

	public List<Code> selectList(CodeVo vo) throws Exception; 
	public int selectOneCount(CodeVo vo) throws Exception;
	public Code selectOne(CodeVo vo) throws Exception;
	public int insert(Code dto) throws Exception;
	public int update(Code dto) throws Exception;
	public int velete(Code dto) throws Exception;
	public int delete(CodeVo vo) throws Exception;
	public int selectOneCodeCheck(Code dto) throws Exception;
	
}
