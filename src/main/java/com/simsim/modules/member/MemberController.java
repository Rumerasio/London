package com.simsim.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simsim.common.constants.Constants;
import com.simsim.modules.code.CodeServiceImpl;
import com.simsim.modules.survey.Survey;
import com.simsim.modules.survey.SurveyServiceImpl;
import com.simsim.modules.survey.SurveyVo;

@Controller
@RequestMapping
public class MemberController {

	@Autowired
	MemberServiceImpl service;
	
	@Autowired
	SurveyServiceImpl service2;
	
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
	
	@RequestMapping("/member/excelDownload")
    public void excelDownload(MemberVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
		vo.setShdelNy(vo.getShdelNy() == null ? 0 : vo.getShdelNy());
		vo.setShOption(vo.getShOption() == null ? 1 : vo.getShOption());
		vo.setShValue(vo.getShValue() == null ? "" : vo.getShValue());
		
		vo.setParamsPaging(service.selectOneCount(vo));

		if (vo.getTotalRows() > 0) {
			List<Member> list = service.selectList(vo);
			
//			Workbook workbook = new HSSFWorkbook();	// for xls
	        Workbook workbook = new XSSFWorkbook();
	        Sheet sheet = workbook.createSheet("Sheet1");
	        CellStyle cellStyle = workbook.createCellStyle();        
	        Row row = null;
	        Cell cell = null;
	        int rowNum = 0;
			
//	        each column width setting	        
	        sheet.setColumnWidth(0, 2100);
	        sheet.setColumnWidth(1, 3100);

//	        Header
	        String[] tableHeader = {"Seq", "?????????", "?????????", "??????", "??????", "??????????????????", "?????????", "?????????", "?????????"};

	        row = sheet.createRow(rowNum++);
	        
			for(int i=0; i<tableHeader.length; i++) {
				cell = row.createCell(i);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
				cell.setCellValue(tableHeader[i]);
			}

//	        Body
	        for (int i=0; i<list.size(); i++) {
	            row = sheet.createRow(rowNum++);
	            
//	            String type: null ?????? ????????? ok
//	            int, date type: null ??? ?????? ?????? ????????? null check
//	            String type ????????? ????????? ???????????? ????????? seq ??? ?????? ?????????	            
	            
	            cell = row.createCell(0);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	            cell.setCellValue(Integer.parseInt(list.get(i).getSeq()));
	            
	            cell = row.createCell(1);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getId());
	        	
	            cell = row.createCell(2);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getNickname());
	        	
	        	cell = row.createCell(3);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getDob());
	        	
	            cell = row.createCell(4);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	            if(list.get(i).getGender() != null) cell.setCellValue(CodeServiceImpl.selectOneCachedCode(list.get(i).getGender()));
	            
	            cell = row.createCell(5);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getPhoneNum());
	            
	            cell = row.createCell(6);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getEmail());
	            
	            cell = row.createCell(7);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getRegisterDateTime());
	            
	            cell = row.createCell(8);
	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
	            cell.setCellStyle(cellStyle);
	            cell.setCellValue(list.get(i).getModifyDateTime());
	        }

	        httpServletResponse.setContentType("ms-vnd/excel");
//	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");	// for xls
	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

	        workbook.write(httpServletResponse.getOutputStream());
	        workbook.close();
		}
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
	public String commentRecord(Model model,@ModelAttribute("vo") SurveyVo vo) throws Exception {
		
		vo.setParamsPaging(service2.getCommentNum(vo));
		
		List<Survey> list = service2.selectCommentList(vo);
		model.addAttribute("list", list);
		List<Survey> list2 = service2.selectList(vo);
		model.addAttribute("list2",list2);
		List<Member> list3 = service.getIdList();
		model.addAttribute("list3", list3);
		
		return "zdmin/CommentRecord";
	}
		
	@RequestMapping(value="/zdminLogin")
	public String zdminLogin(HttpSession httpSession) throws Exception{
		httpSession.removeAttribute("sessSeq");
		httpSession.removeAttribute("sessId");
		httpSession.removeAttribute("sessNickname");
		httpSession.setAttribute("sessAdmin", "1");
	//	String rtSeq = (String) httpSession.getAttribute("sessSeq");
	//	vo.setSeq(rtSeq);
		
		return "zdmin/zdminLogin";
	}
	
	@ResponseBody
	@RequestMapping(value="/zdminLoginProc")
	public Map<String, Object> zdminLoginProc(@ModelAttribute("vo") MemberVo vo, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Member rtMember = service.selectAdminId(vo);
		if(rtMember != null) {
			Member rtMember2 = service.selectAdminLogin(vo);
			if(rtMember2 != null) {
				httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
				httpSession.setAttribute("sessSeq", rtMember2.getSeq());
				httpSession.setAttribute("sessNickname", rtMember2.getNickname());
				
				returnMap.put("rt", "success");
			} else {
				returnMap.put("rt", "passwordfail");
			} 
		} else {
			returnMap.put("rt", "idfail");
		}
		
		return returnMap;
	}
	
	// ????????? ????????????
		@RequestMapping(value="/loginPage")
		public String loginPage() throws Exception{
			
			return "user/Login";
		}
		
		//????????? ?????? S
		@ResponseBody
		@RequestMapping(value = "/loginProc")
		public Map<String, Object> loginProc(MemberVo vo, HttpSession httpSession) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();

			Member rtMember = service.selectOneId(vo);

			if (rtMember != null) {
				Member rtMember2 = service.selectOneLogin(vo);

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
					vo.setSeq(rtMember.getSeq());
					returnMap.put("rt", "fail");
				}
			} else {
				returnMap.put("rt", "fail");
			}
			return returnMap;
		}
		
		@ResponseBody
		@RequestMapping(value = "/kakaoLoginProc")
		public Map<String, Object> kakaoLoginProc(Member dto, HttpSession httpSession) throws Exception {
		    Map<String, Object> returnMap = new HashMap<String, Object>();
			Member kakaoLogin = service.snsLoginCheck(dto);
			
			if (kakaoLogin == null) {
				System.out.println("??????????????????");
				service.kakaoInst(dto);
				
				httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
				httpSession.setAttribute("sessNickname", dto.getNickname());
				// session(dto.getSeq(), dto.getId(), dto.getName(), dto.getEmail(), dto.getUser_div(), dto.getSnsImg(), dto.getSns_type(), httpSession);
	            session(dto, httpSession); 
				returnMap.put("rt", "success");
			} else {
				System.out.println("???????????????");
				httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
				httpSession.setAttribute("sessNickname", dto.getNickname());
				// session(kakaoLogin.getSeq(), kakaoLogin.getId(), kakaoLogin.getName(), kakaoLogin.getEmail(), kakaoLogin.getUser_div(), kakaoLogin.getSnsImg(), kakaoLogin.getSns_type(), httpSession);
				session(kakaoLogin, httpSession);
				returnMap.put("rt", "success");
			}
			return returnMap;
		}
		
		@ResponseBody
		@RequestMapping(value = "naverLoginProc")
		public Map<String, Object> naverLoginProc(Member dto, HttpSession httpSession) throws Exception {
		    Map<String, Object> returnMap = new HashMap<String, Object>();
		    
			Member naverLogin = service.snsLoginCheck(dto);
			
			if (naverLogin == null) {
				service.naverInst(dto);
				
				httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
				// session(dto.getSeq(), dto.getId(), dto.getName(), dto.getEmail(), dto.getUser_div(), dto.getSnsImg(), dto.getSns_type(), httpSession);
	            session(dto, httpSession); 
				returnMap.put("rt", "success");
			} else {
				httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
				
				// session(kakaoLogin.getSeq(), kakaoLogin.getId(), kakaoLogin.getName(), kakaoLogin.getEmail(), kakaoLogin.getUser_div(), kakaoLogin.getSnsImg(), kakaoLogin.getSns_type(), httpSession);
				session(naverLogin, httpSession);
				returnMap.put("rt", "success");
			}
			return returnMap;
		}

		 public void session(Member dto, HttpSession httpSession) {
		     httpSession.setAttribute("sessSeq", dto.getSeq());    
		     httpSession.setAttribute("sessId", dto.getId());
		     httpSession.setAttribute("sessNickname", dto.getNickname());
		     httpSession.setAttribute("sessEmail", dto.getEmail());
		 }
		
		@ResponseBody
		@RequestMapping(value = "/logoutProc")
		public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();
//			UtilCookie.deleteCookie();
			httpSession.invalidate();
			returnMap.put("rt", "success");
			return returnMap;
		}
		//????????? ?????? E
		
		@RequestMapping(value="/register")
		public String register() throws Exception{
			
			return "user/Register";
		}
		
		@RequestMapping(value="/userReg")
		public String userReg(Member dto) throws Exception{
			service.insert(dto);
			return "redirect:/loginPage";
		}
		
		@ResponseBody
		@RequestMapping(value="/checkId")
		public Map<String, Object> checkId(Member dto) throws Exception{
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			
			int result = service.selectOneIdCheck(dto);
			
			System.out.println("result: "+result);
			
			if (result > 0) {
				returnMap.put("rt", "fail");
			} else {
				returnMap.put("rt", "success");
			}
			
			System.out.println(returnMap);
			
			return returnMap;
		}
		
		@ResponseBody
		@RequestMapping(value="/checkEmail")
		public Map<String, Object> checkEmail(Member dto) throws Exception{
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			
			int result = service.selectOneEmailCheck(dto);
			
			System.out.println("result: "+result);
			
			if (result > 0) {
				returnMap.put("rt", "fail");
			} else {
				returnMap.put("rt", "success");
			}
			
			System.out.println(returnMap);
			
			return returnMap;
		}
		
		@RequestMapping(value="/findLoginInfo")
		public String findLoginInfo() throws Exception {
			
			return "user/FindLoginInfo";
		}
		
		@ResponseBody
		@RequestMapping(value="/findLoginInfo/findId")
		public Map<String, Object> findId(MemberVo vo) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();
			Member result = service.selectId(vo);
			
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
		public Map<String, Object> findPassword(Member dto,MemberVo vo, Model model) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();
			Member result = service.selectPassword(vo);
			
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
		
		//myPage ?????? S
		
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
		public String userUpdt(@ModelAttribute("vo") MemberVo vo, Member dto, RedirectAttributes redirectAttributes, HttpSession httpSession) throws Exception{
			String rtSeq = (String) httpSession.getAttribute("sessSeq");
			dto.setSeq(rtSeq);
			service.update(dto);
			httpSession.setAttribute("sessNickname", dto.getNickname());
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
		
		//myPage ?????? E
}
