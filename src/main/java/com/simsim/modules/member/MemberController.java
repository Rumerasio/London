package com.simsim.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
}
