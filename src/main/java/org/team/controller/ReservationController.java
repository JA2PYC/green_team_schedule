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
	
	@GetMapping("/New")
	public void list(Model model) {
		model.addAttribute("list", mapper.getList());
		System.out.println("list");
		/*
		 * Gson gson = new Gson();
		 * 
		 * 
		 * String json = gson.toJson("list");
		 * 
		 * System.out.println(json);
		 */
	}
	
	@GetMapping({"/read"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		
		System.out.println("/read");
		model.addAttribute("board", mapper.reservationRead(bno));
	}
	
	//예약 등록 처리(사용자 예약정보를 ReservationDTO객체로 받음-> DB저장->redirect) 
	// registAS.jsp화면의 AS접수하기 버튼 클릭 시 예약 데이터 등록 처리
	@PostMapping("/schedule/registProcess")
	public String register(ReservationDTO reservation, RedirectAttributes rttr) {
        //휴대전화 번호 합치기
		String customerPhone1 = reservation.getCphone().split("-")[0]; // JSP에서 전달된 값 가정
		String customerPhone2 = reservation.getCphone().split("-")[1]; // JSP에서 전달된 값 가정
		String customerPhone3 = reservation.getCphone().split("-")[2]; // JSP에서 전달된 값 가정
        String cphone = customerPhone1 + "-" + customerPhone2 + "-" + customerPhone3;
        
        System.out.println("Received Reservation Data: " + reservation);
        // 예약 데이터 삽입
        mapper.insert(reservation);
        
        // 성공 메시지 전달
        rttr.addFlashAttribute("message", "A/S 접수가 완료되었습니다.");
        
        // 목록 페이지로 리다이렉트
        return "redirect:/schedule/list"; 
  }

}
