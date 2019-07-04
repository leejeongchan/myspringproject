package com.jeongchan.domain;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int orderDetailsNum;
	private String orderId;
	private int gdsNum; //이를 통해 상품 정보 
	private int cartStock;
}
