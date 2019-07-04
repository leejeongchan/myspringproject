package com.jeongchan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderListVO {
	//총 3개 조인
	private String orderId;
	private String userId;
	private String orderRec;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String orderPhon;
	private int amount;
	private Date orderDate;
	private String delivery;
	
	
	private int gdsNum; //이를 통해 상품 정보 조인
	private int cartStock;
	
	private String gdsName;
	private String gdsThumbImg;
	private int gdsPrice;
}
