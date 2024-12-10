package org.team.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.team.dto.ReservationDTO;

@Mapper
public interface ReservationMapper {
    void insert(ReservationDTO reservation);
} //예약 데이터 삽입
