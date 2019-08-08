package com.jeongchan.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeongchan.domain.UserVO;
import com.jeongchan.service.UserMailSendService;
import com.jeongchan.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@Log4j
public class UserRegisterController {
	
	
	
	@Setter(onMethod_ = @Autowired)
	private UserService userService;
	
	@Setter(onMethod_=@Autowired)
	private UserMailSendService mailsender;
	
	
	@GetMapping(value="/register")
	public void registerGet() {
		log.info("회원가입페이지 보여주기...");
	}
	
	@PostMapping(value="/register")
	public String registerPost(UserVO userVO,RedirectAttributes redirectAttributes,HttpServletRequest request) {
		
		String hashedPw = BCrypt.hashpw(userVO.getUserPw(),BCrypt.gensalt());
		userVO.setUserPw(hashedPw);
		userService.register(userVO);
		log.info("getUserEmail: "+userVO.getUserEmail());
		mailsender.mailSendWithUserKey(userVO.getUserEmail(),userVO.getUserId(),request);
		redirectAttributes.addFlashAttribute("msg","REGISTERED");
		
		return "redirect:/user/login";
	}
	//카카오 정보 등록
	@PostMapping(value="/kakaoregister")
	public void kakaoRegister(UserVO userVO,Model model,HttpServletRequest request,HttpSession session) {
		
		String hashedPw = BCrypt.hashpw(userVO.getUserPw(),BCrypt.gensalt());
		userVO.setUserPw(hashedPw);
		userService.register(userVO);
		log.info("getUserEmail: "+userVO.getUserEmail());
		session.setAttribute("login",userVO);
//		redirectAttributes.addFlashAttribute("msg","REGISTERED");
		model.addAttribute("msg","REGISTERED");
		
	}
	
	
	@GetMapping("/key_alter")
	public String key_alterConfirm(@RequestParam("userId") String userId,@RequestParam("userKey") String userKey) {
		mailsender.alter_userKey_service(userId,userKey);
		return "/user/userRegSuccess";
	}

}
