package com.jeongchan.domain;

import lombok.Data;

@Data
public class LoginDTO {
	private String userId;
	private String userPw;
	private boolean useCookie;
}
