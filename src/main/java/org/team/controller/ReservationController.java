package org.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.dto.ReservationDTO;
import org.team.mapper.ReservationMapper;

import com.google.gson.Gson;

@Controller
// @RequestMapping("/board/*")
public class ReservationController {

	@Autowired
	private ReservationMapper mapper;
	
	// registAS.jsp화면의 AS접수하기 버튼 클릭 시 예약 데이터 등록 처리
	@PostMapping("/schedule/registProcess")
	public String register(
		@RequestParam("customerPhone1") String customerPhone1,
		@RequestParam("customerPhone2") String customerPhone2,
		@RequestParam("customerPhone3") String customerPhone3,
		ReservationDTO reservation, RedirectAttributes rttr) {
	    // 휴대전화 번호 합치기
	    String cphone = customerPhone1 + "-" + customerPhone2 + "-" + customerPhone3;
	    reservation.setCphone(cphone);

	    // 휴대전화 번호를 ReservationDTO에 설정
	    reservation.setCphone(cphone);

	    // 예약 데이터 확인 (디버깅용)
	    System.out.println("Received Reservation Data: " + reservation);

	    // 예약 데이터 삽입
	    mapper.insert(reservation);

	    // 성공 메시지 전달
	    rttr.addFlashAttribute("message", "A/S 접수가 완료되었습니다.");

	    // 목록 페이지로 리다이렉트
	    return "redirect:/schedule/list";
	}
}
