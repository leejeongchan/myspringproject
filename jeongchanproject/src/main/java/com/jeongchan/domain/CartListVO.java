package com.jeongchan.domain;

import java.util.Date;

import lombok.Data;
@Data
public class CartListVO {
	//카트 테이블
	private int cartNum;
	private String userId;
	private int gdsNum;
	private int cartStock;
	private Date addDate;
	
	//조인
	
	//상품테이블
	private int num;
	private String gdsName;
	private int gdsPrice;
	private String gdsThumbImg;
	
}
