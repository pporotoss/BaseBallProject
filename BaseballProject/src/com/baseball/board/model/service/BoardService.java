package com.baseball.board.model.service;

import java.util.Map;

import com.baseball.board.model.domain.Board;
import com.baseball.board.model.domain.BoardDetail;

public interface BoardService {
	
	public Map selectAll(String page, String pagesize);
	public BoardDetail selectOne(int board_id);
	public void regist(Board board);
	public void replyResist(Board board);
	public void update(Board board);
	public void delete(int board_id);
	
}
