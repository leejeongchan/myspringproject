package com.jeongchan.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeongchan.domain.FeedVO;
import com.jeongchan.service.FeedService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/feed/*")
public class FeedController {

	@Setter(onMethod_ = @Autowired)
	private FeedService feedService;
	
	// servlet-context.xml에서 설정한 uploadPath 불러오기
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@GetMapping("/feedlist")
	public void feedList(Model model) {
		model.addAttribute("feedlist",feedService.getList());
		
	}
	
	@GetMapping("/feedread")
	public void feedRead(@RequestParam("feedBno") Long feedBno,Model model) {
		model.addAttribute("feedread",feedService.read(feedBno));
	}
	
	@GetMapping("/feedwrite")
	public void feedWriteGet() {

	}

	@PostMapping("/feedregister")
	public String feedWritePost(FeedVO feed, RedirectAttributes rttr) {
		feedService.insert(feed);
		rttr.addFlashAttribute("result", feed.getFeedBno());

		return "redirect:/feed/feedlist";
	}

	// ck에서 파일 업로드
	@PostMapping("/ckUpload")
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
			@RequestParam MultipartFile upload) throws Exception {
		log.info("post CKEditor img upload");
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();
		// JsonObject json = new JsonObject();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		try {

			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화

			// String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/ckUpload/" + uid + "_" + fileName; // 작성화면
			// "[{\"value\": \"" + chatList.get(i).getChatName() + "\"}
			// 업로드시 메시지 출력
			// json.addProperty("uploaded", 1);
			// json.addProperty("fileName", fileName);
			// json.addProperty("url", fileUrl);

			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");

			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}
}
