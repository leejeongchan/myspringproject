package com.jeongchan.controller;

import java.net.URLDecoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeongchan.service.ChatService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ChatSubmitController {
	
	@Setter(onMethod_=@Autowired)
	private ChatService chatService;
	
	@RequestMapping("/ChatSubmit")
	public void chatSubmit(@RequestParam Map<String,Object> param,HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		log.info("/ChatSubmit");
		String chatName = URLDecoder.decode((String)param.get("chatName"),"UTF-8");
		String chatContent =URLDecoder.decode((String)param.get("chatContent"),"UTF-8");
		try {
			if(chatName == null || chatName.equals("") || chatContent==null || chatContent.equals(""))
			{
				response.getWriter().write("0");
			}
			else {
				
				response.getWriter().write(chatService.submit(chatName,chatContent)+"");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
