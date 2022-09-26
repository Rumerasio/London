package com.simsim.modules.survey;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping
public class SurveyController {
	
	@Autowired
	SurveyServiceImpl service;
	
	@RequestMapping(value="/")
	public String Survey(Model model) throws Exception {
		
		List<Survey> list = service.selectList();
		model.addAttribute("list",list);
		
		return "user/main";
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
	
	@RequestMapping(value="/content/contentInst")
	public String contentInst(Survey dto, RedirectAttributes redirectAttributes) throws Exception {
//		int result1 = service.insertSurveyName(dto);
//		int result2 = service.insertSurveyQuestion(dto);
//		int result3 = service.insertQuestionChoice(dto);
//		int result4 = service.insertSurveyResult(dto);
//		
//		System.out.println("result1: "+result1);
//		System.out.println("result2: "+result2);
//		System.out.println("result3: "+result3);
//		System.out.println("result4: "+result4);
		
		service.insert(dto);
		return "redirect:/content/contentList";
	}
		
}
