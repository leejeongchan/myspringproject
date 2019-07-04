package com.jeongchan.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.jeongchan.domain.ChatVO;

public interface ChatService {
	public ArrayList<ChatVO> getChatList(String nowTime);

	public ArrayList<ChatVO> getChatListByRecent1(int number);

	public ArrayList<ChatVO> getChatListByRecent2(String chatId);

	public int submit(@Param("chatName") String chatName, @Param("chatContent") String chatContent);
}
