package com.jeongchan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jeongchan.domain.BoardVO;
import com.jeongchan.domain.Criteria;
import com.jeongchan.domain.Criteria2;

//주석은 매퍼.xml에 작성
public interface BoardMapper {

	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public List<BoardVO> getMyList(@Param("cri") Criteria2 cri,@Param("writer") String writer);

	public void insert(BoardVO board);

	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
	
	//파라미터를 안받아도 되지만 검색할 때 일관성있게 크리테리아 받는것을 추천
	public int getTotalCount(Criteria cri);
	
	public int getMyTotalCount(String writer);
	
	public void updateViewcnt(Long bno);
	
	public void updateReplyCnt(@Param("bno") Long bno,@Param("amount") int amount);
	
	public void updatefileCnt(@Param("bno") Long bno,@Param("fileamount") int fileamount);
	
}
