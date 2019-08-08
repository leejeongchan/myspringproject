package com.jeongchan.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.jeongchan.domain.UserVO;
import com.jeongchan.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class RememberMeInterceptor extends HandlerInterceptorAdapter{
	
	@Setter(onMethod_=@Autowired)
	private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception {
		HttpSession httpSession = request.getSession();
		log.info("preHandle..");
		//저장된 쿠키를 불러와서
		Cookie jeongchanCookie = WebUtils.getCookie(request, "jeongchanCookie");
		log.info("Remeber 1");
		//쿠키가 존재하면 
		if(jeongchanCookie!=null) {
			//세션키가 있는 유저 조회하여 userVO에 담는ㄴ다.
			UserVO userVO = userService.checkLoginBefore(jeongchanCookie.getValue());
			log.info("Remember 2");
			if(userVO !=null) {
				//세션 키가 keep메서드로 유지가 되고있다면 login객체에 정보를 넣어서 로그인을 유지
				log.info("Remember 3");
				httpSession.setAttribute("login", userVO);
			}
		}
		log.info("Remember 4");
		return true;
	}
}
