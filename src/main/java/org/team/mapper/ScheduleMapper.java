package org.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.team.dto.BoardDTO;
import org.team.dto.ReservationDTO;

@Mapper
public interface ScheduleMapper {
	// 예약 목록 조회
	public List<ReservationDTO> getList();

	// 처리현황 조회 메서드 추가
	List<ReservationDTO> getStatusList();

	public ReservationDTO reservationRead(Long bnum);

}
