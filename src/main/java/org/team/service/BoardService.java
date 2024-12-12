package org.team.service;

import org.team.dto.BoardDTO;

public interface BoardService {
	public boolean update(BoardDTO board);
	
	public boolean delete(Long bnum);
}
