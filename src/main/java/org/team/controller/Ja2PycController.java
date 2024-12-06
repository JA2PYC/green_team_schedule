package org.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class Ja2PycController {
	
	@GetMapping("/schedule/list")
	public String scheduleList() {
		return "/schedule/scheduleList"; 
	}
	
	@GetMapping("/schedule/calendar")
	public String scheduleCalendar() {
		return "/schedule/scheduleCalendar";
	}
	
	@GetMapping("/schedule/test")
	public String scheduleTest() {
		return "/schedule/test";
	}
	
	@GetMapping("/schedule/registAS")
	public String scheduleRegistAS() {
		return "/schedule/registAS";
	}
	
	@PostMapping("/schedule/registAS")
	public String scheduleAS() {
		return "/schedule/registAS";
	}
}
