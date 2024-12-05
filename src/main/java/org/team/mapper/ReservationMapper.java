package org.team.mapper; // Mapper 인터페이스
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.team.dto.ReservationDTO;

public interface ReservationMapper { 

		// @Select("select * from customer where rnum > 0")
		public List<ReservationDTO> getList();
		
		// @Insert(INSERT INTO customer (rdate, cname, cphone, address, content, visitdate)
        // VALUES (#{rdate}, #{cname}, #{cphone}, #{address}, #{content}, #{visitdate})
		public void insert(ReservationDTO reservation);
		
}
