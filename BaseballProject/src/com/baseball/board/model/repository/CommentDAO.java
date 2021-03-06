package com.baseball.board.model.repository;

import java.util.List;
import java.util.Map;

import com.baseball.board.model.domain.Comment;
import com.baseball.board.model.domain.CommentDetail;

public interface CommentDAO {
	
	public List commentAll(Map paging);
	public int countAll(int board_id);
	public CommentDetail selectOne(Comment comment);
	public int insertComment(Comment comment);
	public int updateComment(Comment comment);
	public int deleteComment(int comment_id);
	public int deleteByMember(int member_id);
	public int deleteCommentByBoard_id(int board_id);
	public int userCommentCount(int member_id);
	public List userCommentList(Map user);
}
