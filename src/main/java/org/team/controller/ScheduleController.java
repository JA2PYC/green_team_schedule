package org.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.dto.ReservationDTO;
import org.team.mapper.ScheduleMapper;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	@Autowired
	private ScheduleMapper scheduleMapper;

	@GetMapping("/list")
	public String scheduleList() {
		return "/schedule/scheduleList";
	}

	@GetMapping("/calendar")
	public String scheduleCalendar(Model model) {
		model.addAttribute("calendarList", scheduleMapper.getList());
		return "/schedule/scheduleCalendar";
	}

	@PostMapping("/calendar")
	@ResponseBody
	public List<ReservationDTO> scheduleCalendar(@RequestParam(value = "today") String today) {
		List<ReservationDTO> listArr = scheduleMapper.getList();
		return listArr;
	}

	@GetMapping("/registAS")
	public String scheduleRegistAS() {
		return "/schedule/registAS";
	}

	@PostMapping("/registAS")
	public String scheduleRegistASPost(ReservationDTO reservation,
			@RequestParam(value = "visitdate", required = false) String visitdate,
			@RequestParam(value = "visittime", required = false) String visittime, RedirectAttributes rttr) {

		String visitdatetime = visitdate + visittime;
		System.out.println(visitdatetime);
		return "/schedule/registAS";
	}

	@GetMapping("/registResult")
	public String scheduleRegistResult(@ModelAttribute(value = "message") String message,
			@ModelAttribute(value = "reservation") ReservationDTO reservation, Model model) {
		System.out.println(message);
		System.out.println(reservation);
		// ReservationDTO dto = scheduleMapper.reservationRead(Long.parseLong(rnum));

		model.addAttribute("data", reservation);
		model.addAttribute("message", message);
		return "/schedule/registResult";
	}

	@GetMapping("/test")
	public String scheduleTest() {
		return "/schedule/test";
	}

	// 처리현황 페이지
	@GetMapping("/processStatus")
	public String getProcessStatus(Model model) {
		List<ReservationDTO> statusList = scheduleMapper.getStatusList();
		model.addAttribute("statusList", statusList);
		return "/schedule/processStatusBoard"; // jsp 파일 경로
	}
}