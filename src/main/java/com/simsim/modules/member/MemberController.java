package com.simsim.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simsim.common.constants.Constants;
import com.simsim.modules.survey.SurveyServiceImpl;

@Controller
@RequestMapping
public class MemberController {

	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value = "/member/memberList")
	public String memberList(Model model,@ModelAttribute("vo") MemberVo vo) throws Exception {

		vo.setShdelNy(vo.getShdelNy() == null ? 0 : vo.getShdelNy());
		vo.setShOption(vo.getShOption() == null ? 1 : vo.getShOption());
		vo.setShValue(vo.getShValue() == null ? "" : vo.getShValue());
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		List<Member> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "zdmin/member/MemberList";
	}
	
	@RequestMapping(value="/member/memberForm")
	public String memberForm(@ModelAttribute("vo") MemberVo vo) throws Exception{
		
		return "zdmin/member/MemberReg";
	}
	
	// user 사용부분
	@RequestMapping(value="/loginPage")
	public String loginPage() throws Exception{
		
		return "user/Login";
	}
	
	@ResponseBody
	@RequestMapping(value = "loginProc")
	public Map<String, Object> loginProc(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();

		Member rtMember = service.selectOneId(dto);

		if (rtMember != null) {
			Member rtMember2 = service.selectOneLogin(dto);

			if (rtMember2 != null) {
				
//				if(dto.getAutoLogin() == true) {
//					UtilCookie.createCookie(Constants.COOKIE_NAME_SEQ, rtMember2.getIfmmSeq(), Constants.COOKIE_DOMAIN, Constants.COOKIE_PATH, Constants.COOKIE_MAXAGE);
//				} else {
//					// by pass
//				}
				
				httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
				httpSession.setAttribute("sessSeq", rtMember2.getSeq());
				httpSession.setAttribute("sessId", rtMember2.getId());
				httpSession.setAttribute("sessNickname", rtMember2.getNickname());

				rtMember2.setLgResultNy(1);
//				service.insertLogLogin(rtMember2);

//				Date date = rtMember2.getIfmmPwdModDate();
//				LocalDateTime ifmmPwdModDateLocalDateTime = LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
//
//				if (ChronoUnit.DAYS.between(ifmmPwdModDateLocalDateTime, UtilDateTime.nowLocalDateTime()) > Constants.PASSWOPRD_CHANGE_INTERVAL) {
//					returnMap.put("changePwd", "true");
//				}

				returnMap.put("rt", "success");
			} else {
				dto.setSeq(rtMember.getSeq());
				dto.setLgResultNy(0);
//				service.insertLogLogin(dto);

				returnMap.put("rt", "fail");
			}
		} else {
			dto.setLgResultNy(0);
//			service.insertLogLogin(dto);

			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "logoutProc")
	public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
//		UtilCookie.deleteCookie();
		httpSession.invalidate();
		returnMap.put("rt", "success");
		return returnMap;
	}
	
	@RequestMapping(value="/register")
	public String register() throws Exception{
		
		return "user/Register";
	}
	
	@RequestMapping(value="/userReg")
	public String userReg(Member dto) throws Exception{
		service.insert(dto);
		return "redirect:/loginPage";
	}
	
	
	@RequestMapping(value="/member/memberViewMod")
	public String memberViewMod(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception{
		
		Member result = service.selectOne(vo);
		model.addAttribute("item", result);
		
		return "zdmin/member/MemberViewMod";
	}
	
	@RequestMapping(value="/member/memberContentRecord")
	public String memberContentRecord() throws Exception{
		
		return "zdmin/member/MemberContentRecord";
	}
	
	
	@RequestMapping(value="/member/memberInst")
	public String memberInst(@ModelAttribute("vo") MemberVo vo,Member dto, RedirectAttributes redirectAttributes) throws Exception{
		
    	
		int result = service.insert(dto); 
		System.out.println("result: "+result);
		
		vo.setSeq(dto.getSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberViewMod";
	}
	
	@RequestMapping(value="/member/memberUpdt")
	public String memberUpdt(@ModelAttribute("vo") MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception{
		
		service.update(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberList";
	}
	
	@RequestMapping(value="/member/memberDele")
	public String memberDele(@ModelAttribute("vo") MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.delete(vo);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberList";
		
	}
	
	
	
}
