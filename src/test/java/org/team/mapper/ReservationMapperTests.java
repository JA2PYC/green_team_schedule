package org.team.mapper; 

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.team.dto.BoardDTO;
import org.team.dto.ReservationDTO;

@RunWith(SpringJUnit4ClassRunner.class) //JUnit과 스프링 테스트 컨텍스트 통합
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") //root-context.xml 파일을 로드하여 스프링 설정을 초기화.
public class ReservationMapperTests {
	
	@Autowired //의존성 주입 ReservationMapper.java파일의 인터페이스
	private Ny_ReservationMapper Ny_mapper;
	
	@Autowired //의존성 주입 ReservationMapper.java파일의 인터페이스
	private ReservationMapper mapper;
	
	/*
	@Test
	public void testGetList() {//예약 데이터 목록 출력 테스트 성공
		mapper.getList().forEach(board -> System.out.println(board));
	}
	*/
	
	@Test
	public void testRead() {
		// 존재하는 게시물 1번으로 테스트
		BoardDTO reservation = Ny_mapper.reservationRead(1L);
		System.out.println(reservation);
	}
	

	@Test //새로운 예약 데이터 삽입 테스트 
	public void testInsert() { 
		System.out.println("=== 예약 데이터 삽입 ===");
		ReservationDTO reservation = new ReservationDTO();
		reservation.setRdate("2024-12-25 10:00:00");
        reservation.setCname("박철수");
        reservation.setCphone("010-4567-8910");
        reservation.setAddress("서울 강남구 역삼동 123번지");
        reservation.setCategory("가스보일러");
        reservation.setModel("NCB350");
        reservation.setIssue("온수 고장");
        reservation.setDetail("온수가 나오지 않습니다.");
        reservation.setVisitdate("2024-12-30 14:00:00");
        reservation.setPinformation(true);
        
        mapper.insert(reservation); //예약데이터를 DB에 삽입하는 메서드 테스트
        System.out.println("Insert Result: " + reservation);
	} 
}