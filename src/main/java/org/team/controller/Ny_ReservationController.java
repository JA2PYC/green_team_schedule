package org.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.team.dto.BoardDTO;
import org.team.mapper.Ny_ReservationMapper;

@Controller
public class Ny_ReservationController {

	@Autowired
	private Ny_ReservationMapper Ny_mapper;
	
	// 달력 화면 불러오기
	@GetMapping("/New")
	public void list(Model model) {
		model.addAttribute("list", Ny_mapper.getList());
		System.out.println("list");
	}
	
	// 공지사항 게시판 불러오기
	@GetMapping("/second_new")
	public void boardlist(Model model, @RequestParam(defaultValue = "1") int page) {
        int pageSize = 10;  // 한 페이지에 표시할 게시물 수
        int offset = (page - 1) * pageSize;
        
        // 현재 페이지에 해당하는 게시물 목록 조회
        List<BoardDTO> boardList = Ny_mapper.getBoardList(pageSize, offset);
        model.addAttribute("boardlist", boardList);

        // 전체 게시물 수 조회 (페이징 계산을 위한)
        int totalCount = Ny_mapper.getTotalCount();
        int totalPages = (int) (Math.ceil((double) totalCount / pageSize));
        
        // 페이징 정보 모델에 추가
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
	}
	
	@PostMapping({"/read"})
	public void get(@RequestParam("bnum") Long bnum, Model model) {
		
		model.addAttribute("board", Ny_mapper.reservationRead(bnum));
		System.out.println("/read");
	}
}
