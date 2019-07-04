package com.jeongchan.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jeongchan.domain.CategoryVO;
import com.jeongchan.domain.GoodsReplyListVO;
import com.jeongchan.domain.GoodsVO;
import com.jeongchan.domain.GoodsViewVO;
import com.jeongchan.domain.OrderListVO;
import com.jeongchan.domain.OrderVO;
import com.jeongchan.service.AdminService;
import com.jeongchan.utils.UploadFileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {

	@Setter(onMethod_ = @Autowired)
	private AdminService adminService;
	// servlet-context.xml에서 설정한 uploadPath 불러오기
	@Resource(name = "uploadPath")
	private String uploadPath;

	@GetMapping("/adminview")
	public void adminViewGet() {
		log.info("adminviewController");
	}

	@GetMapping("/goods/register")
	public void goodsRegisterGet(Model model) {
		log.info("admin/goods/register Controller");

		List<CategoryVO> category = null;

		category = adminService.category();
		log.info("category controller: " + category);
		model.addAttribute("category", JSONArray.fromObject(category));
	}

	@PostMapping("/goods/register")
	public String goodsRegisterPost(GoodsVO vo, MultipartFile file) throws IOException, Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (!file.getOriginalFilename().equals("")) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			// gdsImg에 원본 파일 경로 + 파일명 저장
			  vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			  // gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			  vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			fileName = File.separator + "images" + File.separator + "none.png";
			  // 미리 준비된 none.png파일을 대신 출력함
			  
			  vo.setGdsImg(fileName);
			  vo.setGdsThumbImg(fileName);
		}

		
		adminService.register(vo);

		return "redirect:/admin/adminview";
	}

	@GetMapping("/goods/list")
	public void goodsListGet(Model model) {
		log.info("goods list controller");
		List<GoodsViewVO> list = adminService.goodsList();

		model.addAttribute("list", list);
	}

	@GetMapping("/goods/view")
	public void getGoodsView(@RequestParam("n") int gdsNum, Model model) {
		log.info("goods view controler");
		GoodsViewVO goods = adminService.goodsView(gdsNum);

		model.addAttribute("goods", goods);
	}

	@GetMapping("/goods/modify")
	public void getGoodsModify(@RequestParam("n") int gdsNum, Model model) {
		log.info("get goods modify");

		GoodsViewVO goods = adminService.goodsView(gdsNum);
		log.info("GoodsViewVO: " + goods);
		model.addAttribute("goods", goods);

		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}

	// 상품 수정
	@RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
	public String postGoodsModify(GoodsVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		log.info("post goods modify");
		log.info("MultipartFile: "+file.getOriginalFilename());
		log.info("1: "+file.getOriginalFilename()!= null);
		log.info("2: "+file.getOriginalFilename().equals(""));
		// 새로운 파일이 등록되었는지 확인
		if (!file.getOriginalFilename().equals("")) {
			// 기존 파일을 삭제
			log.info("if문 걸림");
			new File(uploadPath + req.getParameter("gdsImg")).delete();
			new File(uploadPath + req.getParameter("gdsThumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setGdsThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			log.info("else문 걸림");
			vo.setGdsImg(req.getParameter("gdsImg"));
			vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));

		}

		adminService.goodsModify(vo);

		return "redirect:/admin/adminview";
	}

	@PostMapping("/goods/delete")
	public String postGoodsDelete(@RequestParam("n") int gdsNum) {
		log.info("post goods delete");
		adminService.goodsDelete(gdsNum);
		return "redirect:/admin/adminview";
	}
	
	//ck에서 파일 업로드
	@PostMapping("/goods/ckUpload")
	public void postCKEditorImgUpload(HttpServletRequest req,HttpServletResponse res,@RequestParam MultipartFile upload) throws Exception{
		log.info("post CKEditor img upload");
		// 랜덤 문자 생성
		 UUID uid = UUID.randomUUID();
		 //JsonObject json = new JsonObject();
		 


		 OutputStream out = null;
		 PrintWriter printWriter = null;
		   
		 // 인코딩
		 res.setCharacterEncoding("utf-8");
		 res.setContentType("text/html;charset=utf-8");
		 
		 try {
		  
		  String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
		  byte[] bytes = upload.getBytes();
		  
		  // 업로드 경로
		  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
		  
		  out = new FileOutputStream(new File(ckUploadPath));
		  out.write(bytes);
		  out.flush();  // out에 저장된 데이터를 전송하고 초기화
		  
		  //String callback = req.getParameter("CKEditorFuncNum");
		  printWriter = res.getWriter();
		  String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // 작성화면
		 // "[{\"value\": \"" + chatList.get(i).getChatName() + "\"}
		  // 업로드시 메시지 출력
		  //json.addProperty("uploaded", 1);
         // json.addProperty("fileName", fileName);
          //json.addProperty("url", fileUrl);



		  printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
		  
		  printWriter.flush();
		  
		 } catch (IOException e) { e.printStackTrace();
		 } finally {
		  try {
		   if(out != null) { out.close(); }
		   if(printWriter != null) { printWriter.close(); }
		  } catch(IOException e) { e.printStackTrace(); }
		 }
		 
		 return; 
	}
	
	// 주문 목록
	@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception {
	 
	   
	 List<OrderVO> orderList = adminService.orderList();
	 
	 model.addAttribute("orderList", orderList);
	}

	// 주문 상세 목록
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
	public void getOrderList(@RequestParam("n") String orderId,
	      OrderVO order, Model model) throws Exception {
	
	 order.setOrderId(orderId);  
	 List<OrderListVO> orderView = adminService.orderView(order);
	 
	 model.addAttribute("orderView", orderView);
	}
	
	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
	 
	   
	 adminService.delivery(order);
	 
	 List<OrderListVO> orderView = adminService.orderView(order);
	 GoodsVO goods = new GoodsVO();
	 
	 for(OrderListVO i : orderView) {
		 goods.setGdsNum(i.getGdsNum());
		 goods.setGdsStock(i.getCartStock());
		 adminService.changeStock(goods);
	 }
	 
	 
	 return "redirect:/admin/shop/orderView?n=" + order.getOrderId();
	}
	
	@GetMapping("/shop/allReply")
	public void getAllReply(Model model) {
		List<GoodsReplyListVO> reply = adminService.allReply();
		
		model.addAttribute("reply",reply);
	}
	
	@PostMapping("/shop/deleteReply")
	public String deleteReply(int repNum) {
		adminService.deleteReply(repNum);
		return "redirect:/admin/shop/allReply";
	}

}
