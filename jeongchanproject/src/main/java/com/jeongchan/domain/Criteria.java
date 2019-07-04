package com.jeongchan.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum; // 페이지 번호
	private int amount; //한 페이지당 데이터 개수
	
	//검색 처리를 위한 필드
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,10); //기본 값을 1페이지 10개로 지정
	}
	
	public Criteria(int pageNum,int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	//타입 여러개시 스플릿하여 분리하여 리턴 스트링 배열로
	//마이바티스 동적 태그를 활용하기 위함
	//TC이면 T와 C로 분리
	public String[] getTypeArr() {
		return type==null?new String[] {}:type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}
}
