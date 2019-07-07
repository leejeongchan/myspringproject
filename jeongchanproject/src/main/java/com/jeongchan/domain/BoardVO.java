package com.jeongchan.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
/*
 * @Auth : Lee Jeong Chan
 * bno: board number
 * content: board content
 * writer: board writer
 * viewcnt: if you enter specific board item, view Count is increased by user
 * regdate: the date register post board
 * updateDate: the date register modify board
 * replycnt: in specific board , the reply count registered by user
 * filecnt: in specific board , the attached file count
 */
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
