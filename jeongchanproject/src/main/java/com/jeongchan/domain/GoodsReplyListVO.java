package com.jeongchan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsReplyListVO {
	private int gdsNum;
	private String userId;
	private int repNum;
	private String repCon;
	private Date repDate;
	
	private String user_name;
}
