package com.simsim.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping (value="/codeGroup/")
public class CodeGroupController {
	@Autowired
	CodeGroupServiceImpl service;
	

	@RequestMapping(value = "AdminCodegroupList")
	public String codeGroupList(Model model, CodeGroupVo vo) throws Exception {
		
		System.out.println("vo.getShdelNy(): "+vo.getShdelNy());
		System.out.println("vo.getShValue(): "+vo.getShValue());
		System.out.println("vo.getShOption(): "+vo.getShOption());
		

		List<CodeGroup> list = service.selectList(vo);
		model.addAttribute("list", list); //("jsp에서 쓸 객체이름",현재 여기서 집어넣을 객체이름)
		
		return "commoncode/codegroup/SimsimAdminCodegroup";
	}
}
