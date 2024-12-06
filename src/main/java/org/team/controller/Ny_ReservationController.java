package org.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.team.mapper.ReservationMapper;

@Controller
public class Ny_ReservationController {

	@Autowired
	private ReservationMapper mapper;
	
	@GetMapping("/New")
	public void list(Model model) {
		model.addAttribute("list", mapper.getList());
		System.out.println("list");

	}
	
	@GetMapping({"/read"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		
		System.out.println("/read");
		model.addAttribute("board", mapper.reservationRead(bno));
	}
}
