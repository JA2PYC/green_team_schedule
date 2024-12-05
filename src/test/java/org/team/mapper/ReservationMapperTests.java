package org.team.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.team.dto.ReservationDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReservationMapperTests {
	
	@Autowired
	private ReservationMapper mapper;
	
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> System.out.println(board));
	}
	@Test
	public void testInsert() {
		ReservationDTO reservation = new ReservationDTO();
		reservation.setRdate("2024-12-06 10:00:00");
        reservation.setCname("김철수");
        reservation.setCphone("010-1234-5678");
        reservation.setAddress("울산 울주군 언양동");
        reservation.setContent("수리");
        reservation.setVisitdate("2024-12-07 14:00:00");
        
        //insert 테스트
        mapper.insert(reservation);
        System.out.println("Insert Result: " + reservation);
	}
}
