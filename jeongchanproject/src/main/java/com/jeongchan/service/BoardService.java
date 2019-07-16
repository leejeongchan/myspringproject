package com.jeongchan.service;

import java.util.List;


import com.jeongchan.domain.BoardAttachVO;

import com.jeongchan.domain.BoardVO;
import com.jeongchan.domain.Criteria;
import com.jeongchan.domain.Criteria2;

public interface BoardService {
	//게시글 등록 서비스
	public void register(BoardVO board);
	
	//특정 게시글 조회 서비스
	public BoardVO get(Long bno);
	//특정 게시글 수정 서비스
	public BoardVO get2(Long bno);
	//게시글 수정 서비스
	public boolean modify(BoardVO board);
	
	//특정 게시글 삭제 서비스
	public boolean remove(Long bno);
	
	//게시글 페이징 전체 조회 
	//public List<BoardVO> getList();
	public List<BoardVO> getList(Criteria cri);
	
	//내 게시글 페이징 조회
	public List<BoardVO> getMyList(Criteria2 cri,String writer);
	
	public int getTotal(Criteria cri);
	
	public int getMyTotal(String writer);
	
	public List<BoardAttachVO> getAttachList(Long bno);
	
	
}
