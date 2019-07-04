package com.jeongchan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jeongchan.domain.CartListVO;
import com.jeongchan.domain.CartVO;
import com.jeongchan.domain.GoodsReplyListVO;
import com.jeongchan.domain.GoodsReplyVO;
import com.jeongchan.domain.GoodsViewVO;
import com.jeongchan.domain.OrderDetailVO;
import com.jeongchan.domain.OrderListVO;
import com.jeongchan.domain.OrderVO;

public interface ShopMapper {
	
	//상품 1차 카테고리별 리스트
	public List<GoodsViewVO> list_2(int cateCode);
	//상품 2차 카테고리별 리스트
	public List<GoodsViewVO> list_1(@Param("cateCode") int cateCode,@Param("cateCodeRef") int cateCodeRef);
	//상품 조회
	public GoodsViewVO goodsView(int gdsNum);
	
	public void registReply(GoodsReplyVO reply);
	
	public List<GoodsReplyListVO> replyList(int gdsNum);
	
	public void deleteReply(GoodsReplyVO reply);
	
	public void modifyReply(GoodsReplyVO reply);
	
	public String idCheck(int repNum);
	
	public void addCart(CartVO cart);
	
	public List<CartListVO> cartList(String userId);
	
	public void deleteCart(CartVO cart);
	
	public void orderInfo(OrderVO order);
	
	public void orderInfo_Details(OrderDetailVO orderDetail);
	
	public void cartAllDelete(String userId);
	
	public List<OrderVO> orderList(OrderVO order);
	
	public List<OrderListVO> orderView(OrderVO order);
}
