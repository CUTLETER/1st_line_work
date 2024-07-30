package com.kkodamkkodam.board.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kkodamkkodam.board.model.BoardDTO;
import com.kkodamkkodam.board.model.CommentDTO;
import com.kkodamkkodam.board.model.MiniDTO;
import com.kkodamkkodam.board.model.VoteDTO;
import com.kkodamkkodam.user.model.UserDTO;
import com.kkodamkkodam.board.model.BoardMapper;
import com.kkodamkkodam.util.mybatis.MybatisUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BoardServiceImpl implements BoardService {
	
	//멤버변수에 세션팩토리 하나 선언
	private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();
	
	@Override
	public void getIndex(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		ArrayList<BoardDTO> bastList = mapper.getBestList();
		ArrayList<BoardDTO> freeList = mapper.getList(1L);
		ArrayList<BoardDTO> QuestionList = mapper.getList(2L);
		ArrayList<BoardDTO> codeReviewList = mapper.getList(3L);
		ArrayList<BoardDTO> informationList = mapper.getList(4L);
		
		sql.close();
		
		if (freeList.size() > 6) {
		    freeList = new ArrayList<>(freeList.subList(0, 6));
		}
		if (QuestionList.size() > 6) {
			QuestionList = new ArrayList<>(QuestionList.subList(0, 6));
		}
		if (codeReviewList.size() > 6) {
			codeReviewList = new ArrayList<>(codeReviewList.subList(0, 6));
		}
		if (informationList.size() > 6) {
			informationList = new ArrayList<>(informationList.subList(0, 6));
		}
		
		request.setAttribute("bastList", bastList);
		request.setAttribute("freeList", freeList);
		request.setAttribute("QuestionList", QuestionList);
		request.setAttribute("codeReviewList", codeReviewList);
		request.setAttribute("informationList", informationList);

	    request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
	
	
	//글목록
	@Override
	public void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long boardId=Long.parseLong(request.getParameter("boardId"));
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		ArrayList<BoardDTO> list = mapper.getList(boardId);
		String boardType=mapper.getboardType(boardId);
		sql.close();
		
		request.setAttribute("list", list);
		request.setAttribute("boardType", boardType);
		request.setAttribute("boardId", boardId);
		
		request.getRequestDispatcher("post_list.jsp").forward(request, response);
	}
	
	//글 내용
	@Override
	public void getContent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long postNo=Long.parseLong(request.getParameter("postNo"));
		Long boardId=Long.parseLong(request.getParameter("boardId"));
		Map<String, Object> params = new HashMap<>();
        params.put("postNo", postNo);
        params.put("boardId", boardId);
        
		//마이바티스 실행
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);

		mapper.increaseView(params); //조회수 증가
		BoardDTO dto = mapper.getContent(params); 
		ArrayList<CommentDTO> commentList = mapper.getComment(params);
		String boardType=mapper.getboardType(boardId);
		sql.close(); //마이바티스 세션 종료
		
		request.setAttribute("boardType", boardType);
		request.setAttribute("dto", dto);
		request.setAttribute("commentList", commentList);
		request.getRequestDispatcher("post_view.jsp").forward(request, response);			
	}
	//글 수정
	@Override
	public void updatePostPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long postNo=Long.parseLong(request.getParameter("postNo"));
		Long boardId=Long.parseLong(request.getParameter("boardId"));
		Map<String, Object> params = new HashMap<>();
        params.put("postNo", postNo);
        params.put("boardId", boardId);
        
		//마이바티스 실행
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);

		BoardDTO dto = mapper.getContent(params); //결과 반환
		sql.close(); //마이바티스 세션 종료
		
		request.setAttribute("dto", dto);
		
		request.getRequestDispatcher("post_update.jsp").forward(request, response);	
	}
	//글 수정
	@Override
	public void updatePost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long boardId=Long.parseLong(request.getParameter("boardId"));
		Long postNo=Long.parseLong(request.getParameter("postNo"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		BoardDTO dto = new BoardDTO(postNo, null, boardId, title, null, null, null, content, null, null,null, null, null);
		//마이바티스 실행
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		mapper.updatePost(dto);
		
		sql.close(); //마이바티스 세션 종료
		
		//dto를 request에 담고 forward 화면으로 이동
		request.getRequestDispatcher("getContent.board").forward(request, response);	
	}
	//글 삭제
	@Override
	public void deletePost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long postNo=Long.parseLong(request.getParameter("postNo"));
		BoardDTO dto=new BoardDTO(postNo, null, null, null, null, null, null, null, null, null, null,null, null);
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		mapper.deletePost(dto);
		
		sql.close(); //마이바티스 세션 종료
		
		//dto를 request에 담고 forward 화면으로 이동
		request.getRequestDispatcher("postList.board").forward(request, response);	
	}
	
	//글 좋아요 증가
	@Override
	public void increasePostLike(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long postNo=Long.parseLong(request.getParameter("postNo"));
		Long boardId=Long.parseLong(request.getParameter("boardId"));
		BoardDTO dto=new BoardDTO(postNo, null, boardId, null, null, null, null, null, null, null, null, null,null);
		//마이바티스 실행
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		mapper.increasePostLike(dto);
		
		sql.close(); //마이바티스 세션 종료
		
		//dto를 request에 담고 forward 화면으로 이동
		request.getRequestDispatcher("getContent.board").forward(request, response);	
	}
	
	@Override
	public void commentWrite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		UserDTO udto = new UserDTO();
		udto = (UserDTO) session.getAttribute("user");
		Long userNo = udto.getuserNo();;
		Long boardId=Long.parseLong(request.getParameter("boardId"));
		Long postNo=Long.parseLong(request.getParameter("postNo"));
		String commentContent=request.getParameter("commentContent");
		CommentDTO dto = new CommentDTO(null, userNo, boardId, postNo, commentContent, null, null, null, null,null);
		
		//마이바티스 실행
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		mapper.commentWrite(dto);
		
		sql.close(); //마이바티스 세션 종료
		
		//dto를 request에 담고 forward 화면으로 이동
		request.getRequestDispatcher("getContent.board").forward(request, response);	
	}

	@Override
	public void replyWrite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserDTO udto = new UserDTO();
		udto = (UserDTO) session.getAttribute("user");
		Long userNo = udto.getuserNo();
		Long boardId=Long.parseLong(request.getParameter("boardId"));
		Long postNo=Long.parseLong(request.getParameter("postNo"));
		String commentContent=request.getParameter("commentContent");
		Long parentId=Long.parseLong(request.getParameter("parentId"));
		
		CommentDTO dto = new CommentDTO(null, userNo, boardId, postNo, commentContent, null, null, parentId, null,null);
		//마이바티스 실행
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		mapper.replyWrite(dto);
		
		sql.close(); //마이바티스 세션 종료
		
		//dto를 request에 담고 forward 화면으로 이동
		request.getRequestDispatcher("getContent.board").forward(request, response);
		
	}
	@Override
	public void deleteComment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long commentNo=Long.parseLong(request.getParameter("commentNo"));
		CommentDTO dto=new CommentDTO(commentNo, null, null, null, null, null, null, null, null, null);
		//마이바티스 실행
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		
		if(mapper.findReply(dto)==0) {
			mapper.deleteComment(dto);
		}else {
			mapper.updateDeleteComment(dto);
		}
		
		sql.close();
		request.getRequestDispatcher("getContent.board").forward(request, response);	
	}
	
	@Override
	public void increaseCommentLike(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long commentNo=Long.parseLong(request.getParameter("commentNo"));
		CommentDTO dto=new CommentDTO(commentNo, null, null, null, null, null, null, null, null,null);
		//마이바티스 실행
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		mapper.increaseCommentLike(dto);
		
		sql.close(); //마이바티스 세션 종료
		//dto를 request에 담고 forward 화면으로 이동
		request.getRequestDispatcher("getContent.board").forward(request, response);	
	}
	
	@Override
	public void postWrite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long boardId = Long.parseLong(request.getParameter("boardId"));
		request.setAttribute("boardId", boardId);
		request.getRequestDispatcher("post_write.jsp").forward(request, response);
	}


	@Override
	public void postRegi(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Long boardId = Long.parseLong(request.getParameter("boardId"));

		HttpSession session = request.getSession();
		UserDTO udto = new UserDTO();
		udto = (UserDTO) session.getAttribute("user");
		Long userNo = udto.getuserNo();

		
		BoardDTO dto = new BoardDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setUserNo(userNo);
		dto.setBoardId(boardId);

		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		mapper.postRegi(dto);
		
		sql.close();
		
		request.setAttribute("boardId", boardId);
		request.getRequestDispatcher("postList.board").forward(request, response);
	}
//////////////////////////////////////////////////////// 나린//
	@Override
	public void miniWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  UserDTO userdto = new UserDTO();
	  HttpSession session = request.getSession(); // 세션값에 저장되어 있는 걸 뽑음
	  userdto = (UserDTO) session.getAttribute("user"); 
	  
	  String boardCategory = request.getParameter("boardCategory");
      String boardType = request.getParameter("boardType");
      String content = request.getParameter("content");
    
      MiniDTO dto = new MiniDTO(null, boardType, boardCategory, content, null, null, userdto.getuserNo(), null);
      SqlSession sql = sqlSessionFactory.openSession(true); 
      BoardMapper mapper = sql.getMapper(BoardMapper.class);
      mapper.miniWrite(dto);
      sql.close();
      
      request.getRequestDispatcher("postMiniList.board").forward(request, response);
	}
  
	@Override
	public void getMiniList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    SqlSession sql = sqlSessionFactory.openSession(true);
	    BoardMapper mapper = sql.getMapper(BoardMapper.class);
	    ArrayList<MiniDTO> Minilist = mapper.getMiniList();
	    sql.close();

	    request.setAttribute("Minilist", Minilist);
	    request.getRequestDispatcher("post_mini_list.jsp").forward(request, response);
	} 
	
	@Override
	public void voteContent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardType = request.getParameter("boardType");
	    String boardCategory = request.getParameter("boardCategory");
	    Long postNo = Long.parseLong(request.getParameter("postNo"));
	    
	    Map<String, Object> params = new HashMap<>();
	    params.put("boardType", boardType);
	    params.put("boardCategory", boardCategory);
	    params.put("postNo", postNo); // 추가된 부분

	    SqlSession sql = sqlSessionFactory.openSession(true);
	    BoardMapper mapper = sql.getMapper(BoardMapper.class);

	    mapper.miniListView(params); // 조회수 증가
	    MiniDTO dto = mapper.voteContent(params); // 결과 반환
	    sql.close();
	    
	    request.setAttribute("dto", dto);
	    request.getRequestDispatcher("vote.jsp").forward(request, response); // forward 경로 확인
	}
	@Override
	public void increaseVoteLike(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long postNo=Long.parseLong(request.getParameter("postNo"));

		MiniDTO dto=new MiniDTO(postNo, null, null, null, null, null, null, null);

		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		mapper.increaseVoteLike(dto);
		
		sql.close(); //마이바티스 세션 종료
		
		request.getRequestDispatcher("voteContent.board").forward(request, response);	
	}			
	////////////////////////////////
	@Override
	public void addVote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		    Long voteId = Long.parseLong(request.getParameter("voteId"));
		    Long postNo = Long.parseLong(request.getParameter("postNo"));
		    Long userNo = Long.parseLong(request.getParameter("userNo"));
		    Long yesVotes = Long.parseLong(request.getParameter("yesVotes"));
		    Long noVotes = Long.parseLong(request.getParameter("noVotes"));
		    String BoardCategory = request.getParameter("BoardCategory");
		    String boardType = request.getParameter("boardType");


		    // 총 투표 수 계산
		    Long totalVotes = yesVotes + noVotes;

		    // 찬성 비율
		    double yesPercentage = (yesVotes.doubleValue() / totalVotes.doubleValue()) * 100;

		    // 찬성 비율이 60% 이상인지 확인합니다.
		    if (totalVotes >= 20 & yesPercentage >= 60) {
		        // 찬성 비율이 60% 이상인 경우
		        VoteDTO dto = new VoteDTO(voteId, postNo, null, userNo, yesVotes, null, BoardCategory, boardType);

		        SqlSession sql = sqlSessionFactory.openSession(true);
		        BoardMapper mapper = sql.getMapper(BoardMapper.class);

		        // 데이터베이스 작업을 수행합니다.
		        // mapper.someMethod(dto);

		        sql.close(); // 마이바티스 세션 종료

		        // 성공적인 작업 후 mini.jsp로 포워딩합니다.
		        request.getRequestDispatcher("mini.jsp").forward(request, response);
//		    } else {
//		        // 찬성 비율이 60% 미만인 경우
//		        response.sendRedirect("notEnoughSupport.jsp"); // 찬성 비율 부족 페이지로 리다이렉트
		    }
		} catch (NumberFormatException e) {
		    // 파라미터가 숫자 형식이 아닐 경우 에러 페이지로 리다이렉트합니다.
		    response.sendRedirect("error.jsp");
		} catch (Exception e) {
		    // 기타 예외를 처리합니다.
		    response.sendRedirect("error.jsp");
		}
	}
  
	@Override
	public void getPostsByUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDTO udto = new UserDTO();
		udto = (UserDTO) session.getAttribute("user");

        SqlSession sqlSession = null;
        try {
            sqlSession = sqlSessionFactory.openSession();
            BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
            ArrayList<BoardDTO> posts = mapper.getPostsByUser(udto.getuserNo());
            request.setAttribute("posts", posts);
            request.getRequestDispatcher("../user/mypage.jsp").forward(request, response);
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
		
	}

	@Override
	public void getCommentsByUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserDTO udto = new UserDTO();
		udto = (UserDTO) session.getAttribute("user");

        SqlSession sqlSession = null;
        try {
            sqlSession = sqlSessionFactory.openSession();
            BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
            ArrayList<CommentDTO> comments = mapper.getCommentsByUser(udto.getuserNo());
            request.setAttribute("comments", comments);
            request.getRequestDispatcher("../user/mypage.jsp").forward(request, response);
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
	}

	@Override
	public void getUserActivityLog(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
        UserDTO udto = (UserDTO) session.getAttribute("user");

        SqlSession sqlSession = null;
        try {
            sqlSession = sqlSessionFactory.openSession();
            BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

            ArrayList<BoardDTO> posts = mapper.getPostsByUser(udto.getuserNo());
            ArrayList<CommentDTO> comments = mapper.getCommentsByUser(udto.getuserNo());

            request.setAttribute("posts", posts);
            request.setAttribute("comments", comments);

            request.getRequestDispatcher("../user/mypage.jsp").forward(request, response);
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
		
	}
	@Override
	public void postCodeWrite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Long boardId = Long.parseLong(request.getParameter("boardId"));
		request.setAttribute("boardId", boardId);
		request.getRequestDispatcher("post_code_write.jsp").forward(request, response);
  }
	
	@Override
	public void searchPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long boardId=Long.parseLong(request.getParameter("boardId"));
		String search=request.getParameter("search");
		
		BoardDTO dto= new BoardDTO(null, null, boardId, search, null, null, null, search, null, null, null, null,null);
		//마이바티스 실행
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		
		ArrayList<BoardDTO> list = mapper.searchPost(dto);
		String boardType=mapper.getboardType(boardId);
		sql.close();
		
		request.setAttribute("list", list);
		request.setAttribute("boardType", boardType);
		request.setAttribute("boardId", boardId);
		
		request.getRequestDispatcher("post_list.jsp").forward(request, response);
	}
	@Override
	public void searchPostIndex(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search=request.getParameter("search");
		BoardDTO dto= new BoardDTO(null, null, null, search, null, null, null, search, null, null, null, null, null);
		//마이바티스 실행
		SqlSession sql = sqlSessionFactory.openSession(true);
		BoardMapper mapper = sql.getMapper(BoardMapper.class);
		
        ArrayList<BoardDTO> posts = mapper.searchPostIndex(dto);
        sql.close();
        
        request.setAttribute("search", search);
        request.setAttribute("posts", posts);
		
		request.getRequestDispatcher("/board/post_index_search_list.jsp").forward(request, response);
	}
}
