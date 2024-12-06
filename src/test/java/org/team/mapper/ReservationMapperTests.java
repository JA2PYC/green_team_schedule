package org.team.mapper; 

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.team.dto.ReservationDTO;

@RunWith(SpringJUnit4ClassRunner.class) //JUnit�� ������ �׽�Ʈ ���ؽ�Ʈ ����
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") //root-context.xml ������ �ε��Ͽ� ������ ������ �ʱ�ȭ.
public class ReservationMapperTests {
	
	@Autowired //������ ���� ReservationMapper.java������ �������̽�
	private ReservationMapper mapper;
	
	/*
	@Test
	public void testGetList() {//���� ������ ��� ��� �׽�Ʈ ����
		mapper.getList().forEach(board -> System.out.println(board));
	}
	*/
	@Test
	public void testRead() {
		
		// 존재하는 게시물 번호로 테스트
		ReservationDTO board = mapper.reservationRead(5L);
		
		System.out.println(board);
	}
	
	@Test
	public void testInsert() { //���ο� ���� ������ ��ö�� �߰� ��� �׽�Ʈ ����
		ReservationDTO reservation = new ReservationDTO();
		reservation.setRdate("2024-12-06 10:00:00");
        reservation.setCname("��ö��");
        reservation.setCphone("010-1234-5678");
        reservation.setAddress("��� ���ֱ� ��絿");
        reservation.setContent("����");
        reservation.setVisitdate("2024-12-07 14:00:00");
        
        mapper.insert(reservation); //���൥���͸� DB�� �����ϴ� �޼��� �׽�Ʈ
        System.out.println("Insert Result: " + reservation);
	} 

}
/*
 * |-----|--------------------|------|--------------|-----------------------|-
 * |rnum |rdate |cname |cphone |address |content|visitdate |
 * |-----|--------------------|------|--------------|-----------------------|---
 * -----|--------------------| |1 |2024-12-05 10:00:00 |��Ƹ� |010-1234-5678 |���
 * ���� ��굿 �׸���ǻ�;�ī���� 4F |���� |2024-12-17 12:00:00 | |2 |2024-12-06 11:00:00 |������
 * |010-1234-6789 |��� ���� ����� ȸ����1F |���� |2024-12-18 14:00:00 | |3 |2024-12-07
 * 09:00:00 |��õ�� |010-2589-1234 |��� ���� ������ 2 |���� |2024-12-20 16:00:00 | |4
 * |2024-12-05 10:00:00 |��Ƹ� |010-1234-5678 |��� ���� ��굿 �׸���ǻ�;�ī���� 4F |����
 * |2024-12-17 12:00:00 | |5 |2024-12-06 11:00:00 |������ |010-1234-6789 |��� ���� �����
 * ȸ����1F |���� |2024-12-18 14:00:00 | |6 |2024-12-07 09:00:00 |��õ�� |010-2589-1234
 * |��� ���� ������ 2 |���� |2024-12-20 16:00:00 | |7 |2024-12-20 14:00:00 |��ä��
 * |010-8791-1234 |��� �ϱ� �꼺�� 16 ȿ���� |���� |2024-12-22 10:00:00 | |8 |2024-12-06
 * 10:00:00 |��ö�� |010-1234-5678 |��� ���ֱ� ��絿 |���� |2024-12-07 14:00:00 |
 * |-----|--------------------|------|--------------|-----------------------|---
 * -----|--------------------| #��ö�� ������ Ȯ�ε�.
 */