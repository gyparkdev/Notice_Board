package com.pky.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pky.domain.BoardVO;
import com.pky.domain.Criteria;
import com.pky.domain.PageDTO;
import com.pky.domain.ReplyVO;
import com.pky.service.BoardService;
import com.pky.service.ReplyService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board/*")
public class BoardController {

	private final BoardService service;
	private final ReplyService replyService;
	
		//게시판 리스트 조회
		@GetMapping("/list")
		public String list(Criteria cri, Model model) {
			model.addAttribute("list", service.getList(cri));
			model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
			return "board/list";
		}
		
		//게시글 작성 페이지로 이동
		@GetMapping("/regist")
		public String registerGet() {
			return "board/regist";
		}
		
		//게시글 작성 
		@PostMapping("/regist")
		public String register(BoardVO board, RedirectAttributes rttr) {
			Long board_no = service.register(board);
			rttr.addFlashAttribute("result", board_no);
			return "redirect:/board/list";
		}
		
		//게시글 제목 클릭시 상세조회 페이지로 이동
		@GetMapping("/get")
		public String get(@RequestParam("board_no") Long board_no, @ModelAttribute("cri") Criteria cri, Model model) {
			service.viewCount(board_no);
			model.addAttribute("board", service.get(board_no));
			List<ReplyVO> replyList = replyService.readReply(board_no);
			model.addAttribute("replyList", replyList);
			return "board/get";
		}
		
		//게시글 수정 페이지로 이동
		@GetMapping("/modify")
		public String modify(@RequestParam("board_no") Long board_no, @ModelAttribute("cri") Criteria cri , Model model) {
			model.addAttribute("board", service.get(board_no));
			return "/board/modify";
		}
		
		//게시글 수정
		@PostMapping("/modify")
		public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
			int count = service.modify(board);
			if(count == 1) {
				rttr.addFlashAttribute("result", "success");
			}
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			
			return "redirect:/board/list";
		}
		
		//게시글 삭제 
		@PostMapping("/remove")
		public String remove(Long board_no, Criteria cri, RedirectAttributes rttr) {
			int count = service.remove(board_no);
			if(count == 1) {
				rttr.addFlashAttribute("result", "success");
			}
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			
			return "redirect:/board/list";
		}
		
		//댓글 작성 
		@PostMapping("/replyWrite")
		public String replyWrite(ReplyVO reply, Criteria cri, RedirectAttributes rttr) {
			replyService.writeReply(reply);
			rttr.addAttribute("bno", reply.getBoard_no());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			
			return "redirect:/board/get";
		}
		
		//댓글 수정 페이지로 이동
		@GetMapping("/replyUpdateView")
		public String replyUpdateView(ReplyVO reply, Criteria cri, Model model) {
			model.addAttribute("replyUpdate", replyService.selectReply(reply.getBoard_no()));
			model.addAttribute("cri", cri);
			return "board/replyUpdateView";
		}
		
		//댓글 수정
		@PostMapping("/replyUpdate")
		public String replyUpdate(ReplyVO reply, Criteria cri, RedirectAttributes rttr) {
			replyService.updateReply(reply);
			rttr.addAttribute("bno", reply.getBoard_no());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			
			return "redirect:/board/get";
		}
		
		//댓글 삭제
		@PostMapping("/replyDelete")
		public String replyDelete(ReplyVO reply, Criteria cri, RedirectAttributes rttr) {
			replyService.deleteReply(reply);
			rttr.addAttribute("bno", reply.getBoard_no());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			
			return "redirect:/board/get";
		}
}
