package com.simsim.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping (value="/codeGroup/")
public class CodeGroupController {
	@Autowired
	CodeGroupServiceImpl service;
	

	@RequestMapping(value = "AdminCodegroupList")
	public String codeGroupList(Model model, @ModelAttribute("vo") CodeGroupVo vo) throws Exception {
		
		System.out.println("vo.getShdelNy(): "+vo.getShdelNy());
		System.out.println("vo.getShValue(): "+vo.getShValue());
		System.out.println("vo.getShOption(): "+vo.getShOption());
		

		List<CodeGroup> list = service.selectList(vo);
		model.addAttribute("list", list); //("jsp에서 쓸 객체이름",현재 여기서 집어넣을 객체이름)
		
		return "commoncode/codegroup/SimsimAdminCodegroup";
	}
	
	@RequestMapping(value="codeGroupViewMod")
	public String codeGroupViewMod(CodeGroupVo vo, Model model) throws Exception {
		CodeGroup result = service.selectOne(vo);
		model.addAttribute("item", result);
		return "commoncode/codegroup/SimsimAdminCodegroupViewMod";
	}
	
	@RequestMapping(value = "AdminCodegroupReg")
	public String codeGroupForm() throws Exception {
		
		return "commoncode/codegroup/SimsimAdminCodegroupReg";
	}
	
	@RequestMapping(value = "CodeGroupInst")
	public String CodeGroupInst(CodeGroup dto) throws Exception {
		
		int result =service.insert(dto);
		System.out.println("Controller result: "+result);
		
		return "redirect:/codeGroup/AdminCodegroupList";
	}
	
	
	@RequestMapping(value="codeGroupUpdt")
	public String codeGroupUpdt(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/codeGroup/AdminCodegroupList";
	}
	
	@RequestMapping(value="codeGroupVele")
	public String codeGroupVele(CodeGroupVo vo, CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception{
		
		service.velete(dto);
			
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/codeGroup/AdminCodegroupList";
	}
	
	@RequestMapping(value="codeGroupDele")
	public String codeGroupDele(CodeGroupVo vo, RedirectAttributes redirectAttributes) throws Exception{
		
		service.delete(vo);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/codeGroup/AdminCodegroupList";
	}
	
}
