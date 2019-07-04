package com.jeongchan.common;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final String LOGIN = "login";
	//로그인 정보를 세션에 담음 user라는 객체를 뺏어온다.
	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response,Object handler,ModelAndView modelAndView) throws IOException {
		log.info("postHandle");
		HttpSession httpSession = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("user");
		
		if(userVO!=null) {
			log.info("new login Success");
			httpSession.setAttribute(LOGIN, userVO);
			
			//쿠키 생성
			if(request.getParameter("useCookie") !=null) {
				log.info("remember");
				Cookie jeongchanCookie = new Cookie("jeongchanCookie",httpSession.getId());
				jeongchanCookie.setPath("/");
				jeongchanCookie.setMaxAge(60*60*24*7);
				//쿠키를 전송!!
				response.addCookie(jeongchanCookie);
			
			}
			//response.sendRedirect("/");
			Object destination = httpSession.getAttribute("destination");
			response.sendRedirect(destination!=null?(String)destination:"/");;
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception {
		HttpSession httpSession = request.getSession();
		log.info("preHandle..");
		//기존 로그인 정보 제거
		if(httpSession.getAttribute(LOGIN)!=null) {
			log.info("clear login data");
			httpSession.removeAttribute(LOGIN);
		}
		return true;
	}
	
}
