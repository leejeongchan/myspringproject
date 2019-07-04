package com.jeongchan.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.jeongchan.domain.ChatVO;

public interface ChatMapper {
	
	public ArrayList<ChatVO> getChatList(String nowTime);
	
	public ArrayList<ChatVO> getChatListByRecent1(int number);
	
	public ArrayList<ChatVO> getChatListByRecent2(int chatId);
	
	public int submit(@Param("chatName") String chatName,@Param("chatContent") String chatContent);
	
	

}
