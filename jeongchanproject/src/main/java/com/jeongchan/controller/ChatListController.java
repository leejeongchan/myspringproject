package com.jeongchan.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeongchan.domain.ChatVO;
import com.jeongchan.service.ChatService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatListController {

	@Setter(onMethod_=@Autowired)
	private ChatService chatService;
	
	
	@RequestMapping("/ChatList")
	public void chatList(@RequestParam("listType") String listType,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		log.info("/ChatList");
		log.info("listType: "+listType);
		try {
		if(listType==null || listType.equals(""))
		{
			log.info("1");
			response.getWriter().write("");
		}
		else if(listType.equals("today"))
		{
			log.info("2");
			response.getWriter().write(getToday());
		}
		else if(listType.equals("ten"))
		{
			log.info("3");
			response.getWriter().write(getTen());
		}
		else {
			try {
				log.info("4");
				Integer.parseInt(listType);
				response.getWriter().write(getID(listType));
			}catch(Exception e)
			{
				response.getWriter().write("");
			}
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public String getToday() {
		StringBuffer result = new StringBuffer("");
		try {

			result.append("{\"result\":[");
			ArrayList<ChatVO> chatList = chatService.getChatList(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			log.info("ListController chatList: "+chatList);
			for (int i = 0; i < chatList.size(); i++) {
				result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
				result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
				result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
				if (i != chatList.size() - 1) {
					result.append(",");

				}

			}
			result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatId() + "\"}");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result.toString();
	}

	public String getTen() {
		log.info("getTen()");
		StringBuffer result = new StringBuffer("");
		try {

			result.append("{\"result\":[");
			ArrayList<ChatVO> chatList = chatService.getChatListByRecent1(10);
			log.info("ListController chatList: "+chatList);

			for (int i = 0; i < chatList.size(); i++) {
				result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
				result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
				result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
				if (i != chatList.size() - 1) {
					result.append(",");

				}

			}
			result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatId() + "\"}");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result.toString();
	}

	public String getID(String chatID) {
		StringBuffer result = new StringBuffer("");
		try {

			result.append("{\"result\":[");
			ArrayList<ChatVO> chatList = chatService.getChatListByRecent2(chatID);
			log.info("ListController chatList: "+chatList);

			for (int i = 0; i < chatList.size(); i++) {
				result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
				result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
				result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
				if (i != chatList.size() - 1) {
					result.append(",");

				}

			}
			result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatId() + "\"}");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result.toString();
	}
}
