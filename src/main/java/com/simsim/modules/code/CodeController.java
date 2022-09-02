package com.simsim.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value ="/simsim/")
public class CodeController {

	@Autowired
	CodeServiceImpl service;
	

	@RequestMapping(value = "AdminCode")
	public String codeList(Model model) throws Exception {

		List<Code> list = service.selectList();
		model.addAttribute("list", list);
		
		return "commoncode/code/SimsimAdminCode";
	}
}
