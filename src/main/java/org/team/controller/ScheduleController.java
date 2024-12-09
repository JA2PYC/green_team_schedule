package org.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.dto.ReservationDTO;
import org.team.mapper.Ny_ReservationMapper;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	@Autowired
	private Ny_ReservationMapper mapper;

	@GetMapping("/list")
	public String scheduleList() {
		return "/schedule/scheduleList";
	}

	@GetMapping("/calendar")
	public String scheduleCalendar(Model model) {
		model.addAttribute("calendarList", mapper.getList());
		return "/schedule/scheduleCalendar";
	}

	@PostMapping("/calendar")
	@ResponseBody
	public List<ReservationDTO> scheduleCalendar(@RequestParam(value = "today") String today) {
		List<ReservationDTO> listArr = mapper.getList();

		return listArr;
	}

	@GetMapping("/registAS")
	public String scheduleRegistAS() {
		return "/schedule/registAS";
	}

	@PostMapping("/registAS")
	public String scheduleRegistASPost(ReservationDTO reservation, RedirectAttributes rttr) {
		return "/schedule/registAS";
	}

	@GetMapping("/test")
	public String scheduleTest() {
		return "/schedule/test";
	}
}
