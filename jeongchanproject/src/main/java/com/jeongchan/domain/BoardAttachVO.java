package com.jeongchan.domain;

import lombok.Data;
/*
 * 첨부파일 VO
 */
@Data
public class BoardAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long bno;
}
