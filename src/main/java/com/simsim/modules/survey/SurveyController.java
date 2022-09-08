package com.simsim.modules.survey;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping(value="/SurveyBanner")
	public String SurveyBanner(SurveyVo vo,Model model) throws Exception {
		Survey result = service.selectOne(vo);
		model.addAttribute("item",result);
		return "user/main";
	}

		
}
