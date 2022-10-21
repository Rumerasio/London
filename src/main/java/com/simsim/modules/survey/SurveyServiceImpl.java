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
	public List<Survey> selectSurveyCommentList(SurveyVo vo) throws Exception {
		List<Survey> list = dao.selectSurveyCommentList(vo);
		return list;
	}
	
	@Override
	public int selectSurveyCommentCount(SurveyVo vo) throws Exception {
		return dao.selectSurveyCommentCount(vo);
	}
	
	@Override
	public int CommentInst(Survey dto) throws Exception {
		return dao.CommentInst(dto);
	}
	
	@Override
	public int CommentVele(Survey dto) throws Exception {
		return dao.CommentVele(dto);
	}
	
	@Override
	public int CommentUpdt(Survey dto) throws Exception {
		return dao.CommentUpdt(dto);
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
////		var questionContent = document.getElementsByName('questionContent')[0].className;
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
	public int insertChoice(Survey dto) throws Exception { return dao.insertChoice(dto);}

	@Override
	public int insertSurveyResult(Survey dto) throws Exception { return dao.insertSurveyResult(dto);}

	@Override
	public List<Survey> selectSurveyContentQuestion(SurveyVo vo) throws Exception {
		return dao.selectSurveyContentQuestion(vo);
	}

	@Override
	public List<Survey> selectSurveyContentChoice(SurveyVo vo) throws Exception {
		return dao.selectSurveyContentChoice(vo);
	}

	@Override
	public int insertSurveyRecord(Survey dto) throws Exception {
		return dao.insertSurveyRecord(dto);
	}

	@Override
	public int insertSurveySelected(Survey dto) throws Exception {
		return dao.insertSurveySelected(dto);
	}

	@Override
	public int getTotalScore(SurveyVo vo) throws Exception {
		return dao.getTotalScore(vo);
	}

	@Override
	public int totalScoreUpdt(Survey dto) throws Exception {
		return dao.totalScoreUpdt(dto);
	}

	@Override
	public int getsrSeq(SurveyVo vo) throws Exception {
		return dao.getsrSeq(vo);
	}

	@Override
	public int srSeqUpdt(Survey dto) throws Exception {
		return dao.srSeqUpdt(dto);
	}

	@Override
	public List<Survey> selectResultList(SurveyVo vo) throws Exception {
		return dao.selectResultList(vo);
	}

	@Override
	public Survey selectCurrentRecord(SurveyVo vo) throws Exception {
		return dao.selectCurrentRecord(vo);
	}

	


}
