package com.simsim.modules.code;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simsim.modules.codegroup.CodeGroup;
import com.simsim.modules.codegroup.CodeGroupServiceImpl;
import com.simsim.modules.codegroup.CodeGroupVo;

@Controller
@RequestMapping(value ="/code/")
public class CodeController {

	@Autowired
	CodeServiceImpl service;
	
	@Autowired
	CodeGroupServiceImpl codeGroupService;

	@RequestMapping(value = "codeList")
	public String codeList(Model model, @ModelAttribute("vo") CodeVo vo) throws Exception {

		vo.setShuseNy(vo.getShuseNy() == null ? 1 : vo.getShuseNy());
		vo.setShOption(vo.getShOption() == null ? "2" : vo.getShOption());
		vo.setShValue(vo.getShValue() == null ? "" : vo.getShValue());
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		List<Code> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "commoncode/code/SimsimAdminCode";
	}
	
	@RequestMapping(value="codeView")
	public String codeView(@ModelAttribute("vo") CodeVo vo, CodeGroupVo cgvo, Model model, Model cgmodel) throws Exception {
		
		List<CodeGroup> cgresult = codeGroupService.selectListSm(cgvo);
		Code result= service.selectOne(vo);
		model.addAttribute("item", result);
		cgmodel.addAttribute("CGlist", cgresult);
		
		return "commoncode/code/SimsimAdminCodeViewMod";
	}
	
	@RequestMapping(value = "codeForm")
	public String codeForm(Model model,@ModelAttribute("vo") CodeGroupVo vo) throws Exception {
		
		List<CodeGroup> result = codeGroupService.selectListSm(vo);
		
		model.addAttribute("CGlist",result);
		
		return "commoncode/code/SimsimAdminCodeReg";
	}
	
//	@RequestMapping(value = "codeForm")
//	public String codeFrom() throws Exception {
//		
//		return "commoncode/code/SimsimAdminCodeReg";
//	}
	
	@ResponseBody
	@RequestMapping(value = "checkCode")
	public Map<String, Object> checkCode(Code dto) throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int result = service.selectOneCodeCheck(dto);
		
		System.out.println("result: "+result);
		
		if (result > 0) {
			returnMap.put("rt", "fail");
		} else {
			returnMap.put("rt", "success");
		}
		
		System.out.println(returnMap);
		
		return returnMap;
	}
	
	
	@RequestMapping(value="codeInst")
	public String codeInst(Code dto) throws Exception {
		int result = service.insert(dto);
		System.out.println("Controller result: "+result);
		return "redirect:/code/codeList";
	}
	
	@RequestMapping(value="codeUpdt")
	public String codeUpdt(Code dto,@ModelAttribute("vo") CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/code/codeList";
	}	
	
	@RequestMapping(value="codeVele")
	public String codeVele(Code dto,@ModelAttribute("vo") CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.velete(dto);
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/code/codeList";
	}
	
	@RequestMapping(value="codeDele")
	public String codeDele(@ModelAttribute("vo") CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.delete(vo);
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/code/codeList";
	}
}
