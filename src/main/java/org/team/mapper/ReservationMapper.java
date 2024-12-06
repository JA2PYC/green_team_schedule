package org.team.mapper;

import java.util.ArrayList;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.team.dto.ReservationDTO;

public interface ReservationMapper { 

		// @Select("select * from customer where rnum > 0")
		public List<ReservationDTO> getList(); //예약 목록 조회
		
		public ReservationDTO reservationRead(Long rnum);
		
		// @Insert(INSERT INTO customer (rdate, cname, cphone, address, content, visitdate)
        // VALUES (#{rdate}, #{cname}, #{cphone}, #{address}, #{content}, #{visitdate})
		public void insert(ReservationDTO reservation); //예약 데이터 삽입
		
}
