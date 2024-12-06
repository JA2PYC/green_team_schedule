package org.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.dto.ReservationDTO;
import org.team.mapper.ReservationMapper;

@Controller
public class ReservationController {
	
	 @Autowired
	 private ReservationMapper mapper; //Mapper직접 사용
	 
	 //예약 등록 처리
	 @PostMapping("/reservation/register")
	 public String register(ReservationDTO reservation, RedirectAttributes rttr ) {
		 System.out.println("register: " + reservation);
		 mapper.insert(reservation); // Mapper 직접 호출
		 rttr.addFlashAttribute("result", reservation.getRnum());
	 return "redirect:/reservation/list"; // 등록 후 목록 페이지로 이동
			 
	 }
}
