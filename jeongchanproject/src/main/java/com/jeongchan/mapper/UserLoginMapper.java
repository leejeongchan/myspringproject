package com.jeongchan.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import com.jeongchan.domain.LoginDTO;
import com.jeongchan.domain.UserVO;

public interface UserLoginMapper {

	public UserVO login(LoginDTO loginDTO);
	public UserVO loginById(String userId);
	// 로그인 유지 처리
	public void keepLogin(@Param("userId") String userId, @Param("sessionId") String sessionId,
			@Param("sessionLimit") Date sessionLimit);

	// 세션키 검증
	public UserVO checkUserWithSessionKey(String value);
}
