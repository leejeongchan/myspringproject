package com.jeongchan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	//private String sessionKey;
	//private Date sessionLimit;
	private String addr1;
	private String addr2;
	private String addr3;
	private String school;
	private String userSkill1;
	private String userSkill2;
	private Date userJoinDate;
	private Date userLoginDate;
	private String userSignature;
	private int userLike;
	private int userAdmin;
	private String userKey;
	
}
