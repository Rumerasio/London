package com.simsim.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/member/")
public class MemberController {

	@Autowired
	MemberServiceImpl service;
	

	@RequestMapping(value = "memberList")
	public String memberList(Model model,MemberVo vo) throws Exception {

		List<Member> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "zdmin/MemberList";
	}
}
