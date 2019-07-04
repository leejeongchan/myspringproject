package com.jeongchan.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeongchan.domain.Criteria2;
import com.jeongchan.domain.LoginDTO;
import com.jeongchan.domain.UserVO;
import com.jeongchan.mapper.UserLoginMapper;
import com.jeongchan.mapper.UserMapper;

import lombok.Setter;

@Service
public class UserServiceImpl implements UserService{

	@Setter(onMethod_=@Autowired)
	private UserMapper userMapper;
	
	@Setter(onMethod_=@Autowired)
	private UserLoginMapper userLoginMapper;
	
	@Override
	public void register(UserVO userVO) {
		// TODO Auto-generated method stub
		userMapper.register(userVO);
	}

	@Override
	public UserVO login(LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		return userLoginMapper.login(loginDTO);
	}

	@Override
	public void keepLogin(String userId, String sessionId, Date sessionLimit) {
		// TODO Auto-generated method stub
		userLoginMapper.keepLogin(userId, sessionId, sessionLimit);
	}

	@Override
	public UserVO checkLoginBefore(String value) {
		// TODO Auto-generated method stub
		return userLoginMapper.checkUserWithSessionKey(value);
	}

	@Override
	public int idcheck(String userId) {
		// TODO Auto-generated method stub
		return userMapper.idcheck(userId);
	}

	@Override
	public void updateInfo(UserVO userVO) {
		// TODO Auto-generated method stub
		userMapper.updateInfo(userVO);
	}

	@Override
	public UserVO loginById(String userId) {
		// TODO Auto-generated method stub
		return userLoginMapper.loginById(userId);
	}

	@Override
	public UserVO searchUser(String userId) {
		// TODO Auto-generated method stub
		
		return userMapper.searchUser(userId);
	}

	@Override
	public List<UserVO> userList(Criteria2 cri) {
		// TODO Auto-generated method stub
		return userMapper.userList(cri);
	}

	@Override
	public int userCount() {
		// TODO Auto-generated method stub
		return userMapper.userCount();
	}

	@Override
	public int likeCount(String userId) {
		// TODO Auto-generated method stub
		return userMapper.likeCount(userId);
	}

	@Override
	public List<UserVO> userthreepeople() {
		// TODO Auto-generated method stub
		return userMapper.userthreepeople();
	}

	@Override
	public int updateAdmin(String userId) {
		// TODO Auto-generated method stub
		return userMapper.updateAdmin(userId);
	}

	@Override
	public int GetKey(String userId, String userKey) {
		// TODO Auto-generated method stub
		return userMapper.GetKey(userId, userKey);
	}

	@Override
	public int alter_userKey(String userId, String userKey) {
		// TODO Auto-generated method stub
		return userMapper.alter_userKey(userId, userKey);
	}

}
