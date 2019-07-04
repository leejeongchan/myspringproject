package com.jeongchan.service;

import java.util.List;

import com.jeongchan.domain.CartListVO;
import com.jeongchan.domain.CartVO;
import com.jeongchan.domain.GoodsReplyListVO;
import com.jeongchan.domain.GoodsReplyVO;
import com.jeongchan.domain.GoodsViewVO;
import com.jeongchan.domain.OrderDetailVO;
import com.jeongchan.domain.OrderListVO;
import com.jeongchan.domain.OrderVO;

public interface ShopService {
	//카테고리 1차, 2차를 level에서 분리함 메퍼부분에 1차 2차를 나누어서 쿼리 작성함 별 상품 리스트
	public List<GoodsViewVO> list(int cateCode,int level);
	//상품 조회
	public GoodsViewVO goodsView(int gdsNum);
	//상품 후기
	public void registReply(GoodsReplyVO reply);
	//상품 후기 목록
	public List<GoodsReplyListVO> replyList(int gdsNum);
	//상품 삭제
	public void deleteReply(GoodsReplyVO reply);
	//상품 수정
	public void modifyReply(GoodsReplyVO reply);
	
	//아아디체크
	public String idCheck(int repNum);
	//카트담기
	public void addCart(CartVO cart);
	
	//카트리스트
	public List<CartListVO> cartList(String userId);
	//카트 삭제
	public void deleteCart(CartVO cart);
	
	//주문 정보
	public void orderInfo(OrderVO order);
	//주문 상세정보
	public void orderInfo_Details(OrderDetailVO orderDetail);
	//카트 비우기
	public void cartAllDelete(String userId);
	//주문 정보 리스트
	public List<OrderVO> orderList(OrderVO order);
	//주문 상세 정보 리스트
	public List<OrderListVO> orderView(OrderVO order);

}
