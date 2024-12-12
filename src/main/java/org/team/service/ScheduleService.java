package org.team.service;

import java.util.List;

import org.team.dto.ReservationDTO;

public interface ScheduleService {

	List<ReservationDTO> selectAll();

	List<ReservationDTO> selectAll(int page, int size);

	ReservationDTO selectSchedule(Long rnum);

	List<ReservationDTO> selectByTitle(String title);

	List<ReservationDTO> selectByDate(String date);

	int insert(ReservationDTO dto);

	void delete(Long rnum);

	void deleteByDate(String date);

	void deleteByTitle(String title);

	void update(ReservationDTO dto, String column, String target);
}
