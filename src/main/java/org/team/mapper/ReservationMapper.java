package org.team.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.team.dto.ReservationDTO;

@Mapper
public interface ReservationMapper {
    void insert(ReservationDTO reservation);
    List<ReservationDTO> getList(); 
	List<ReservationDTO> getStatusList(); // 처리현황 조회 메서드 추가
	ReservationDTO reservationRead(long parseLong);
	}