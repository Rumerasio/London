package com.simsim.modules.survey;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simsim.modules.member.Member;
import com.simsim.modules.member.MemberServiceImpl;
import com.simsim.modules.member.MemberVo;

@Controller
@RequestMapping
public class SurveyController {
	
	@Autowired
	SurveyServiceImpl service;
	
	@Autowired
	MemberServiceImpl service2;
	
	@RequestMapping(value="/start")
	public String start() throws Exception{
		
		return "user/Start";
	}
	
	
	@RequestMapping(value="/")
	public String Survey(Model model,SurveyVo vo,MemberVo vo2, HttpSession httpSession) throws Exception {
		String rtSeq = (String) httpSession.getAttribute("sessSeq");
		vo2.setSeq(rtSeq);
		Member result = service2.selectOne(vo2);
		model.addAttribute("item", result);
		List<Survey> list = service.selectList(vo);
		model.addAttribute("list",list);
		List<Survey> list2 = service.selectImgList(vo);
		model.addAttribute("list2",list2);
		
		return "user/main";
	}
	
	@RequestMapping(value="/zdminMain")
	public String zdminMain(MemberVo vo,SurveyVo vo2,HttpSession httpSession, Model model) throws Exception{
		String rtSeq = (String) httpSession.getAttribute("sessSeq");
		vo.setSeq(rtSeq);
		int result1 = service.getSurveyNum(vo2);
		int result2 = service.getTodayNewComment(vo2);
		int result3 = service2.getTodayNewMember(vo);
		System.out.println("------");
		System.out.println(result3);
		model.addAttribute("num", result1);
		model.addAttribute("newCmt", result2);
		model.addAttribute("newMbr", result3);
		
		return "zdmin/zdminMain";
	}
	
	@RequestMapping(value="/content/contentViewMod")
	public String contentViewMod(@ModelAttribute("vo") SurveyVo vo,Model model) throws Exception {
		Survey result = service.selectOne(vo);
		model.addAttribute("item",result);
		List<Survey> result2= service.getQuestionListForSurvey(vo);
		model.addAttribute("list", result2);
		List<Survey> result3= service.getChoiceListForSurvey(vo);
		model.addAttribute("list2", result3);
		List<Survey> result4= service.getResultListForSurvey(vo);
		model.addAttribute("list3", result4);
		List<Survey> result5 = service.selectImgList(vo);
		model.addAttribute("imgList",result5);
		
		return "zdmin/content/ContentViewMod";
	}

	@RequestMapping(value="/content/contentList")
	public String SurveyList(Model model,@ModelAttribute("vo") SurveyVo vo) throws Exception{
		
		vo.setParamsPaging(service.getListNum(vo));
		
		List<Survey> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		List<Survey> list2 = service.selectImgList(vo);
		model.addAttribute("list2",list2);
		
		return "zdmin/content/ContentList";
	}
	
	@RequestMapping(value = "/content/contentReg")
	public String contentReg() throws Exception {
		
		return "zdmin/content/ContentReg";
	}
	
	@RequestMapping(value="/content/contentRecord")
	public String contentRecord(Model model, @ModelAttribute("vo") SurveyVo vo) throws Exception {
		
		vo.setShValue(vo.getShValue() == null ? "" : vo.getShValue());
		
		vo.setParamsPaging(service.selectContentRecordCount(vo));
		System.out.println(vo.getRowNumToShow());
		System.out.println(vo.getStartRnumForMysql());
		
		List<Survey> list = service.selectContentRecordList(vo);
		model.addAttribute("list",list);
		
		return "zdmin/content/ContentRecord";
	}
	
	@RequestMapping(value="/content/contentInst")
	public String contentInst(SurveyVo vo,Survey dto, RedirectAttributes redirectAttributes) throws Exception {
		service.insertSurveyName(dto);
		dto.setSnSeq(dto.getSnSeq());
		int y=0;
		int z=0;
		for(int i=0; i<dto.getQuestionGroup().length; i++) {
			dto.setQuestion(dto.getQuestionGroup()[i]);
			dto.setQuestionContent(dto.getQuestionContentGroup()[i]);
			service.insertSurveyQuestion(dto);
			
			dto.setSqSeq(dto.getSqSeq());
			z += dto.getChoiceNumPerQuestion()[i];
			for(int j=y; j<z; j++) {
				System.out.println("index 값: "+j);
				dto.setChoice(dto.getChoiceGroup()[j]);
				dto.setChoiceContent(dto.getChoiceContentGroup()[j]);
				dto.setChoiceScore(dto.getChoiceScoreGroup()[j]);
				service.insertChoice(dto);
			}
			y +=dto.getChoiceNumPerQuestion()[i];
		}
		
		for(int i =0;i<dto.getResultNumGroup().length;i++) {
			dto.setResultNum(dto.getResultNumGroup()[i]);
			dto.setResultTitle(dto.getResultTitleGroup()[i]);
			dto.setResultContent(dto.getResultContentGroup()[i]);
			dto.setScoreRangeStart(dto.getScoreRangeStartGroup()[i]);
			dto.setScoreRangeEnd(dto.getScoreRangeEndGroup()[i]);
			dto.setRelation1(dto.getRelation1Group()[i]);
			dto.setRelation2(dto.getRelation2Group()[i]);
			service.insertResult(dto);
		}
		
		return "redirect:/content/contentList";
	}
	
	//유저 인터페이스 S
	@RequestMapping(value="/myPage/surveyRecord")
	public String surveyRecord(@ModelAttribute("vo") SurveyVo vo , Model model, HttpSession httpSession) throws Exception {
		String rtSeq = (String) httpSession.getAttribute("sessSeq");
		vo.setSeq(rtSeq);
		vo.setParamsPaging(service.countUserRecord(vo));
		
		List<Survey> list = service.selectUserRecord(vo);
		model.addAttribute("list",list);
		
		return "user/member/UserSurveyRecord";
	}
	
	@RequestMapping(value="/myPage/myComment")
	public String myComment(Survey dto, @ModelAttribute("vo") SurveyVo vo, Model model, HttpSession httpSession) throws Exception{
		String rtSeq = (String) httpSession.getAttribute("sessSeq");
		vo.setSeq(rtSeq);
		vo.setParamsPaging(service.countMyComment(vo));
		
		List<Survey> list = service.selectMyComment(vo);
		model.addAttribute("list",list);
		
		return "user/member/UserComment";
	}
	
	@RequestMapping(value="/survey/content")
	public String surveyContent(@ModelAttribute("vo") SurveyVo vo,Model model) throws Exception {
		Survey result = service.selectOne(vo);
		model.addAttribute("item", result);
		vo.setSnSeq(vo.getSnSeq());
		
		List<Survey> list = service.selectSurveyContentQuestion(vo);
		model.addAttribute("list", list);
		
		vo.setSqSeq(vo.getSqSeq());
		System.out.println(vo.getSqSeq());
		
		List<Survey> list2 = service.selectSurveyContentChoice(vo);
		model.addAttribute("list2", list2);
		
		List<Survey> list3 = service.selectImgList(vo);
		model.addAttribute("list3",list3);
		
		return "user/Survey/SurveyContent";
	}
	
	@RequestMapping(value="/survey/surveyChoosedInst")
	public String surveyChoosedInst(Survey dto,@ModelAttribute("vo") SurveyVo vo, Model model) throws Exception {
		service.insertSurveyRecord(dto);
		System.out.println(dto.getSrcSeq());
		
		vo.setSrcSeq(dto.getSrcSeq());
		System.out.println(vo.getSrcSeq());
		
		for(int i=0; i<dto.getSsQuestionGroup().length; i++) {
			dto.setSrcSeq(dto.getSrcSeq());
			dto.setSsQuestion(dto.getSsQuestionGroup()[i]);
			dto.setSsChoosed(dto.getSsChoosedGroup()[i]);
			service.insertSurveySelected(dto);
		}
		int value = service.getTotalScore(vo);
		dto.setTotalScore(value);
		service.totalScoreUpdt(dto);
		
		int value2 = service.getsrSeq(vo);
		System.out.println(value2);
		dto.setSrSeq(Integer.toString(value2));
		System.out.println(dto.getSrSeq());
		
		service.srSeqUpdt(dto);
		
		Survey result2 = service.selectCurrentRecord(vo);
		model.addAttribute("item",result2);
		
		List<Survey> result = service.selectResultList(vo);
		model.addAttribute("list", result);
		
		List<Survey> list2 = service.selectImgList(vo);
		model.addAttribute("list2",list2);
		
		Survey result3 = service.selectOne(vo);
		model.addAttribute("item2", result3);
		
		return "user/Survey/SurveyResult";
	}
	
	
	//유저 인터페이스 E
	
	@RequestMapping(value="/survey")
	public String survey(@ModelAttribute("vo") SurveyVo vo, MemberVo vo2,Model model, HttpSession httpSession) throws Exception {
		
		String rtSeq = (String) httpSession.getAttribute("sessSeq");
		vo2.setSeq(rtSeq);
		vo.setSnSeq(vo.getSnSeq());
		
		Member result = service2.selectOne(vo2);
		model.addAttribute("item2", result);
		
		Survey result2 = service.selectOne(vo);
		model.addAttribute("item", result2);
		
		List<Survey> list2 = service.selectImgList(vo);
		model.addAttribute("list2",list2);
		
		List<Survey> result3 = service.selectSurveyCommentList(vo);
		model.addAttribute("list", result3);
		
		int result4 = service.selectSurveyCommentCount(vo);
		model.addAttribute("Num", result4);
		
		
		return "user/Survey/Survey";
	}
	
	@RequestMapping(value="/survey/commentInst")
	public String commentInst(@ModelAttribute("vo") SurveyVo vo,Survey dto, RedirectAttributes redirectAttributes) throws Exception {
		service.CommentInst(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		vo.setSeq(dto.getSeq());
		vo.setSnSeq(dto.getSnSeq());
		
		return "redirect:/survey";
	}
	
	@ResponseBody
	@RequestMapping(value="/survey/commentVele")
	public Map<String, Object> commentVele(@ModelAttribute("vo") SurveyVo vo,Survey dto,Model model,RedirectAttributes redirectAttributes) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		service.CommentVele(dto);
		
		vo.setSnSeq(dto.getSnSeq());
		
		int result = service.selectSurveyCommentCount(vo);
		returnMap.put("Num", result);
		
		List<Survey> list = service.selectSurveyCommentList(vo);
		model.addAttribute("list", list);
		
		vo.setScSeq(dto.getScSeq());
		vo.setSeq(dto.getSeq());
		
		returnMap.put("rt","success");
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value="/survey/commentUpdt")
	public Map<String, Object> commentUpdt(@ModelAttribute("vo") SurveyVo vo,Survey dto,Model model,RedirectAttributes redirectAttributes) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		service.CommentUpdt(dto);
		
		vo.setSnSeq(dto.getSnSeq());
		
		int result = service.selectSurveyCommentCount(vo);
		returnMap.put("Num", result);
		
		vo.setScSeq(dto.getScSeq());
		vo.setSeq(dto.getSeq());
		
		returnMap.put("rt","success");
		
		return returnMap;
	}
	
//	@RequestMapping(value="/surveyCommentList")
//	public String surveyCommentList(@ModelAttribute SurveyVo vo, Model model) throws Exception {
//		List<Survey> result = service.selectSurveyCommentList(vo);
//		model.addAttribute("list", result);
//		return "user/Survey/Survey";
//	}
}
