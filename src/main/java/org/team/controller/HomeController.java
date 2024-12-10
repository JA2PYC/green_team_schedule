package org.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "home";
	}
	
	@GetMapping("/terms")
	public String terms() {
		return "terms"; 
	}
	
	@GetMapping("/privacyPolicy")
	public String privacyPolicy () {
		return "/privacyPolicy";
	}
	
}
