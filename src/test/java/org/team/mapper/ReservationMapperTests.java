package org.team.mapper; 

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.team.dto.ReservationDTO;

@RunWith(SpringJUnit4ClassRunner.class) //JUnit과 스프링 테스트 컨텍스트 통합
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") //root-context.xml 파일을 로드하여 스프링 설정을 초기화.
public class ReservationMapperTests {
	
	@Autowired //의존성 주입 ReservationMapper.java파일의 인터페이스
	private ReservationMapper mapper;
	
	
	@Test
	public void testGetList() {//예약 데이터 목록 출력 테스트 성공
		mapper.getList().forEach(board -> System.out.println(board));
	}
	@Test
	public void testInsert() { //새로운 예약 데이터 김철수 추가 출력 테스트 성공
		ReservationDTO reservation = new ReservationDTO();
		reservation.setRdate("2024-12-06 10:00:00");
        reservation.setCname("김철수");
        reservation.setCphone("010-1234-5678");
        reservation.setAddress("울산 울주군 언양동");
        reservation.setContent("수리");
        reservation.setVisitdate("2024-12-07 14:00:00");
        
        mapper.insert(reservation); //예약데이터를 DB에 삽입하는 메서드 테스트
        System.out.println("Insert Result: " + reservation);
	} 
}
/*
 * |-----|--------------------|------|--------------|-----------------------|-
 * |rnum |rdate |cname |cphone |address |content|visitdate |
 * |-----|--------------------|------|--------------|-----------------------|---
 * -----|--------------------| |1 |2024-12-05 10:00:00 |김아름 |010-1234-5678 |울산
 * 남구 삼산동 그린컴퓨터아카데미 4F |수리 |2024-12-17 12:00:00 | |2 |2024-12-06 11:00:00 |양정훈
 * |010-1234-6789 |울산 동구 방어진 회센터1F |수리 |2024-12-18 14:00:00 | |3 |2024-12-07
 * 09:00:00 |도천수 |010-2589-1234 |울산 동구 성끝길 2 |수리 |2024-12-20 16:00:00 | |4
 * |2024-12-05 10:00:00 |김아름 |010-1234-5678 |울산 남구 삼산동 그린컴퓨터아카데미 4F |수리
 * |2024-12-17 12:00:00 | |5 |2024-12-06 11:00:00 |양정훈 |010-1234-6789 |울산 동구 방어진
 * 회센터1F |수리 |2024-12-18 14:00:00 | |6 |2024-12-07 09:00:00 |도천수 |010-2589-1234
 * |울산 동구 성끝길 2 |수리 |2024-12-20 16:00:00 | |7 |2024-12-20 14:00:00 |신채아
 * |010-8791-1234 |울산 북구 산성로 16 효문동 |수리 |2024-12-22 10:00:00 | |8 |2024-12-06
 * 10:00:00 |김철수 |010-1234-5678 |울산 울주군 언양동 |수리 |2024-12-07 14:00:00 |
 * |-----|--------------------|------|--------------|-----------------------|---
 * -----|--------------------| #김철수 예약등록 확인됨.
 */