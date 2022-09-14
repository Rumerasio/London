package com.simsim.modules.codegroup;

import java.util.List;

public interface CodeGroupService {

	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception;
	public List<CodeGroup> selectList() throws Exception;
	public CodeGroup selectOne(CodeGroupVo vo) throws Exception;
	public int insert(CodeGroup dto) throws Exception;
	public int update(CodeGroup dto) throws Exception;
	public int velete(CodeGroup dto) throws Exception;
	public int delete(CodeGroupVo vo) throws Exception;
	
}
