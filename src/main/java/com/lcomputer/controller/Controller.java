package com.lcomputer.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lcomputer.service.UserService;
import com.lcomputer.vo.Pagination;
import com.lcomputer.vo.User;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int usercount = 0;
	HttpSession session = null;
	
	
	
	
	String checkSession(HttpServletRequest request, HttpServletResponse response, String command) {
		HttpSession session = request.getSession();
		
		String[] authList = {
				"/user-list.do"
				,"/user-insert.do"
				,"/user-insert-process.do"
				,"/user-detail.do"
				,"/user-edit.do"
				,"/user-edit-process.do"
				,"/logout.do"
			};
		
		for (String item : authList) {
			if (item.equals(command)) {
				if (session.getAttribute("u_idx") == null) {
					command = "/access-denied.do";
				}
			}
		}
		return command;
	}
	




	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		String view = null;
		
		int page = 1;
		int pageNum = 0;
		String pw = null;
		String idx = null;
		
		command = checkSession(request, response, command);
		
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
			
		switch (command) {
			case "/user-list.do":
				String reqPage = request.getParameter("page");
				if (reqPage != null) { 
					page = Integer.parseInt(reqPage);
				}
				UserService userService = UserService.getInstance();
				ArrayList<User> list = userService.getUsers(page);
				Pagination pagination = new Pagination(page);
				usercount = userService.getUsersCount();
												
				request.setAttribute("list", list);
				request.setAttribute("usercount", usercount);
				request.setAttribute("pagination", pagination);
				
				view = "user/list";
				break;
					
		
			case "/user-insert.do":
				view = "user/insert";
				break;
			case "/user-insert-process.do":
					User user = new User();
					user.setU_id(request.getParameter("id"));
					user.setU_pw(request.getParameter("password"));
					user.setU_name(request.getParameter("name"));
					user.setU_tel(request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-" + request.getParameter("tel3"));
					user.setU_age(request.getParameter("age"));
					
					userService = UserService.getInstance();
					userService.insertUser(user);
							
					view = "user/insert-result";
					break;
					
			case "/user-login.do":
				view = "user/login";
				break;
				
			case "/user-login-process.do":
				idx = request.getParameter("login_id");
				pw = request.getParameter("login_password");
				
				userService = UserService.getInstance();
				user = userService.loginUser(idx,pw);
							
				if(user != null) {
					session = request.getSession();
					session.setAttribute("u_idx", user.getU_idx());
					session.setAttribute("u_id", user.getU_id());
//					session.setAttribute("u_pw", user.getU_pw());
					session.setAttribute("u_name", user.getU_name());
//					session.setAttribute("user", user);
			
					view = "user/login-result";
				} else {
					view = "user/login-fail";
				}			
				
				break;
				
			case "/logout.do":
				session = request.getSession();
				session.invalidate();
				view = "user/login";
				break;		
				
		
			
			case "/access-denied.do":
				view = "user/access-denied";
				break;
	
		}
		
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher(view+".jsp");
		rd.forward(request, response);

	}
}

