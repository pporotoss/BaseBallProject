package com.baseball.photoboard.model.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.photoboard.model.domain.PhotoBoard;
import com.baseball.photoboard.model.domain.PhotoDetail;

import common.Searching;

public interface PhotoBoardService {

	public Map photoBoardList(int page, Searching searching);
	public int photoUpload(HttpServletRequest request, MultipartFile uploadFile, PhotoBoard photoBoard);
	public PhotoDetail photoLoad(int photoBoard_id);
	public void photoEdit(HttpServletRequest request, MultipartFile uploadFile, PhotoBoard photoBoard);
	public void photoDelete(HttpServletRequest request, PhotoBoard photoBoard);
	
}
