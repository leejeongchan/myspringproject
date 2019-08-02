package com.jeongchan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeongchan.domain.FeedVO;
import com.jeongchan.mapper.FeedMapper;

import lombok.Setter;

@Service
public class FeedServiceImpl implements FeedService {
	
	@Setter(onMethod_=@Autowired)
	private FeedMapper feedmapper;
	
	@Override
	public void insert(FeedVO feed) {
		// TODO Auto-generated method stub
		feedmapper.insert(feed);
	}

	@Override
	public List<FeedVO> getList() {
		// TODO Auto-generated method stub
		return feedmapper.getList();
	}

	@Override
	public FeedVO read(Long feedBno) {
		// TODO Auto-generated method stub
		return feedmapper.read(feedBno);
	}

}
