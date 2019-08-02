package com.jeongchan.mapper;

import java.util.List;

import com.jeongchan.domain.FeedVO;

public interface FeedMapper {
	
	public List<FeedVO> getList();
	
	public void insert(FeedVO feed);

	public void insertSelectKey(FeedVO feed);
	
	public FeedVO read(Long feedBno);
	
	public int delete(Long feedBno);
	
	public int update(FeedVO feed);
}
