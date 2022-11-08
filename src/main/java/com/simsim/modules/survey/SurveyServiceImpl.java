package com.simsim.modules.survey;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.simsim.base.BaseServiceImpl;
import com.simsim.common.constants.Constants;
import com.simsim.util.UtilDateTime;

@Service
public class SurveyServiceImpl extends BaseServiceImpl implements SurveyService {
	
	@Autowired
	SurveyDao dao;
	
	public void uploadFiles(MultipartFile[] multipartFiles, Survey dto, String tableName, int type, int maxNumber) throws Exception {
		
		for(int i=0; i<multipartFiles.length; i++) {
    	
			if(!multipartFiles[i].isEmpty()) {
				
				String className = dto.getClass().getSimpleName().toString().toLowerCase();		
				String fileName = multipartFiles[i].getOriginalFilename();
				String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
				String uuid = UUID.randomUUID().toString();
				String uuidFileName = uuid + "." + ext;
				String pathModule = className;
				String nowString = UtilDateTime.nowString();
				String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5,7) + "/" + nowString.substring(8,10); 
				String path = Constants.UPLOAD_PATH_PREFIX + "/" + pathModule + "/" + pathDate + "/";
				String pathForView = Constants.UPLOAD_PATH_PREFIX_FOR_VIEW + "/" + pathModule + "/" + pathDate + "/";
				
				File uploadPath = new File(path);
				
				if (!uploadPath.exists()) {
					uploadPath.mkdir();
				} else {
					// by pass
				}
				  
				multipartFiles[i].transferTo(new File(path + uuidFileName));
				
				dto.setPath(pathForView);
				dto.setOriginalName(fileName);
				dto.setUuidName(uuidFileName);
				dto.setExt(ext);
				dto.setSize(multipartFiles[i].getSize());
				
				dto.setTableName(tableName);
				dto.setType(type);
//				dto.setDefaultNy();
				dto.setSort(maxNumber + i);
				dto.setPseq(dto.getSnSeq());

				dao.insertUploaded(dto);
    		}
		}
	}
	
	@Override
	public int getListNum(SurveyVo vo) throws Exception {return dao.getListNum(vo);}
	
	@Override
	public List<Survey> selectList(SurveyVo vo) throws Exception {
		List<Survey> list = dao.selectList(vo);
		return list;
	}

	@Override
	public List<Survey> selectUserRecord(SurveyVo vo) throws Exception {
		List<Survey> list = dao.selectUserRecord(vo);
		return list;
	}
	
	@Override
	public List<Survey> selectMyComment(SurveyVo vo) throws Exception {
		return dao.selectMyComment(vo);
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
	public int insertSurveyName(Survey dto) throws Exception {
		
		dao.insertSurveyName(dto);
		
		uploadFiles(dto.getUploadImgCard(), dto, "Upload", 1, dto.getUploadImgCardMaxNumber());
		uploadFiles(dto.getUploadImgMain(), dto, "Upload", 2, dto.getUploadImgMainMaxNumber());
		uploadFiles(dto.getUploadImgQuestion(), dto, "Upload", 3, dto.getUploadImgQuestionMaxNumber());
		uploadFiles(dto.getUploadImgResult(), dto, "Upload", 4, dto.getUploadImgResultMaxNumber());
		
		return 1;
	}

	@Override
	public int insertSurveyQuestion(Survey dto) throws Exception { 
		
		dao.insertSurveyQuestion(dto);
		
		return 1;
	}

	@Override
	public int insertChoice(Survey dto) throws Exception { return dao.insertChoice(dto);}

	@Override
	public int insertResult(Survey dto) throws Exception {
		
		dao.insertResult(dto);
		
		return 1;
	}

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

	@Override
	public List<Survey> selectCommentList(SurveyVo vo) throws Exception {
		return dao.selectCommentList(vo);
	}

	@Override
	public List<Survey> selectContentRecordList(SurveyVo vo) throws Exception {
		return dao.selectContentRecordList(vo);
	}

	@Override
	public List<Survey> selectImgList() throws Exception {
		return dao.selectImgList();
	}

	@Override
	public int selectContentRecordCount(SurveyVo vo) throws Exception {
		return dao.selectContentRecordCount(vo);
	}

	@Override
	public int getCommentNum(SurveyVo vo) throws Exception {
		return dao.getCommentNum(vo);
	}

	@Override
	public int countMyComment(SurveyVo vo) throws Exception {return dao.countMyComment(vo);}

	@Override
	public int countUserRecord(SurveyVo vo) throws Exception {return dao.countUserRecord(vo);
	}


}
