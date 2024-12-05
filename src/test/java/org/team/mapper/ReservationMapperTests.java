package org.team.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReservationMapperTests {
	
	@Autowired
	private ReservationMapper mapper;
	
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> System.out.println(board));
	}
}
