package com.jeongchan.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeongchan.domain.CartListVO;
import com.jeongchan.domain.CartVO;
import com.jeongchan.domain.GoodsReplyListVO;
import com.jeongchan.domain.GoodsReplyVO;
import com.jeongchan.domain.GoodsViewVO;
import com.jeongchan.domain.OrderDetailVO;
import com.jeongchan.domain.OrderListVO;
import com.jeongchan.domain.OrderVO;
import com.jeongchan.domain.UserVO;
import com.jeongchan.service.ShopService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/*")
public class ShopController {

	@Setter(onMethod_ = @Autowired)
	private ShopService shopService;

	@GetMapping("/list")
	public void shopListGet(@RequestParam("c") int cateCode, @RequestParam("l") int level, Model model) {
		log.info("shop list...");

		List<GoodsViewVO> list = null;
		list = shopService.list(cateCode, level);

		model.addAttribute("list", list);
	}

	@GetMapping("/view")
	public void shopViewGet(@RequestParam("n") int gdsNum, Model model) {
		log.info("get View");

		GoodsViewVO view = shopService.goodsView(gdsNum);
		model.addAttribute("view", view);

		/*
		 * List<GoodsReplyListVO> reply = shopService.replyList(gdsNum);
		 * model.addAttribute("reply",reply);
		 */
	}

	/*
	 * @PostMapping("/view") public String registReply(GoodsReplyVO
	 * reply,HttpSession session) { log.info("regist reply"); UserVO member =
	 * (UserVO)session.getAttribute("login"); reply.setUserId(member.getUserId());
	 * 
	 * shopService.registReply(reply);
	 * 
	 * return "redirect:/shop/view?n="+reply.getGdsNum(); }
	 */

	@ResponseBody
	@GetMapping("/view/replyList")
	public List<GoodsReplyListVO> getReplyList(@RequestParam("n") int gdsNum) {
		log.info("ajax get reply list");
		List<GoodsReplyListVO> reply = shopService.replyList(gdsNum);
		return reply;
	}

	@ResponseBody
	@PostMapping("/view/registReply")
	public void registReply(GoodsReplyVO reply, HttpSession session) {
		log.info("ajax regist reply");
		UserVO user = (UserVO) session.getAttribute("login");
		reply.setUserId(user.getUserId());

		shopService.registReply(reply);
	}

	@ResponseBody
	@PostMapping("/view/deleteReply")
	public int deleteReply(GoodsReplyVO reply, HttpSession session) {
		log.info("delete reply");
		int result = 0;
		UserVO user = (UserVO) session.getAttribute("login");
		log.info("repNum: " + reply.getRepNum());
		String userId = shopService.idCheck(reply.getRepNum());
		log.info("session userId: " + user.getUserId() + " userId: " + userId);
		if (user.getUserId().equals(userId)) {
			reply.setUserId(user.getUserId());
			shopService.deleteReply(reply);
			log.info("delete complete");
			result = 1;
			log.info("result value: " + result);
		}
		return result;

	}

	@ResponseBody
	@PostMapping("/view/modifyReply")
	public int modifyReply(GoodsReplyVO reply, HttpSession session) {
		log.info("modify reply");

		int result = 0;
		UserVO user = (UserVO) session.getAttribute("login");
		log.info("repNum: " + reply.getRepNum());
		String userId = shopService.idCheck(reply.getRepNum());
		log.info("session userId: " + user.getUserId() + " userId: " + userId);
		if (user.getUserId().equals(userId)) {
			reply.setUserId(user.getUserId());
			shopService.modifyReply(reply);
			log.info("modify complete");
			result = 1;
			log.info("result value: " + result);
		}
		return result;
	}

	// 카트담기
	@ResponseBody
	@PostMapping("/view/addCart")
	public int addCart(CartVO cart, HttpSession session) {
		int result = 0;
		UserVO member = (UserVO) session.getAttribute("login");
		if (member != null) {
			cart.setUserId(member.getUserId());
			shopService.addCart(cart);
			result = 1;
		}
		return result;

	}

	// 카트 목록
	@GetMapping("/cartList")
	public void getCartList(HttpSession session, Model model) {
		log.info("cart List");
		UserVO member = (UserVO) session.getAttribute("login");
		
		String userId = member.getUserId();
		List<CartListVO> cartList = shopService.cartList(userId);

		model.addAttribute("cartList", cartList);

	}

	// 주문
	@PostMapping("/cartList")
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) {
		log.info("order : "+order);
		log.info("orderDetail: "+orderDetail);
		
		UserVO member = (UserVO) session.getAttribute("login");
		String userId = member.getUserId();
		
		Calendar cal =Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i = 1; i<=6; i++) {
			subNum += (int)(Math.random()*10);
		}
		String orderId = ymd + "_" + subNum;
		order.setOrderId(orderId);
		order.setUserId(userId);
		
		shopService.orderInfo(order);
		
		orderDetail.setOrderId(orderId);
		shopService.orderInfo_Details(orderDetail);
		shopService.cartAllDelete(userId);
		
		return "redirect:/";
	}

	// 카트 삭제
	@ResponseBody
	@PostMapping("/deleteCart")
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) {
		log.info("cart delete");

		UserVO member = (UserVO) session.getAttribute("login");
		String userId = member.getUserId();

		int result = 0;
		int cartNum = 0;
		if (member != null) {
			cart.setUserId(userId);
			for (String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				shopService.deleteCart(cart);

			}
			result = 1;

		}
		return result;
	}
	
	@GetMapping("/orderList")
	public void getOrderList(HttpSession session,OrderVO order,Model model) {
		log.info("order List");
		
		UserVO member = (UserVO)session.getAttribute("login");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		
		List<OrderVO> orderList = shopService.orderList(order);
		
		model.addAttribute("orderList",orderList);
	}
	
	@GetMapping("/orderView")
	public void getOrderList(HttpSession session,@RequestParam("n") String orderId,OrderVO order,Model model) {
		log.info("get order view");
		
		UserVO member = (UserVO)session.getAttribute("login");
		String userId = member.getUserId();
		order.setUserId(userId);
		order.setOrderId(orderId);
		
		List<OrderListVO> orderView = shopService.orderView(order);
		log.info("orderView: "+orderView);
		model.addAttribute("orderView",orderView);
	}

}
