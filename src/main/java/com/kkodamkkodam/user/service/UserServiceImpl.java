package com.kkodamkkodam.user.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kkodamkkodam.user.model.UserDTO;
import com.kkodamkkodam.user.model.UserMapper;
import com.kkodamkkodam.util.mybatis.MybatisUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserServiceImpl implements UserService {
	
	private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();


	// 가입
	@Override
	public void join(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        try (SqlSession session = sqlSessionFactory.openSession()) {
            UserMapper mapper = session.getMapper(UserMapper.class);

            String id = request.getParameter("id");
            String pw = request.getParameter("pw");
            String name = request.getParameter("name");
            String rePw = request.getParameter("rePw");
            boolean checked = mapper.checkId(id) != null;
            
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            
            if (!pw.equals(rePw)) {
                request.setAttribute("message", "비밀번호가 일치하지 않습니다.");
                request.getRequestDispatcher("join.jsp").forward(request, response);
                return;
            }

            if (checked) {
                out.print("{\"이미 존재하는 아이디입니다.\"}");
                request.getRequestDispatcher("join.jsp").forward(request, response);
                return;
            } else {
            	out.print("{\"사용 가능한 아이디입니다.\"}");
            }

            UserDTO dto = new UserDTO();
            dto.setId(id);
            dto.setPw(pw);
            dto.setName(name);

            mapper.join(dto);
            session.commit();

            response.sendRedirect("login.jsp"); 
        }

	}

	// 로그인
	@Override
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		
		String id = request.getParameter("id");
	    String pw = request.getParameter("pw");
	    String check =  request.getParameter("check");
	    
	    UserDTO dto = new UserDTO();
	    
	    dto.setId(id);
	    dto.setPw(pw);
	    
	    UserDTO resultDto = null;
	    
	    try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
	        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
	        
	        resultDto = userMapper.login(id, pw);
	        
	        if (resultDto != null) { // 로그인 성공 시
	            HttpSession session = request.getSession();
	            session.setAttribute("id", resultDto.getId());
	            session.setAttribute("pw", resultDto.getPw());
	            
	            // 쿠키
	            if(check != null && check.equals("check")) {
	            	Cookie cookie = new Cookie("id", id);
	            	cookie.setMaxAge(10); // 쿠키 유효 시간 임시로 10초 설정 - 추후 수정할 것
	            	response.addCookie(cookie);
	            	response.sendRedirect("../index.jsp");
	            	cookie.setPath("/");
	            } else {
	            	Cookie noCookie = new Cookie("check", null);
	            	noCookie.setMaxAge(0);
	            	response.addCookie(noCookie);
	            	response.sendRedirect("../index.jsp");
	            }
	           
	            
	            
	        } else { // 로그인 실패 시
	            request.setAttribute("error", "아이디 또는 비밀번호가 틀렸습니다.");
	            request.getRequestDispatcher("login.jsp").forward(request, response); 
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "다시 시도해 주세요.");
	        request.getRequestDispatcher("login.jsp").forward(request, response);
	    }
	}
		
	@Override
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String rePw = request.getParameter("rePw");
		String name = request.getParameter("name");
		
		UserDTO dto = new UserDTO(id, pw, name);
        
        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
        	UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        	
        	if (pw == null || rePw == null || !pw.equals(rePw)) {
        		request.setAttribute("error", "비밀번호를 정확히 입력해주세요.");
        		request.getRequestDispatcher("modify.jsp").forward(request, response);
        		return;
        	}
        	
        	
        	int result = mapper.update(dto);
        	
        	if (result == 1) {
        		HttpSession session = request.getSession();
        		PrintWriter out = response.getWriter();
    			out.println("<script>");
    			out.println("alert('회원 정보가 수정되었습니다.');");
    			out.println("location.href='mypage.user';");
    			out.println("</script>");
        		
        	} else {
        		response.sendRedirect("mypage.user");
        	}
		}
        
        catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "다시 시도해 보세요.");
			request.getRequestDispatcher("modify.jsp").forward(request, response);
		}
	} 
	
	@Override
	public void getPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}


}
