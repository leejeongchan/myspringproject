package com.jeongchan.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jeongchan.domain.UserVO;
import com.jeongchan.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class InfoInterceptor extends HandlerInterceptorAdapter{
	
	//우선 info Get으로 조회할때 pre에서 리플래시
	@Setter(onMethod_=@Autowired)
	private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception {
		HttpSession httpSession = request.getSession();
		log.info("infopreHandle..");
		
		UserVO userVO = (UserVO)httpSession.getAttribute("login");
		if(userVO==null) {
			response.sendRedirect("/user/login");
			return false;
		}
		httpSession.setAttribute("login",userService.loginById(userVO.getUserId()));

		
		return true;
	}
}
