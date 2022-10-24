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

@Controller
@RequestMapping
public class SurveyController {
	
	@Autowired
	SurveyServiceImpl service;
	
	@RequestMapping(value="/start")
	public String start() throws Exception{
		
		return "user/Start";
	}
	
	
	@RequestMapping(value="/")
	public String Survey(Model model) throws Exception {
		
		List<Survey> list = service.selectList();
		model.addAttribute("list",list);
		
		return "user/main";
	}
	
	@RequestMapping(value="/zdminMain")
	public String zdminMain() throws Exception{
		
		return "zdmin/zdminMain";
	}
	
	@RequestMapping(value="/zdminLogin")
	public String zdminLogin() throws Exception{
		
		return "zdmin/zdminLogin";
	}
	
	@RequestMapping(value="/content/contentViewMod")
	public String contentViewMod(SurveyVo vo,Model model) throws Exception {
		Survey result = service.selectOne(vo);
		model.addAttribute("item",result);
		return "zdmin/content/ContentViewMod";
	}

	@RequestMapping(value="/content/contentList")
	public String SurveyList(Model model) throws Exception{
		List<Survey> list = service.selectList();
		model.addAttribute("list", list);
		
		return "zdmin/content/ContentList";
	}
	
	@RequestMapping(value = "/content/contentReg")
	public String contentReg() throws Exception {
		
		return "zdmin/content/ContentReg";
	}
	
	@RequestMapping(value="/content/contentRecord")
	public String contentRecord(Model model) throws Exception {
		List<Survey> list = service.selectContentRecordList();
		model.addAttribute("list",list);
		
		return "zdmin/content/ContentRecord";
	}
	
	@RequestMapping(value="/content/contentInst")
	public String contentInst(@ModelAttribute("vo") SurveyVo vo,Survey dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.insertSurveyName(dto);
		dto.setSnSeq(dto.getSnSeq());
		System.out.println("dto.SnSeq:"+dto.getSnSeq());
		int y=0;
		int z=0;
		for(int i=0; i<dto.getQuestionGroup().length; i++) {
			dto.setQuestion(dto.getQuestionGroup()[i]);
			System.out.println("문제 question 값: "+dto.getQuestion());
			dto.setQuestionContent(dto.getQuestionContentGroup()[i]);
			service.insertSurveyQuestion(dto);
			
			dto.setSqSeq(dto.getSqSeq());
			System.out.println("sqSeq 값: "+dto.getSqSeq());
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
		
		for(int i =0;i<3;i++) {
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
	public String surveyRecord(Survey dto, Model model, HttpSession httpSession) throws Exception {
		String rtSeq = (String) httpSession.getAttribute("sessSeq");
		dto.setSeq(rtSeq);
		
		List<Survey> list = service.selectUserRecord(dto);
		model.addAttribute("list",list);
		
		return "user/member/UserSurveyRecord";
	}
	
	@RequestMapping(value="/myPage/myComment")
	public String myComment(Survey dto, Model model, HttpSession httpSession) throws Exception{
		String rtSeq = (String) httpSession.getAttribute("sessSeq");
		dto.setSeq(rtSeq);
		List<Survey> list = service.selectMyComment(dto);
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
		
		return "user/Survey/SurveyResult";
	}
	
	
	//유저 인터페이스 E
	
	@RequestMapping(value="/survey")
	public String survey(@ModelAttribute("vo") SurveyVo vo, Model model, HttpSession httpSession) throws Exception {
		
		Survey result = service.selectOne(vo);
		model.addAttribute("item", result);
		
		List<Survey> result2 = service.selectSurveyCommentList(vo);
		model.addAttribute("list", result2);
		
		int result3 = service.selectSurveyCommentCount(vo);
		model.addAttribute("Num", result3);
		
		
		return "user/Survey/Survey";
	}
	
	@RequestMapping(value="/survey/commentInst")
	public String commentInst(@ModelAttribute("vo") SurveyVo vo,Survey dto, RedirectAttributes redirectAttributes) throws Exception {
		service.CommentInst(dto);
		
		vo.setSeq(dto.getSeq());
		vo.setSnSeq(dto.getSnSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/survey";
	}
	
	@ResponseBody
	@RequestMapping(value="/survey/commentVele")
	public Map<String, Object> commentVele(@ModelAttribute("vo") SurveyVo vo,Survey dto,Model model,RedirectAttributes redirectAttributes) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		service.CommentVele(dto);
		
		
		int result3 = service.selectSurveyCommentCount(vo);
		model.addAttribute("Num", result3);
		
		vo.setScSeq(dto.getScSeq());
		vo.setSeq(dto.getSeq());
		vo.setSnSeq(dto.getSnSeq());
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
