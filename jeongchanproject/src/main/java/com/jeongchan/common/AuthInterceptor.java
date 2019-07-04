package com.jeongchan.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;
/*
 * 
 * 특정 경로 이동시 매번 로그인 체크 
 */
@Log4j
public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	//이동하려 했던 페이지 저장
	private void saveDestination(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		if(query == null || query.equals("null")) {
			query = "";
		}else {
			query = "?" + query;
		}
		
		if(request.getMethod().equals("GET")) {
			log.info("destination : " + (uri+query));
			request.getSession().setAttribute("destination", uri+query);
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception {
		HttpSession httpSession = request.getSession();
		
		log.info("preHandle..");
		if(httpSession.getAttribute("login")==null) {
			log.info("current user is not logged");
			saveDestination(request);
			response.sendRedirect("/user/login");
			return false;
		}
		
		return true;
	}
}
