package com.kkodamkkodam.controller;

import java.io.IOException;

import com.kkodamkkodam.user.service.UserService;
import com.kkodamkkodam.user.service.UserServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("*.user") 
public class UserController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public UserController() {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req, resp);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI(); 
		String path = request.getContextPath();
		String command = uri.substring(path.length());
		
		UserService service = new UserServiceImpl();

		if (command.equals("/user/join.user")) {
	        request.getRequestDispatcher("join.jsp").forward(request, response);
	    } else if (command.equals("/user/joinForm.user")) {
	        service.join(request, response); // 회원 가입 처리
	    } else if (command.equals("/user/login.user")) {
	        request.getRequestDispatcher("login.jsp").forward(request, response);
	    } else if (command.equals("/user/loginForm.user")) {
	    	service.login(request, response);
	    } else if (command.equals("/user/modify.user")) {
	    	request.getRequestDispatcher("modify.jsp").forward(request, response);
	    } else if (command.equals("/user/modifyForm.user")) {
	    	service.update(request, response);
	    } else if (command.equals("/user/mypage.user")) {
	    	request.getRequestDispatcher("mypage.jsp").forward(request, response);
	    } else if (command.equals("/user/logout.user")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/index.jsp"); // 메인 화면으로
		} else if (command.equals("/user/delete.user")) {
			request.getRequestDispatcher("delete.jsp").forward(request, response);
		} else if (command.equals("/user/delete_check.user")) {
			request.getRequestDispatcher("delete_check.jsp").forward(request, response);
		} else if (command.equals("/user/deleteForm.user")) {
			service.delete(request, response);
		}
	}
}
