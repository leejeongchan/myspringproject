package com.jeongchan.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jeongchan.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class InfoInterceptor2 extends HandlerInterceptorAdapter {

	// 우선 infoModify에서 Post후 리플래시
	@Setter(onMethod_ = @Autowired)
	private UserService userService;

	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws IOException {
		log.info("infopostHandle");
		HttpSession httpSession = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("user");

		if (userVO != null) {
			log.info("new login Success");
			httpSession.setAttribute("login", userVO);

		}
	}
}
