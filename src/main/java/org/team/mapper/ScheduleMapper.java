package org.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.team.dto.ReservationDTO;
import org.team.dto.ReservationDTO;

@Mapper
public interface ScheduleMapper {
	// 예약 목록 조회
	public List<ReservationDTO> getList();

	// 처리현황 조회 메서드 추가
	List<ReservationDTO> getStatusList();

	public ReservationDTO reservationRead(Long bnum);


    // 일정 전체 조회
    List<ReservationDTO> selectAll();

    // 페이징 처리된 일정 조회
    List<ReservationDTO> selectAllWithPagination(@Param("offset") int offset, @Param("size") int size);

    // 특정 일정 조회 (rnum 기준)
    ReservationDTO selectScheduleById(@Param("rnum") Long rnum);

    // 제목으로 일정 조회
    List<ReservationDTO> selectByTitle(@Param("title") String title);

    // 날짜로 일정 조회
    List<ReservationDTO> selectByDate(@Param("date") String date);

    // 일정 추가
    int insertSchedule(ReservationDTO dto);

    // 특정 일정 삭제 (rnum 기준)
    int deleteScheduleById(@Param("rnum") Long rnum);

    // 날짜로 일정 삭제
    int deleteByDate(@Param("date") String date);

    // 제목으로 일정 삭제
    int deleteByTitle(@Param("title") String title);

    // 일정 업데이트
    int updateSchedule(@Param("dto") ReservationDTO dto, @Param("column") String column, @Param("target") String target);
    

    // 일정 존재 여부 확인
    boolean existsScheduleById(@Param("rnum") Long rnum);
}
