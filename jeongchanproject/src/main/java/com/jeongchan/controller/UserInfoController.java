package com.jeongchan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeongchan.domain.Criteria2;
import com.jeongchan.domain.PageDTO2;
import com.jeongchan.domain.UserVO;
import com.jeongchan.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
public class UserInfoController {
	
	@Setter(onMethod_=@Autowired)
	private UserService userService;
	
	@GetMapping("/info")
	public void infoGet() {
		log.info("infoGet...");
		//기록 수정 후든 기록 조회를 하든 여기로 오면 정보를 다시 불러옴...
		
	}
	
	@GetMapping("/infomodify")
	public void infoModifyGet() {
		log.info("infomodifyGet...");
	}
	
	@PostMapping("/infomodify")
	public String infoModifyPost(UserVO userVO,Model model) {
		log.info("infomodifyPost...");
		
		userService.updateInfo(userVO);
		
		model.addAttribute("user",userVO);
		return "/user/info";
		
	}
	
	@GetMapping("/search")
	public void userSearchPost(String userId,Model model) {
		UserVO userVO = userService.searchUser(userId);
		log.info("/search userVO: "+userVO);
		model.addAttribute("user",userVO);
	}
	
	@GetMapping("/like")
	public String userLikeGet(String userId,Model model) {
		int flag=userService.likeCount(userId);
		
		if(flag == 1 ) {
			log.info("flag1");
			model.addAttribute("userId",userId);
			return "/user/likeSuccess";
		}
		return "/user/likeFail";
	}
	
	@RequestMapping("/userlist")
	public void userList(Criteria2 cri,Model model){
		List<UserVO> userList = userService.userList(cri);
		int count = userService.userCount();
		model.addAttribute("list",userList);
		model.addAttribute("count",count);
		model.addAttribute("pageMaker",new PageDTO2(cri,count));
	}
	
	@GetMapping("/userrank")
	public void userRank(Model model) {
		List<UserVO> userthreepeople = userService.userthreepeople();
		log.info("userthreepeople: "+userthreepeople);
		model.addAttribute("threeList",userthreepeople);
		
	}
	
	@GetMapping("/upadmin")
	public String adminUpdate(@RequestParam("userId") String userId) {
		userService.updateAdmin(userId);
		return "redirect:/user/info";
	}
	
	
}
