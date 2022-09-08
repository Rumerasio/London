package com.simsim.modules.survey;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	SurveyDao dao;
	
	@Override
	public List<Survey> selectList() throws Exception {
		List<Survey> list = dao.selectList();
		return list;
	}

	@Override
	public Survey selectOne(SurveyVo vo) throws Exception {
		Survey result = dao.selectOne(vo);
		return result;
	}

}
