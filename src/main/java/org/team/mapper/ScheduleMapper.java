package org.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.team.dto.BoardDTO;
import org.team.dto.ReservationDTO;

@Mapper
public interface ScheduleMapper {
	public List<ReservationDTO> getList(); // 예약 목록 조회
	
	public ReservationDTO reservationRead(Long bnum);

}
