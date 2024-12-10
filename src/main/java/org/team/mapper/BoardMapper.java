package org.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.team.dto.BoardDTO;
import org.team.dto.ReservationDTO;

@Mapper
public interface BoardMapper {
	// 공지사항 게시판 조회
	List<BoardDTO> getBoardList(@Param("pageSize") int pageSize, @Param("offset") int offset);

	// 공지사항 게시판 전체 게시물 수
	public int getTotalCount();

	// 게시판 조회수 1 증가
	public int updateVisitCount();
	
	public ReservationDTO boardPostRead(Long bnum);

}
