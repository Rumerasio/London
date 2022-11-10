package com.simsim.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CheckLoginSessionInterception extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if (request.getSession().getAttribute("sessSeq") != null ) {
			//pass
		} else {
			if(request.getSession().getAttribute("sessAdmin") == "1" ) {
				response.sendRedirect("/zdminLogin");
				return false;
			} else {
				response.sendRedirect("/loginPage");
	            return false;
			}
		}
		System.out.println("CheckLoginSessionInterception running");
		
		return super.preHandle(request, response, handler);
	}

	
}
