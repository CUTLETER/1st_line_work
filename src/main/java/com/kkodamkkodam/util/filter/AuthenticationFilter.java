package com.kkodamkkodam.util.filter;

import java.io.IOException;
import java.io.PrintWriter;

import com.kkodamkkodam.user.model.UserDTO;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebFilter({"/user/mypage.user", 
			"/user/modify.user", 
			"/user/delete.user", 
			"/user/delete_check.user",
			"/board/post_write.board",
			"/board/post_regi.board",
			"/board/post_code_write.board",
			"/board/post_code_regi.board",
			"/board/updatePostPage.board",
			"/board/updatePost.board",
			"/board/deletePost.board",
			"/board/commentWrite.board",
			"/board/replyWrite.board",
			"/board/deleteComment.board",
			"/board/increaseCommentLike.board"})
public class AuthenticationFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        
        UserDTO user = (UserDTO)session.getAttribute("user");
        
        if (user == null) {
            // 로그인 되지 않은 상태
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/user/login.user"); // 로그인 페이지로 리다이렉트
            return;
        }
        
        
        // 로그인 된 상태
        chain.doFilter(request, response);
	}
	

	
}
