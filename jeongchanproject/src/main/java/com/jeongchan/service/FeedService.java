package com.jeongchan.service;

import java.util.List;

import com.jeongchan.domain.FeedVO;

public interface FeedService {
	//피드 작성
	public void insert(FeedVO feed);
	
	//피드 리스트
	public List<FeedVO> getList();
	
	//피드 상세 조회
	public FeedVO read(Long feedBno);

	
}
