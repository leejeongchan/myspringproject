package com.jeongchan.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.jeongchan.domain.BoardAttachVO;

import com.jeongchan.domain.BoardVO;
import com.jeongchan.domain.Criteria;
import com.jeongchan.domain.PageDTO;
import com.jeongchan.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;

	// 게시글 목록 조회 /board/list 경로
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list :" + cri);
		model.addAttribute("list", service.getList(cri));
		// model.addAttribute("pageMaker",new PageDTO(cri,123));
		int total = service.getTotal(cri);
		System.out.println("total count: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// 게시글 등록 페이지 이동
	@GetMapping("/register")
	public void register() {

	}

	// 게시글 등록누르면 처리 컨트롤러 /borad/register
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("=====================================");

		log.info("register: " + board);
		if (board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("=====================================");

		service.register(board);
		// 등록 글 번호 모달 창 띄우기 위함
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}

	// 게시글 특정 조회
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}

	// 게시글 수정 조회
	@GetMapping("/modify")
	public void get2(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/get or modify");
		model.addAttribute("board", service.get2(bno));
	}

	// 게시글 수정 컨트롤러 수정 후 성공이면 리다이렉트로 result를 넘겨 주고 리다이렉트로 리스트로 이동
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		log.info("modify: " + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		// 전달 받은 페이지번호와 개수를 함께 넘긴다. get에서 리스트로넘어갈때 넘기는 원리
		/*
		 * rttr.addAttribute("pageNum",cri.getPageNum());
		 * rttr.addAttribute("amount",cri.getAmount());
		 * rttr.addAttribute("type",cri.getType());
		 * rttr.addAttribute("keyword",cri.getKeyword());
		 */

		return "redirect:/board/list" + cri.getListLink();
	}

	// Ajax형식으로 GET방식으로 첨부파일 조회할 때 사용
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {
		log.info("getAttachList " + bno);

		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}

	// 게시글 삭제 컨트롤러 성공이면 리다이렉트로 result를 넘겨 주고 리다이렉트로 리스트로 이동
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
		
		
		
		log.info("remove...." + bno);
		
		//파일 목록 불러오기 이를 deleteFiles 메서드 인자로 넘겨줌
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		
		if (service.remove(bno)) {
			//파일도 삭제
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");

		}
		// 전달 받은 페이지번호와 개수를 함께 넘긴다. get에서 리스트로넘어갈때 넘기는 원리
		//rttr.addAttribute("pageNum", cri.getPageNum());
		//rttr.addAttribute("amount", cri.getAmount());
		//rttr.addAttribute("type", cri.getType());
		//rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list" + cri.getListLink();
	}

	// 파일 삭제 처리 메서드 이는 remove 에서 사용
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if (attachList == null || attachList.size() == 0) {
			return;
		}
		log.info("delete attach Files.....................");
		log.info("attachList");

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(
						"C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());

				Files.deleteIfExists(file);

				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbnail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_"
							+ attach.getFileName());
					Files.deleteIfExists(thumbnail);

				}
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}

}
