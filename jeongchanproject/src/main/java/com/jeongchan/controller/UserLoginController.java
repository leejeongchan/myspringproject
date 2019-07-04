package com.jeongchan.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.jeongchan.domain.LoginDTO;
import com.jeongchan.domain.UserVO;
import com.jeongchan.service.UserMailSendService;
import com.jeongchan.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class UserLoginController {
	
	@Setter(onMethod_=@Autowired)
	private UserService userService;
	
	@Setter(onMethod_=@Autowired)
	private UserMailSendService mailsender;
	
	@GetMapping(value="/login")
	public void loginGet(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		log.info("login Get...");
	}
	
	@PostMapping(value="/loginPost")
	public void loginPost(LoginDTO loginDTO,HttpSession httpSession,Model model,HttpServletRequest request) {
		//DB에서 회원 정보 조회하여 userVO에 담음
		log.info("loginDTO: "+loginDTO);
		
		UserVO userVO = userService.login(loginDTO);
		
		log.info("userVO: "+userVO);
		
		//DB정보와 사용자가 입력하 loginDTO를 비교함
		if(userVO == null || !BCrypt.checkpw(loginDTO.getUserPw(),userVO.getUserPw())) {
			//loginPost.jsp로 이동
			return ;
		}
		
		if(!userVO.getUserKey().equals("Y")) {
			mailsender.mailSendWithUserKey(userVO.getUserEmail(),userVO.getUserId(),request);
			model.addAttribute("message","email");
			return ;

		}
		//로그인 유지를 선택할 경우
		if(loginDTO.isUseCookie()) {
			int amount = 60*60*24*7; //7days
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
			//체크시에 DB에 해당 로그인 유저 세션 업데이트 시키기
			userService.keepLogin(userVO.getUserId(),httpSession.getId(),sessionLimit);
		}
		
		model.addAttribute("user",userVO);
	}
	
	@GetMapping(value="/logout")
	public String logout(HttpServletRequest request,HttpServletResponse response,HttpSession httpSession) {
		Object object = httpSession.getAttribute("login");
		if(object!=null) {
			UserVO userVO = (UserVO)object;
			httpSession.removeAttribute("login");
			httpSession.invalidate();
			Cookie jeongchanCookie = WebUtils.getCookie(request,"jeongchanCookie");
			
			if(jeongchanCookie!=null) {
				jeongchanCookie.setPath("/");
				jeongchanCookie.setMaxAge(0);
				response.addCookie(jeongchanCookie);
				userService.keepLogin(userVO.getUserId(),"none",new Date());
				log.info("end logout2");
			}
			
		}
		log.info("end logout1");
		return "/user/logout";
	}
	
	//중복 체크 컨트롤러 AJax
	// /user/idcheck
	@RequestMapping("/idcheck")
	@ResponseBody
	public String idcheck(@RequestBody String userid){
		String checkRst;
		int count=0;
		
		count = userService.idcheck(userid);
		log.info("check Id: "+userid);
		log.info("count: "+count);
		if(count>0) {
			//중복 발생
			checkRst = "F";
		}else {
			//중복 아님
			checkRst = "S";
		}
		return checkRst;
	}
}
