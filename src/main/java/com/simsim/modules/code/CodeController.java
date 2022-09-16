package com.simsim.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.simsim.modules.codegroup.CodeGroup;
import com.simsim.modules.codegroup.CodeGroupServiceImpl;

@Controller
@RequestMapping(value ="/code/")
public class CodeController {

	@Autowired
	CodeServiceImpl service;
	
	@Autowired
	CodeGroupServiceImpl codeGroupService;

	@RequestMapping(value = "AdminCodeList")
	public String codeList(Model model, @ModelAttribute("vo") CodeVo vo) throws Exception {

		vo.setParamsPaging(service.selectOneCount(vo));
		
		List<Code> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "commoncode/code/SimsimAdminCode";
	}
	
	@RequestMapping(value = "codeForm")
	public String codeGroupForm(Model model) throws Exception {
		
		List<CodeGroup> list1 = codeGroupService.selectList();
		model.addAttribute("list1",list1);
		return "commoncode/code/SimsimAdminCodeReg";
	}
	
//	@RequestMapping(value = "codeForm")
//	public String codeFrom() throws Exception {
//		
//		return "commoncode/code/SimsimAdminCodeReg";
//	}
	
	@RequestMapping(value="codeInst")
	public String codeInst(Code dto) throws Exception {
		int result = service.insert(dto);
		System.out.println("Controller result: "+result);
		return "redirect:/code/AdminCodeList";
	}
	
}
