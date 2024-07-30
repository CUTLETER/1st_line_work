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
			"/user/delete_check.user"})
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
        	httpResponse.setContentType("text/html; charset=UTF-8;");
        	PrintWriter out = response.getWriter();
        	out.println("<script>");
        	out.println("alert('로그인 후 이용해 주세요.');");
        	out.println("location.href='"+ httpRequest.getContextPath()+"/user/login.user';"); // 로그인 페이지 경로로 수정
        	out.println("</script>");
        	return;
        }
        
        // 로그인 된 상태
        chain.doFilter(request, response);
	}
	

	
}
