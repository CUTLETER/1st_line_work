package com.kkodamkkodam.board.model;

import java.util.ArrayList;
import java.util.Map;


public interface BoardMapper {
	
	public ArrayList<BoardDTO> getList(int boardId); //글 목록 조회
	public BoardDTO getContent(Map<String, Object> params); //글 보기
	public void increaseView(Map<String, Object> params); //조회수
	public void commentWrite(Map<String, Object> params); //댓글작성
} 

