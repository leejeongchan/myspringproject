package com.jeongchan.service;

import java.util.Date;
import java.util.List;

import com.jeongchan.domain.Criteria2;
import com.jeongchan.domain.LoginDTO;
import com.jeongchan.domain.UserVO;

public interface UserService {
	public void register(UserVO userVO);
	
	//컨트롤러에서 비밀번호 검증
	public UserVO login(LoginDTO loginDTO);
	public UserVO loginById(String userId);
	public void keepLogin(String userId, String sessionId, Date sessionLimit);
	
	public UserVO checkLoginBefore(String value);
	
	public int idcheck(String userId);
	
	public void updateInfo(UserVO userVO);
	
	public UserVO searchUser(String userId);
	
	public List<UserVO> userList(Criteria2 cri);
	
	public List<UserVO> userthreepeople();
	
	public int userCount();
	
	public int likeCount(String userId);
	
	public int updateAdmin(String userId);
	
	public int GetKey(String userId,String userKey);
	
	public int alter_userKey(String userId, String userKey);
}
