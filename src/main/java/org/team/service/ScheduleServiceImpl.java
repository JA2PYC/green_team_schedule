package org.team.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.team.dto.ReservationDTO;
import org.team.mapper.ScheduleMapper;

@Service
public class ScheduleServiceImpl implements ScheduleService {

    private final ScheduleMapper scheduleMapper;

    // Constructor-based Dependency Injection
    public ScheduleServiceImpl(ScheduleMapper scheduleMapper) {
        this.scheduleMapper = scheduleMapper;
    }

    @Override
    public List<ReservationDTO> selectAll() {
        return scheduleMapper.selectAll();
    }

    @Override
    public List<ReservationDTO> selectAll(int page, int size) {
        int offset = (page - 1) * size;
        return scheduleMapper.selectAllWithPagination(offset, size);
    }

    @Override
    public ReservationDTO selectSchedule(Long rnum) {
        return scheduleMapper.selectScheduleById(rnum);
    }

    @Override
    public List<ReservationDTO> selectByTitle(String title) {
        return scheduleMapper.selectByTitle(title);
    }

    @Override
    public List<ReservationDTO> selectByDate(String date) {
        return scheduleMapper.selectByDate(date);
    }

    @Override
    public int insert(ReservationDTO dto) {
        return scheduleMapper.insertSchedule(dto);
    }

    @Override
    public void delete(Long rnum) {
        if (!scheduleMapper.existsScheduleById(rnum)) {
            throw new IllegalArgumentException("Schedule not found with id: " + rnum);
        }
        scheduleMapper.deleteScheduleById(rnum);
    }

    @Override
    public void deleteByDate(String date) {
        scheduleMapper.deleteByDate(date);
    }

    @Override
    public void deleteByTitle(String title) {
        scheduleMapper.deleteByTitle(title);
    }

    @Override
    public void update(ReservationDTO dto, String column, String target) {
        ReservationDTO existing = scheduleMapper.selectScheduleById(dto.getRnum());

        // Example logic: update based on the column provided
        switch (column.toLowerCase()) {
            case "title":
                existing.setCategory(target);
                break;
            case "date":
                existing.setVisitdate(target);
                break;
            default:
                throw new IllegalArgumentException("Invalid column: " + column);
        }

        scheduleMapper.insertSchedule(existing);
    }
}
