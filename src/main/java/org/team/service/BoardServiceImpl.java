package org.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.dto.BoardDTO;
import org.team.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public boolean update(BoardDTO board) {
		
		System.out.println("update......" + board);
		
		return boardMapper.update(board) == 1;
	}

	@Override
	public boolean delete(Long bnum) {
		
		System.out.println("delete......" + bnum);
		
		return boardMapper.delete(bnum) == 1;
	}
}
