package com.kkodamkkodam.util.filter;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebFilter({"/user/*"})
public class ChainFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        String id = (String)session.getAttribute("user");
        
        // 현재 요청 경로
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

        // 필터링 제외 대상
        if (path.contains("login") || path.contains("join")) {
            chain.doFilter(request, response);
            return;
        }

        
        if (session != null && id != null) {
            // 로그인 된 상태
            chain.doFilter(request, response);
        } else {
            // 로그인 되지 않은 상태
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/user/login.user"); // 로그인 페이지 경로로 수정

        }
	}
	

	
}
