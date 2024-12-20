package org.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.dto.ReservationDTO;
import org.team.mapper.ReservationMapper;
import org.team.smsservice.SmsService;

@Controller
public class ReservationController {

	@Autowired
	private ReservationMapper mapper;

	@Autowired
	private SmsService smsService; // SmsService 의존성주입

	// registAS.jsp화면의 AS접수하기 버튼 클릭 시 예약데이터 등록처리
	@PostMapping("/schedule/registProcess")
	public String register(@RequestParam("addressPostcode") String addressPart1, // 주소 1(우편번호)
			@RequestParam("addressRoad") String addressPart2, // 주소 2(도로명)
			@RequestParam("addressBname") String addressPart3, // 주소 3(건물명)
			@RequestParam("addressDetails") String addressPart4, // 주소 4(상세주소)
			@RequestParam("customerPhone1") String customerPhone1, // 전화번호 앞자리
			@RequestParam("customerPhone2") String customerPhone2, // 전화번호 중간자리
			@RequestParam("customerPhone3") String customerPhone3, // 전화번호 뒷자리
			@RequestParam("visitdate") String visitdate, @RequestParam("visittime") String visittime,
			ReservationDTO reservation, RedirectAttributes rttr) {

		// 주소합치기 (기본 주소와 세부 주소로 분리)
		// String address = addressPart1 + " " + addressPart2 + " " + addressPart3;
		String address = addressPart2 + " " + addressPart3; // 기본주소
		String unit = addressPart4; // 세부 주소

		reservation.setAddress(address); // 기본 주소 설정
		reservation.setUnit(unit); // 세부 주소 설정

		// 휴대전화 번호 합치기
		String cphone = customerPhone1 + "-" + customerPhone2 + "-" + customerPhone3;
		reservation.setCphone(cphone);

		// 에약일 합치기 (JA2)
		String visitdatetime = visitdate + " " + visittime;
		reservation.setVisitdate(visitdatetime);

		// 디버깅용 로그 출력
		System.out.println("Received Reservation Data: " + reservation);
		System.out.println("Received CNAME: " + reservation.getCname());

		// 예약 데이터 삽입
		mapper.insert(reservation);

		// SMS 발송
		String messageContent = "안녕하세요, " + reservation.getCname() + "님. " + "귀하의 A/S 접수가 완료되었습니다.\n" + "접수 날짜: "
				+ reservation.getRdate() + "\n" + "모델명: " + reservation.getModel();
		// smsService.sendSms(cphone, messageContent);

		// 성공 메시지 전달
		System.out.println(reservation);
		rttr.addFlashAttribute("message", "A/S 접수가 완료되었습니다.");
		rttr.addFlashAttribute("reservation", reservation);

		// JSP 페이지로 이동
		return "redirect:/schedule/registResult";
	}
}
