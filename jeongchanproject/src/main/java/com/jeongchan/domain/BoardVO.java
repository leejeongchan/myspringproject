package com.jeongchan.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Long viewcnt;
	
	private Date regdate;
	private Date updateDate;
	
	private int replyCnt;
	private int filecnt;
	//첨부파일
	private List<BoardAttachVO> attachList;
	
}
