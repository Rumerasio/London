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
	public List<Survey> selectUserRecord(Survey dto) throws Exception {
		List<Survey> list = dao.selectUserRecord(dto);
		return list;
	}
	
	@Override
	public List<Survey> selectMyComment(Survey dto) throws Exception {
		List<Survey> list = dao.selectMyComment(dto);
		return list;
	}
	
	@Override
	public Survey selectOne(SurveyVo vo) throws Exception {
		Survey result = dao.selectOne(vo);
		return result;
	}

//	@Override
//	public int insert(Survey dto) throws Exception {
//		dao.insertSurveyName(dto);
//		
//		//질문, 선택지
////		var questionContent = document.getElementsByName('questionConetent')[0].className;
//		if(dto.getQuestionContent() != null ) {
//			for(int i=0;i<=5;i++) {
//				dao.insertSurveyQuestion(dto);
//				for(int j=0;j<=6;j++) {
//					dao.insertQuestionChoice(dto);
//				}
//			}
//		}
//		//결과
////		for(int i =0;i<=3;i++) {
////			dao.insertSurveyResult(dto);
////		}
//		return dao.insertSurveyName(dto);
//	}

	@Override
	public int insertSurveyName(Survey dto) throws Exception { return dao.insertSurveyName(dto);}

	@Override
	public int insertSurveyQuestion(Survey dto) throws Exception { return dao.insertSurveyQuestion(dto);}

	@Override
	public int insertQuestionChoice(Survey dto) throws Exception { return dao.insertQuestionChoice(dto);}

	@Override
	public int insertSurveyResult(Survey dto) throws Exception { return dao.insertSurveyResult(dto);}
	

}
