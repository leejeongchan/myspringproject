package com.jeongchan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FeedVO {
	private Long feedBno; 
	private String feedContent;
	private String feedWriter;
	
	private Date feedRegdate;
	private Date feedUpdatedate;
	
	private int feedReplycnt;
	private int feedLikecnt;

	
}
