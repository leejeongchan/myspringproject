package com.jeongchan.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginAfterInterceptor extends HandlerInterceptorAdapter {
	//로그인 후에 로그인 페이지나 회원가입 페이지로 이동 못하게 막는 인터셉터.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession httpSession = request.getSession();
		log.info("preHandle..");
		if(httpSession.getAttribute("login")!=null) {
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}
		return true;
	}
}
