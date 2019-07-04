package com.jeongchan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsReplyVO {
	private int gdsNum;
	private String userId;
	private int repNum;
	private String repCon;
	private Date repDate;
}
