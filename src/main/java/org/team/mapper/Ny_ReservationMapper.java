package org.team.mapper;

import java.util.List;
import org.team.dto.ReservationDTO;

public interface Ny_ReservationMapper { 

		// @Select("select * from customer where rnum > 0")
		public List<ReservationDTO> getList(); //예약 목록 조회
		
		public ReservationDTO reservationRead(Long rnum);
		
}
