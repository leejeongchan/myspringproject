package com.jeongchan.service;

import java.util.List;

import com.jeongchan.domain.CategoryVO;
import com.jeongchan.domain.GoodsReplyListVO;
import com.jeongchan.domain.GoodsVO;
import com.jeongchan.domain.GoodsViewVO;
import com.jeongchan.domain.OrderListVO;
import com.jeongchan.domain.OrderVO;

public interface AdminService {
	// 카테고리
	public List<CategoryVO> category();

	// 상품 등록
	public void register(GoodsVO vo);

	// 상품 목록
	public List<GoodsViewVO> goodsList();

	// 상품 조회(조인)
	public GoodsViewVO goodsView(int gdsNum);

	// 상품 수정
	public void goodsModify(GoodsVO vo);

	// 상품 삭제
	public void goodsDelete(int gdsNum);
	
	//주문 목록
	public List<OrderVO> orderList();
	//주문 상세 목록
	public List<OrderListVO> orderView(OrderVO order);
	//배송 상태 변경
	public void delivery(OrderVO order);
	//주문수량 변경
	public void changeStock(GoodsVO goods);
	//모든 소감 목록
	public List<GoodsReplyListVO> allReply();
	//소감 삭제
	public void deleteReply(int repNum);
}
