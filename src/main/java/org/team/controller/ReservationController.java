package org.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
}
