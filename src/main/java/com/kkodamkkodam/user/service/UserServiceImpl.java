package com.kkodamkkodam.user.service;

import java.io.IOException;
import java.io.PrintWriter;

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
	
	// 중복 검사
	@Override
	public void checkId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
        SqlSession sqlSession = null;
        try {
            sqlSession = sqlSessionFactory.openSession();
            UserMapper mapper = sqlSession.getMapper(UserMapper.class);

            response.setContentType("text/plain;charset=UTF-8");
            PrintWriter out = response.getWriter();

            if (mapper.checkId(id) != null) {
                out.print("이미 존재하는 아이디입니다.");
            } else {
                out.print("사용 가능한 아이디입니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("오류가 발생했습니다.");
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
	}
	
	// 가입
	@Override
	public void join(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String action = request.getParameter("action");
	    
	    if ("checkId".equals(action)) {
	        checkId(request, response);
	        return;
	    }
	    
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String rePw = request.getParameter("rePw");		
		
	    SqlSession sqlSession = null;
	    
        try {
	        sqlSession = sqlSessionFactory.openSession();
	        UserMapper mapper = sqlSession.getMapper(UserMapper.class);

            if (!pw.equals(rePw)) {
            	request.setAttribute("message", "비밀번호가 일치하지 않습니다.");
            	request.getRequestDispatcher("join.jsp").forward(request, response);
            	return;
            }          
          
            UserDTO dto = new UserDTO();
            dto.setId(id);
            dto.setPw(pw);
            dto.setName(name);

            mapper.join(dto);
            sqlSession.commit();

            response.sendRedirect("login.jsp"); 
            
        } 
        
        catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("message", "회원가입에 실패했습니다. 다시 시도해 주세요.");
	        request.getRequestDispatcher("join.jsp").forward(request, response);
	    } finally {
	        if (sqlSession != null) {
	            sqlSession.close();
	        }
	    }

	}
	
	// 로그인
	@Override
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		String id = request.getParameter("id");
	    String pw = request.getParameter("pw");
	    String check = request.getParameter("check");

	    UserDTO dto = new UserDTO();
	    dto.setId(id);
	    dto.setPw(pw);

	    UserDTO resultDto = null;
	    SqlSession sqlSession = null;
	    
	    try {
	        sqlSession = sqlSessionFactory.openSession();
	        UserMapper mapper = sqlSession.getMapper(UserMapper.class);

	        resultDto = mapper.login(id, pw);

	        if (resultDto != null) { // 로그인 성공 시
	            HttpSession session = request.getSession();
	            session.setAttribute("user", resultDto);

	            // 쿠키
	            if (check != null && check.equals("check")) { // 아이디 기억하기 체크했을 시
	                Cookie cookie = new Cookie("id", id);
	                cookie.setMaxAge(60); // 쿠키 유효 시간 테스트 때문에 10초 설정 - 추후 수정할 것
	                cookie.setPath("/");
	                response.addCookie(cookie);
	            } else { // 체크 해지 했을 시
	                Cookie noCookie = new Cookie("check", null);
	                noCookie.setMaxAge(0);
	                response.addCookie(noCookie);
	            }
	            response.sendRedirect("../index.jsp");
	            
	        } else { // 로그인 실패 시
	            request.setAttribute("error", "아이디 또는 비밀번호가 틀렸습니다.");
	            request.getRequestDispatcher("login.jsp").forward(request, response);
	        }
	    } 
	    
	    catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "다시 시도해 주세요.");
	        request.getRequestDispatcher("login.jsp").forward(request, response);
	    } finally {
	        if (sqlSession != null) {
	            sqlSession.close();
	        }
	    }
	}

	// 수정
	@Override
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
	    String pw = request.getParameter("pw");
	    String rePw = request.getParameter("rePw");
	    String name = request.getParameter("name");
	    	    
	    if (pw == null || rePw == null || !pw.equals(rePw)) { // 입력한 비밀번호에 문제 있을 시
	        request.setAttribute("error", "비밀번호를 정확히 입력해주세요.");
	        request.getRequestDispatcher("modify.jsp").forward(request, response);
	        return;	        
	    }

	    UserDTO dto = new UserDTO(id, pw, name);
	    SqlSession sqlSession = null;
	    
	    try {
	        sqlSession = sqlSessionFactory.openSession();
	        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
	        
	        int result = mapper.update(dto);

	        if (result == 1) { // 정보 수정에 성공했을 시
	            sqlSession.commit();
	            session.setAttribute("user", dto);
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('회원 정보가 수정되었습니다.');");
	            out.println("location.href='" + request.getContextPath() + "/user/modify.user';");
	            out.println("</script>");
	        } else {
	            response.sendRedirect("modify.user");
	        }
	    } 
	    
	    catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "다시 시도해 보세요.");
	    }  finally {
	        if (sqlSession != null) {
	            sqlSession.close();
	        }
	    }
	}

	// 삭제
	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		UserDTO userInfo = (UserDTO) session.getAttribute("user");
	    if (userInfo == null) {
	        response.sendRedirect(request.getContextPath() + "/login.jsp");
	        return;
	    }
	    
	    String id = userInfo.getId();  // 세션에서 가져온 ID 사용
	    
	    String pw = request.getParameter("pw");
	    String rePw = request.getParameter("rePw");

	    if (pw == null || rePw == null || !pw.equals(rePw)) {
	        request.setAttribute("error", "비밀번호를 다시 입력해 주세요.");
	        request.getRequestDispatcher("delete_check.jsp").forward(request, response);
	        return;
	    }
	    
	    SqlSession sqlSession = null;
	    try {
	        sqlSession = sqlSessionFactory.openSession();
	        UserMapper mapper = sqlSession.getMapper(UserMapper.class);

	        UserDTO dto = mapper.login(id,pw);

	        if (dto == null) {
	            request.setAttribute("error", "잘못된 사용자 정보입니다.");
	            request.getRequestDispatcher("delete_check.jsp").forward(request, response);
	            return;
	        }

	        int result = mapper.delete(id);

	        if (result == 1) {
	            sqlSession.commit();
	            session.invalidate();
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('회원 탈퇴가 완료되었습니다.');");
	            out.println("location.href='" + request.getContextPath() + "/index.jsp';");
	            out.println("</script>");
	        } else {
	            request.setAttribute("error", "회원 탈퇴에 실패했습니다.");
	            request.getRequestDispatcher("delete_check.jsp").forward(request, response);
	        }
	    } 
	    
	    catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "다시 시도해 주세요.");
	        request.getRequestDispatcher("delete_check.jsp").forward(request, response);
	    } finally {
	        if (sqlSession != null) {
	            sqlSession.close();
	        }
	    }
	}

	// 계정 조회
	@Override
	public void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setName(name);
		
		UserDTO resultDto = null;
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sqlSessionFactory.openSession();
			UserMapper mapper = sqlSession.getMapper(UserMapper.class);
			
			resultDto = mapper.find(id, name);
			
			if (resultDto != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", resultDto);
			} else {
				request.setAttribute("error", "사용자 정보를 찾을 수 없습니다.");
				request.getRequestDispatcher("password.jsp").forward(request, response);
			}
				request.getRequestDispatcher("rePassword.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	
	
	}

	// 비밀번호 변경
	@Override
	public void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String rePw = request.getParameter("rePw");
		String name = request.getParameter("name");
		
		if (pw == null || rePw == null || !pw.equals(rePw)) {
			session.setAttribute("error ", "비밀번호를 올바르게 입력해 주세요.");
			request.getRequestDispatcher("rePassword.jsp").forward(request, response);
			return;
		}
		
		UserDTO dto = new UserDTO(id, pw, name);
		SqlSession sqlSession = null;
		
		try {
			sqlSession  = sqlSessionFactory.openSession();
			UserMapper mapper = sqlSession.getMapper(UserMapper.class);
			
			int result = mapper.change(dto);
			
			if (result == 1) {
				sqlSession.commit();
				session.setAttribute("pw", dto);
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('비밀번호가 변경되었습니다.');");
	            out.println("location.href='" + request.getContextPath() + "/user/login.user';");
	            out.println("</script>");
			} else {
				request.getRequestDispatcher("rePassword.jsp").forward(request, response);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "다시 시도해 주세요.");
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}




}
