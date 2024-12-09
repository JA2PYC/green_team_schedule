package org.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.team.mapper.Ny_ReservationMapper;

@Controller
public class Ny_ReservationController {

	@Autowired
	private Ny_ReservationMapper Ny_mapper;
	
	@GetMapping("/New")
	public void list(Model model) {
		model.addAttribute("list", Ny_mapper.getList());
		System.out.println("list");

	}
	
	@GetMapping({"/read"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		
		System.out.println("/read");
		model.addAttribute("board", Ny_mapper.reservationRead(bno));
	}
}
