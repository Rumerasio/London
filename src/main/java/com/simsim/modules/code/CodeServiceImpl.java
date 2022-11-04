package com.simsim.modules.code;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

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

	@PostConstruct
	public void selectListCachedCodeArrayList() throws Exception {
		List<Code> codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
//		codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
		Code.cachedCodeArrayList.clear(); 
		Code.cachedCodeArrayList.addAll(codeListFromDb);
		System.out.println("cachedCodeArrayList: " + Code.cachedCodeArrayList.size() + " chached !");
	}
	
	public static List<Code> selectListCachedCode(String seq) throws Exception {
		List<Code> rt = new ArrayList<Code>();
		for(Code codeRow : Code.cachedCodeArrayList) {
			if (codeRow.getCodeGroup_seq().equals(seq)) {
				rt.add(codeRow);
			} else {
				// by pass
			}
		}
		
		return rt;
	}
	
	public static String selectOneCachedCode(int code) throws Exception {
		String rt = "";
		for(Code codeRow : Code.cachedCodeArrayList) {
			if (codeRow.getCodeAnother().equals(Integer.toString(code))) {
				rt = codeRow.getCodeNameKor();
			} else {
				// by pass
			}
		}
		System.out.println("---------------------------");
		System.out.println("rt");
		System.out.println("---------------------------");
		return rt;
	}
	
	
	public static void clear() throws Exception {
		Code.cachedCodeArrayList.clear();
	}

	@Override
	public int selectOneCodeCheck(Code dto) throws Exception {
		int result = dao.selectOneCodeCheck(dto);
		return result;
	}
	
	
}
