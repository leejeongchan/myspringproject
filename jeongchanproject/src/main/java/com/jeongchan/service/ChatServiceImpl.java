package com.jeongchan.service;

import java.util.ArrayList;
import java.util.Iterator;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeongchan.domain.ChatVO;
import com.jeongchan.mapper.ChatMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ChatServiceImpl implements ChatService{
	
	@Setter(onMethod_=@Autowired)
	private ChatMapper chatMapper;
	
	@Override
	public ArrayList<ChatVO> getChatList(String nowTime) {
		// TODO Auto-generated method stub
		ArrayList<ChatVO> chatList = new ArrayList<ChatVO>();
		ArrayList<ChatVO> chatList2 = new ArrayList<ChatVO>();

		chatList = chatMapper.getChatList(nowTime);
		log.info("chatList: "+chatList);
		Iterator<ChatVO> iter = ((ArrayList<ChatVO>) chatList.clone()).iterator();

		int i=0;
		while(iter.hasNext()) {
			ChatVO chatVO1 = new ChatVO();
			ChatVO chatVO2 = new ChatVO();
			chatVO2 = iter.next();
			log.info(i+"chatVO2: "+chatVO2);

			chatVO1.setChatId(chatVO2.getChatId());
			chatVO1.setChatName(chatVO2.getChatName());
			chatVO1.setChatContent(chatVO2.getChatContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
			int chatTime = Integer.parseInt(chatVO2.getChatTime().substring(11,13));
			String timeType="오전";
			if(Integer.parseInt(chatVO2.getChatTime().substring(11,13))>12) {
				timeType="오후";
				chatTime-=12;
			}
			chatVO1.setChatTime(chatVO2.getChatTime().substring(0, 11)+" "+timeType+" "+chatTime+":"+chatVO2.getChatTime().substring(14, 16)+"");
			
				chatList2.add(chatVO1);
			//iter.remove();
			log.info(i+"chatList2: "+chatList2);
			i++;
		}
		log.info("iter count: "+i);
		log.info(i+1+"chatList2 return to ListController: "+chatList2);

		return chatList2;
	}

	@Override
	public ArrayList<ChatVO> getChatListByRecent1(int number) {
		// TODO Auto-generated method stub
		ArrayList<ChatVO> chatList = new ArrayList<ChatVO>();
		ArrayList<ChatVO> chatList2 = new ArrayList<ChatVO>();
		log.info("number: "+number);
		chatList = chatMapper.getChatListByRecent1(number);
		log.info("chatList: "+chatList);
		Iterator<ChatVO> iter = ((ArrayList<ChatVO>) chatList.clone()).iterator();
		int i=0;
		
		while(iter.hasNext()) {
			ChatVO chatVO1 = new ChatVO();
			ChatVO chatVO2 = new ChatVO();
			chatVO2 = iter.next();
			log.info(i+"chatVO2: "+chatVO2);
			chatVO1.setChatId(chatVO2.getChatId());
			chatVO1.setChatName(chatVO2.getChatName());
			chatVO1.setChatContent(chatVO2.getChatContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
			int chatTime = Integer.parseInt(chatVO2.getChatTime().substring(11,13));
			String timeType="오전";
			if(Integer.parseInt(chatVO2.getChatTime().substring(11,13))>12) {
				timeType="오후";
				chatTime-=12;
			}
			chatVO1.setChatTime(chatVO2.getChatTime().substring(0, 11)+" "+timeType+" "+chatTime+":"+chatVO2.getChatTime().substring(14, 16)+"");
			
			log.info(i+"chatV01"+chatVO1);
			
			
				chatList2.add(chatVO1);
			log.info(i+"chatList2: "+chatList2);
			//iter.remove();
			i++;
		}
		log.info("iter count: "+i);
		
		log.info(i+1+"chatList2 return to ListController: "+chatList2);
		return chatList2;
	}

	@Override
	public ArrayList<ChatVO> getChatListByRecent2(String chatId) {
		// TODO Auto-generated method stub
		ArrayList<ChatVO> chatList = new ArrayList<ChatVO>();
		ArrayList<ChatVO> chatList2 = new ArrayList<ChatVO>();

		chatList = chatMapper.getChatListByRecent2(Integer.parseInt(chatId));
		log.info("chatList: "+chatList);
		
		Iterator<ChatVO> iter = ((ArrayList<ChatVO>) chatList.clone()).iterator();

		
		int i=0;
		

		while(iter.hasNext()) {
			ChatVO chatVO1 = new ChatVO();
			ChatVO chatVO2 = new ChatVO();
			chatVO2 = iter.next();
			log.info(i+"chatVO2: "+chatVO2);

			chatVO1.setChatId(chatVO2.getChatId());
			chatVO1.setChatName(chatVO2.getChatName());
			chatVO1.setChatContent(chatVO2.getChatContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
			int chatTime = Integer.parseInt(chatVO2.getChatTime().substring(11,13));
			String timeType="오전";
			if(Integer.parseInt(chatVO2.getChatTime().substring(11,13))>12) {
				timeType="오후";
				chatTime-=12;
			}
			chatVO1.setChatTime(chatVO2.getChatTime().substring(0, 11)+" "+timeType+" "+chatTime+":"+chatVO2.getChatTime().substring(14, 16)+"");
			log.info(i+"chatV01"+chatVO1);
			
				chatList2.add(chatVO1);
			

			log.info(i+"chatList2: "+chatList2);
			//iter.remove();
			i++;
		}
		log.info("iter count: "+i);
		
		log.info(i+1+"chatList2 return to ListController: "+chatList2);

		return chatList2;
	}

	@Override
	public int submit(String chatName, String chatContent) {
		// TODO Auto-generated method stub
		int count =chatMapper.submit(chatName, chatContent);
		if(count == 1) {
			return count;
		}
		return -1;
	}

}
