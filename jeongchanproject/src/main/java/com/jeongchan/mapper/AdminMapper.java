package com.jeongchan.mapper;

import java.util.List;

import com.jeongchan.domain.CategoryVO;
import com.jeongchan.domain.GoodsReplyListVO;
import com.jeongchan.domain.GoodsVO;
import com.jeongchan.domain.GoodsViewVO;
import com.jeongchan.domain.OrderListVO;
import com.jeongchan.domain.OrderVO;

public interface AdminMapper {
	
	//카테고리 불러오기(관리자)
	public List<CategoryVO> category();
	//상품 등록(관리자)
	public void register(GoodsVO vo);
	//상품 목록(관리자)
	public List<GoodsViewVO> goodsList();
	//상품 목록에서 조회(관리자)
	public GoodsViewVO goodsView(int gdsNum);
	//상품 목록 수정
	public void goodsModify(GoodsVO vo);
	//상품 삭제
	public void goodsDelete(int gdsNum);
	
	public List<OrderVO> orderList();
	public List<OrderListVO> orderView(OrderVO order);
	
	public void delivery(OrderVO order);
	
	public void changeStock(GoodsVO goods);
	
	public List<GoodsReplyListVO> allReply();
	
	public void deleteReply(int repNum);
}
