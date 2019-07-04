package com.jeongchan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeongchan.domain.CartListVO;
import com.jeongchan.domain.CartVO;
import com.jeongchan.domain.GoodsReplyListVO;
import com.jeongchan.domain.GoodsReplyVO;
import com.jeongchan.domain.GoodsViewVO;
import com.jeongchan.domain.OrderDetailVO;
import com.jeongchan.domain.OrderListVO;
import com.jeongchan.domain.OrderVO;
import com.jeongchan.mapper.ShopMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ShopServiceImpl implements ShopService{
	
	@Setter(onMethod_=@Autowired)
	private ShopMapper shopMapper;
	
	@Override
	public List<GoodsViewVO> list(int cateCode,int level) {
		// TODO Auto-generated method stub
		int cateCodeRef = 0;
		if(level == 1) { //1차 분류
			cateCodeRef = cateCode;
			return shopMapper.list_1(cateCode,cateCodeRef);
		}else { //2차 분류
			return shopMapper.list_2(cateCode);
		}
		
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) {
		// TODO Auto-generated method stub
		return shopMapper.goodsView(gdsNum);
	}

	@Override
	public void registReply(GoodsReplyVO reply) {
		// TODO Auto-generated method stub
		shopMapper.registReply(reply);
	}

	@Override
	public List<GoodsReplyListVO> replyList(int gdsNum) {
		// TODO Auto-generated method stub
		return shopMapper.replyList(gdsNum);
	}

	@Override
	public void deleteReply(GoodsReplyVO reply) {
		// TODO Auto-generated method stub
		shopMapper.deleteReply(reply);
	}

	@Override
	public String idCheck(int repNum) {
		// TODO Auto-generated method stub
		return shopMapper.idCheck(repNum);
	}

	@Override
	public void modifyReply(GoodsReplyVO reply) {
		// TODO Auto-generated method stub
		shopMapper.modifyReply(reply);
	}

	@Override
	public void addCart(CartVO cart) {
		// TODO Auto-generated method stub
		shopMapper.addCart(cart);
	}

	@Override
	public List<CartListVO> cartList(String userId) {
		// TODO Auto-generated method stub
		return shopMapper.cartList(userId);
	}

	@Override
	public void deleteCart(CartVO cart) {
		// TODO Auto-generated method stub
		shopMapper.deleteCart(cart);
	}

	@Override
	public void orderInfo(OrderVO order) {
		// TODO Auto-generated method stub
		shopMapper.orderInfo(order);
	}

	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) {
		// TODO Auto-generated method stub
		log.info("orderInfo_Details Call");
		shopMapper.orderInfo_Details(orderDetail);
		
	}

	@Override
	public void cartAllDelete(String userId) {
		// TODO Auto-generated method stub
		shopMapper.cartAllDelete(userId);
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) {
		// TODO Auto-generated method stub
		return shopMapper.orderList(order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) {
		// TODO Auto-generated method stub
		return shopMapper.orderView(order);
	}

}
