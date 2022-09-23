package com.simsim.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/member/")
public class MemberController {

	@Autowired
	MemberServiceImpl service;
	

	@RequestMapping(value = "memberList")
	public String memberList(Model model,@ModelAttribute("vo") MemberVo vo) throws Exception {

		vo.setShdelNy(vo.getShdelNy() == null ? 0 : vo.getShdelNy());
		vo.setShOption(vo.getShOption() == null ? 1 : vo.getShOption());
		vo.setShValue(vo.getShValue() == null ? "" : vo.getShValue());
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		List<Member> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "zdmin/member/MemberList";
	}
	
	@RequestMapping(value="memberForm")
	public String memberForm(@ModelAttribute("vo") MemberVo vo) throws Exception{
		
		return "zdmin/member/MemberReg";
	}
	
	@RequestMapping(value="memberViewMod")
	public String memberViewMod(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception{
		
		Member result = service.selectOne(vo);
		model.addAttribute("item", result);
		
		return "zdmin/member/MemberViewMod";
	}
	
	@RequestMapping(value="memberInst")
	public String memberInst(@ModelAttribute("vo") MemberVo vo,Member dto, RedirectAttributes redirectAttributes) throws Exception{
		
		int result = service.insert(dto); 
		
		vo.setSeq(dto.getSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberViewMod";
	}
	
	@RequestMapping(value="memberUpdt")
	public String memberUpdt(@ModelAttribute("vo") MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception{
		
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberList";
	}
	
	@RequestMapping(value="memberDele")
	public String memberDele(@ModelAttribute("vo") MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.delete(vo);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberList";
		
	}
	
	
	
}
