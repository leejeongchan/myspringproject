package com.jeongchan.controller;

import java.util.Date;
import java.util.HashMap;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.jeongchan.domain.LoginDTO;
import com.jeongchan.domain.UserVO;
import com.jeongchan.service.KakaoAPI;
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
	
	@Setter(onMethod_=@Autowired)
	private KakaoAPI kakaoApi;
	
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
		//이메일 인증이 안된 유저일 경우 메일 재전송
		if(!userVO.getUserKey().equals("Y")) {
			mailsender.mailSendWithUserKey(userVO.getUserEmail(),userVO.getUserId(),request);
			model.addAttribute("message","email");
			return ;

		}
		//로그인 유지를 선택할 경우(로그인 기억)
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
	
	
	
	/**
	 * GET /oauth/authorize?client_id={app_key}&redirect_uri={redirect_uri}&response_type=code HTTP/1.1
	 * Host: kauth.kakao.com
	 * HTTP/1.1 302 Found
	 * Content-Length: 0
     * Location: {redirect_uri}?code={authorize_code}
	 */
	@GetMapping(value="/kakaologin")
	public String login(@RequestParam("code") String code,Model model,HttpSession session) {
		log.info("code: "+code);
		//요청해서 받은 code를 이용해서 POST로 토큰을 요청하면 받아온다.
		String access_Token = kakaoApi.getAccessToken(code);
		log.info("access_Token: "+access_Token);
		//받아온 토큰을 이용해서 사용자 정보를 가져온다.
		HashMap<String,Object> userInfo = kakaoApi.getUserInfo(access_Token);
		//Todo: 디비에 이 고유 ID가 저장되어 있다면 바로 "/"로 이동시키기
		int idcheck = userService.idcheck((String)userInfo.get("userId"));
		log.info("idcheck: "+idcheck);
		//만약 클라이언트 이메일이 존재한다면 세션에 이메일과 토큰 등록
		if(userInfo.get("email")!=null) {
			session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("access_Token", access_Token);
	        session.setAttribute("kakao",1);
	        
		}
		
		//만약 이미 카톡 등록된 아이디면 바로 /로 이동하고 세션에 해당 정보 담고 넘기기
		if(idcheck == 1) {
			UserVO userVo = userService.searchUser((String)userInfo.get("userId"));
			session.setAttribute("login",userVo);
			return "redirect:/";
		}
		model.addAttribute("userId",userInfo.get("userId"));
		model.addAttribute("email",userInfo.get("email"));
		model.addAttribute("nickname",userInfo.get("nickname"));
		return "/user/kakaologin";
	}
	/**
	 * 카카오 로그아웃
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/kakaologout")
	public String logout(Model model,HttpSession session) {
		kakaoApi.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
	    session.removeAttribute("login");
	    session.removeAttribute("kakao");
		session.invalidate();

	    model.addAttribute("message","LOGOUT");
		return "/user/kakaologout";
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
