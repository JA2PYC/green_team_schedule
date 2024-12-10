package org.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.team.dto.BoardDTO;
import org.team.mapper.BoardMapper;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardMapper boardMapper;

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
	
	@GetMapping("/post")
	public String boardPost() {
		return "/board/post";
	}
	
}
