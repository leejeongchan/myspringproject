package com.jeongchan.domain;

import lombok.Getter;
import lombok.ToString;

//페이지 처리 클래스
@Getter
@ToString
public class PageDTO {
	private int startPage; //화면에 보여지는 시작 페이지 번호
	private int endPage;//화면에 보여지는 마지막 페이지 번호
	private boolean prev,next;
	
	private int total;//전체 글 개수
	private Criteria cri;
	
	public PageDTO(Criteria cri,int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage = this.endPage - 9;
		//실제 끝페이지 번호 조정(총 개수로 조정하기)
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		
		//만약 실제 끝페이지 번호가 앞서 구한 endPage보다 작은 경우 줄여줘야하므로 realEnd로 수정
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage>1;
		this.next = this.endPage <realEnd;
		
		
	}
}
