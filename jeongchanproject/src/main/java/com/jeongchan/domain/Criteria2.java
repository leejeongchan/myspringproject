package com.jeongchan.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria2 {
	private int pageNum; // 페이지 번호
	private int amount; //한 페이지당 데이터 개수
	
	
	public Criteria2() {
		this(1,10); //기본 값을 1페이지 10개로 지정
	}
	
	public Criteria2(int pageNum,int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount());
			
		return builder.toUriString();
	}
}
