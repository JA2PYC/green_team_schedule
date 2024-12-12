package org.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.dto.BoardDTO;
import org.team.mapper.BoardMapper;
import org.team.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private BoardService service;

	@GetMapping("/list")
	public String boardList(Model model, @RequestParam(defaultValue = "1") int page) {
		int pageSize = 10; // 한 페이지에 표시할 게시물 수
		int offset = (page - 1) * pageSize;

		// 현재 페이지에 해당하는 게시물 목록 조회
		List<BoardDTO> boardList = boardMapper.getBoardList(pageSize, offset);
		model.addAttribute("boardlist", boardList);

		// 전체 게시물 수 조회 (페이징 계산을 위한)
		int totalCount = boardMapper.getTotalCount();
		int totalPages = (int) (Math.ceil((double) totalCount / pageSize));

		// 페이징 정보 모델에 추가
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		return "/board/list";
	}
	
	@GetMapping({"/post","/update"})
	public void boardPost(@RequestParam("bnum") Long bnum, Model model) {
		boardMapper.updateVisitCount(bnum);
		model.addAttribute("board", boardMapper.boardPostRead(bnum));
		
		/* return "/board/post"; */
	}
	
	
	@GetMapping("/register")
	public String boardRegister() {
		
		return "/board/register";
	}
	
	@PostMapping("/register")
	public String register(BoardDTO board, RedirectAttributes rttr) {
		
		System.out.println("register: " + board);
		
		boardMapper.register(board);
		
		rttr.addFlashAttribute("result", board.getBnum());
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/update")
	public String update(BoardDTO board, RedirectAttributes rttr) {
		System.out.println("update: " + board);
		
		if(service.update(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("bnum") Long bnum, RedirectAttributes rttr) {
		System.out.println("delete..." + bnum);
		if(service.delete(bnum)) {
			rttr.addFlashAttribute("result", "success");
		}else {
	        rttr.addFlashAttribute("result", "fail");
	    }
		return "redirect:/board/list";
	}
	
}
