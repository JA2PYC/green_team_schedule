package org.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.dto.ReservationDTO;
import org.team.mapper.ReservationMapper;


@Controller
// @RequestMapping("/board/*")
public class ReservationController {

	@Autowired
	private ReservationMapper mapper;
	

	//예약 등록 처리(사용자 예약정보를 ReservationDTO객체로 받음-> DB저장->redirect)
	// registAS.jsp화면의 AS접수하기 버튼 클릭 시 예약 데이터 등록 처리
	@PostMapping("/schedule/registProcess")
	public String register(
	    @RequestParam("addressPostcode") String addressPart1, // 주소 1(우편번호)
	    @RequestParam("addressRoad") String addressPart2,     // 주소 2(도로명)
	    @RequestParam("addressBname") String addressPart3,    // 주소 3(건물명)
	    @RequestParam("addressDetails") String addressPart4,  // 주소 4(상세주소)
	    @RequestParam("customerPhone1") String customerPhone1, // 전화번호 앞자리
	    @RequestParam("customerPhone2") String customerPhone2, // 전화번호 중간자리
	    @RequestParam("customerPhone3") String customerPhone3, // 전화번호 뒷자리
	    ReservationDTO reservation, RedirectAttributes rttr) {

	    // 주소합치기 //주소
	    String address = addressPart1 + " " + addressPart2 + " " + addressPart3 + " " + addressPart4;
	    reservation.setAddress(address);

	    // 휴대전화 번호 합치기
	    String cphone = customerPhone1 + "-" + customerPhone2 + "-" + customerPhone3;
	    reservation.setCphone(cphone);

	    // 디버깅용 로그 출력
	    System.out.println("Received Reservation Data: " + reservation);
	    System.out.println("Received CNAME: " + reservation.getCname());
	    // 예약 데이터 삽입
	    mapper.insert(reservation);

	    // 성공 메시지 전달
	    rttr.addFlashAttribute("message", "A/S 접수가 완료되었습니다.");

	    // 목록 페이지로 리다이렉트
	    return "redirect:/schedule/list";
	}
}

