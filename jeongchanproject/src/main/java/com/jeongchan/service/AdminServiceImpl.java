package com.jeongchan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeongchan.domain.CategoryVO;
import com.jeongchan.domain.GoodsReplyListVO;
import com.jeongchan.domain.GoodsVO;
import com.jeongchan.domain.GoodsViewVO;
import com.jeongchan.domain.OrderListVO;
import com.jeongchan.domain.OrderVO;
import com.jeongchan.mapper.AdminMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Setter(onMethod_=@Autowired)
	private AdminMapper adminMapper;
	
	@Override
	public List<CategoryVO> category() {
		// TODO Auto-generated method stub
		return adminMapper.category();
	}

	@Override
	public void register(GoodsVO vo) {
		// TODO Auto-generated method stub
		adminMapper.register(vo);
	}

	@Override
	public List<GoodsViewVO> goodsList() {
		// TODO Auto-generated method stub
		return adminMapper.goodsList();
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) {
		// TODO Auto-generated method stub
		return adminMapper.goodsView(gdsNum);
	}

	@Override
	public void goodsModify(GoodsVO vo) {
		// TODO Auto-generated method stub
		adminMapper.goodsModify(vo);
	}

	@Override
	public void goodsDelete(int gdsNum) {
		// TODO Auto-generated method stub
		adminMapper.goodsDelete(gdsNum);
	}

	@Override
	public List<OrderVO> orderList() {
		// TODO Auto-generated method stub
		return adminMapper.orderList();
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) {
		// TODO Auto-generated method stub
		return adminMapper.orderView(order);
	}

	@Override
	public void delivery(OrderVO order) {
		// TODO Auto-generated method stub
		adminMapper.delivery(order);
	}

	@Override
	public void changeStock(GoodsVO goods) {
		// TODO Auto-generated method stub
		adminMapper.changeStock(goods);
	}

	@Override
	public List<GoodsReplyListVO> allReply() {
		// TODO Auto-generated method stub
		return adminMapper.allReply();
	}

	@Override
	public void deleteReply(int repNum) {
		// TODO Auto-generated method stub
		adminMapper.deleteReply(repNum);
	}

}
