package com.kkodamkkodam.board.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kkodamkkodam.board.model.BoardDTO;
import com.kkodamkkodam.board.model.BoardMapper;
import com.kkodamkkodam.util.mybatis.MybatisUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardServiceImpl implements BoardService {
	
	//멤버변수에 세션팩토리 하나 선언
	private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();
	
	@Override
	public void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		ArrayList<BoardDTO> list = mapper.getList(1);
		sql.close();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("post_list.jsp").forward(request, response);
	}
	
	@Override
	public void getContent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int postNo=Integer.parseInt(request.getParameter("postNo"));
		int boardId=Integer.parseInt(request.getParameter("boardId"));
		Map<String, Object> params = new HashMap<>();
        params.put("postNo", postNo);
        params.put("boardId", boardId);

		//마이바티스 실행
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);

		mapper.increaseView(params); //조회수 증가
		BoardDTO dto = mapper.getContent(params); //결과 반환
		sql.close(); //마이바티스 세션 종료
		
		//dto를 request에 담고 forward 화면으로 이동
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("post_view.jsp").forward(request, response);			
	}
	
	@Override
	public void commentWrite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int postNo=Integer.parseInt(request.getParameter("postNo"));
		int boardId=Integer.parseInt(request.getParameter("boardId"));
		Map<String, Object> params = new HashMap<>();
        params.put("postNo", postNo);
        params.put("boardId", boardId);

		//마이바티스 실행
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		mapper.commentWrite(params);
		sql.close(); //마이바티스 세션 종료
		
		//dto를 request에 담고 forward 화면으로 이동
		request.getRequestDispatcher("post_view.jsp").forward(request, response);	
		
	}
}
