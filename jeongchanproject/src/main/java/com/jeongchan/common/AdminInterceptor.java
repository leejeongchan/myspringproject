package com.jeongchan.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jeongchan.domain.UserVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception {
		HttpSession httpSession = request.getSession();
		//상품 관리자가아니면 URL로 일반유저가 들어가도 막음..
		UserVO userVO =(UserVO)httpSession.getAttribute("login");
		
		if(userVO==null) {
			response.sendRedirect("/user/login");
			return false;
		}
		if(userVO.getUserAdmin()!=1) {
			response.sendRedirect("/");
			return false;
		}
		
		return true;
	}
	
}
