package com.simsim.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simsim.common.constants.Constants;

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
	
	@RequestMapping(value="/member/memberComment")
	public String commentRecord() throws Exception {
		
		return "zdmin/CommentRecord";
	}
	
	// 사용자 사용부분
		@RequestMapping(value="/loginPage")
		public String loginPage() throws Exception{
			
			return "user/Login";
		}
		
		//로그인 관련 S
		@ResponseBody
		@RequestMapping(value = "loginProc")
		public Map<String, Object> loginProc(Member dto, HttpSession httpSession) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();

			Member rtMember = service.selectOneId(dto);

			if (rtMember != null) {
				Member rtMember2 = service.selectOneLogin(dto);

				if (rtMember2 != null) {
					
//					if(dto.getAutoLogin() == true) {
//						UtilCookie.createCookie(Constants.COOKIE_NAME_SEQ, rtMember2.getIfmmSeq(), Constants.COOKIE_DOMAIN, Constants.COOKIE_PATH, Constants.COOKIE_MAXAGE);
//					} else {
//						// by pass
//					}
					
					httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
					httpSession.setAttribute("sessSeq", rtMember2.getSeq());
					httpSession.setAttribute("sessId", rtMember2.getId());
					httpSession.setAttribute("sessNickname", rtMember2.getNickname());

					rtMember2.setLgResultNy(1);
//					service.insertLogLogin(rtMember2);

//					Date date = rtMember2.getIfmmPwdModDate();
//					LocalDateTime ifmmPwdModDateLocalDateTime = LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
	//
//					if (ChronoUnit.DAYS.between(ifmmPwdModDateLocalDateTime, UtilDateTime.nowLocalDateTime()) > Constants.PASSWOPRD_CHANGE_INTERVAL) {
//						returnMap.put("changePwd", "true");
//					}

					returnMap.put("rt", "success");
				} else {
					dto.setSeq(rtMember.getSeq());
					dto.setLgResultNy(0);
//					service.insertLogLogin(dto);

					returnMap.put("rt", "fail");
				}
			} else {
				dto.setLgResultNy(0);
//				service.insertLogLogin(dto);

				returnMap.put("rt", "fail");
			}
			return returnMap;
		}
		
		@ResponseBody
		@RequestMapping(value = "logoutProc")
		public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();
//			UtilCookie.deleteCookie();
			httpSession.invalidate();
			returnMap.put("rt", "success");
			return returnMap;
		}
		//로그인 관련 E
		
		@RequestMapping(value="/register")
		public String register() throws Exception{
			
			return "user/Register";
		}
		
		@RequestMapping(value="/userReg")
		public String userReg(Member dto) throws Exception{
			service.insert(dto);
			return "redirect:/loginPage";
		}
		
		@RequestMapping(value="/findLoginInfo")
		public String findLoginInfo() throws Exception {
			
			return "user/FindLoginInfo";
		}
		
		@ResponseBody
		@RequestMapping(value="/findLoginInfo/findId")
		public Map<String, Object> findId(Member dto, Model model) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();
			Member result = service.selectId(dto);
			
			if (result == null) {
				returnMap.put("rt", "fail");
			} else {
				returnMap.put("rt", "success");
				returnMap.put("id", result.getId());
			}
			
			return returnMap;
		}
		
		@ResponseBody
		@RequestMapping(value="/findLoginInfo/findPassword")
		public Map<String, Object> findPassword(Member dto, Model model) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();
			Member result = service.selectPassword(dto);
			
			if (result == null) {
				returnMap.put("rt", "fail");
			} else {
				returnMap.put("rt", "success");
			}
			
			return returnMap;
		}
		
		@RequestMapping(value="/findLoginInfo/changePassword")
		public String changePassword(Member dto) throws Exception {
			service.changePassword(dto);
			return "/findLoginInfo";
		}
		
		//myPage 부분 S
		
		@RequestMapping(value="/myPage")
		public String myPage(HttpSession httpSession) throws Exception{
			
			
			
			return "user/member/UserMypage";
		}
		
		@RequestMapping(value="/myPage/userViewMod")
		public String userViewMod(HttpSession httpSession,@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
			
			String rtSeq = (String) httpSession.getAttribute("sessSeq");
			String rtNickname = (String) httpSession.getAttribute("sessNickname");
			
			vo.setSeq(rtSeq);
			vo.setNickname(rtNickname);
			
			Member result = service.selectOne(vo);
			
			model.addAttribute("item", result);
			
			System.out.println(vo.getSeq());
			System.out.println(vo.getNickname());
			System.out.println(vo.getId());
			System.out.println(vo.getPassword());
			
			return "user/member/UserViewMod";
		}
		
		@RequestMapping(value="/myPage/userUpdt")
		public String userUpdt(@ModelAttribute("vo") MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception{
			
			service.update(dto);
			
			redirectAttributes.addFlashAttribute("vo", vo);
			
			System.out.println(dto.getSeq());
			System.out.println(dto.getNickname());
			System.out.println(dto.getDob());
			System.out.println(dto.getGender());
			System.out.println(dto.getEmail());
			System.out.println(dto.getId());
			System.out.println(dto.getPassword());
			System.out.println(dto.getDelNy());
			return "redirect:/myPage/userViewMod";
		}
		
		@RequestMapping(value="/myPage/userVele")
		public String userVele(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception{
			service.velete(dto);
			
			redirectAttributes.addFlashAttribute("vo", vo);
			
			return "redirect:/";
		}

		@RequestMapping(value="/myPage/favoriteList")
		public String favoriteList(Model model, Member dto, HttpSession httpSession) throws Exception{
			String rtSeq = (String) httpSession.getAttribute("sessSeq");
			dto.setSeq(rtSeq);
			
			List<Member> list = service.selectFavorite(dto);
			model.addAttribute("list", list);
			
			System.out.println(dto.getId());
			
			return "user/member/UserFavoriteSurvey";
		}
		
		//myPage 부분 E
}
