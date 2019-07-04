package com.jeongchan.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jeongchan.domain.Criteria2;
import com.jeongchan.domain.UserVO;

public interface UserMapper {
	
	public void register(UserVO userVO);
	
	//중복확인
	public int idcheck(String userId);

	//개인정보 수정
	public void updateInfo(UserVO userVO);
	
	//유저 찾기
	public UserVO searchUser(String userId);
	
	//유저 목록 조회
	public List<UserVO> userList(Criteria2 cri);
	
	//유저 총 회원 수 
	public int userCount();
	
	//추천 수 증가
	public int likeCount(String userId);
	
	//최상위 3인 조회
	public List<UserVO> userthreepeople();
	//관리자 계정으로 전환
	public int updateAdmin(String userId);
	
	//인증키 업데이트
	public int GetKey(@Param("userId") String userId, @Param("userKey") String userKey);
	
	//인증완료시 키 Y로 바꾸기 
	public int alter_userKey(@Param("userId") String userId,@Param("userKey") String userKey);
}
