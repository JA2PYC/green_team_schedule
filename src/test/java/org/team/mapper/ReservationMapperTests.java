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
	
	/*
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> System.out.println(board));
	}
	*/
	@Test
	public void testRead() {
		
		// 존재하는 게시물 번호로 테스트
		ReservationDTO board = mapper.reservationRead(5L);
		
		System.out.println(board);
	}
}
