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

import com.lcomputer.service.BoardService;
import com.lcomputer.service.CommentService;
import com.lcomputer.service.UserService;
import com.lcomputer.vo.Board;
import com.lcomputer.vo.Comment;
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
				/*,"/user-insert.do"
				,"/user-insert-process.do"
				,"/user-detail.do"
				,"/user-edit.do"
				,"/user-edit-process.do"
				,"/logout.do"  */
				
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
		String reqPage = null;
		String pw = null;
		String idx = null;
		int count = 0;
		BoardService boardService = null;
		CommentService commentService = null;
		Pagination pagination = null;
		ArrayList<User> list = null;
		ArrayList<Board> boardList = null;
		ArrayList<Comment> commentList = null;
		int aIdx = 0;
		Board board = null;
		Comment comment = null;
		
		
		
		command = checkSession(request, response, command);
		
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
			
		switch (command) {
			case "/user-list.do":
				reqPage = request.getParameter("page");
				if (reqPage != null) { 
					page = Integer.parseInt(reqPage);
				}
				UserService userService = UserService.getInstance();
				list = userService.getUsers(page);
				count = userService.getUsersCount();
				
				pagination = new Pagination(page, count);
												
				request.setAttribute("list", list);
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
					session.setAttribute("u_pw", user.getU_pw());
					session.setAttribute("u_name", user.getU_name());
					session.setAttribute("user", user);
			
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
				
			case "/board-list.do":
				reqPage = request.getParameter("page");
				if (reqPage != null) { 
					page = Integer.parseInt(reqPage);
					
				}
				boardService = BoardService.getInstance();
				boardList = boardService.getBoard(page);
				count = boardService.getCount();	
				pagination = new Pagination(page, count);
												
			
				request.setAttribute("list", boardList);
				request.setAttribute("pagination", pagination);							
				
				
				view = "board/list";
				break;
				
				
			case "/board-insert.do":
				view = "board/insert";
				break;
				
			case "/board-insert-process.do":
				board = new Board();
				board.setA_writer(request.getParameter("id"));
				board.setA_title(request.getParameter("title"));
				board.setA_content(request.getParameter("content"));
				
				boardService = BoardService.getInstance();
				boardService.insertBoard(board);
						
				view = "board/insert-result";
				break;
				
			case "/board-detail.do":
				aIdx = Integer.parseInt(request.getParameter("a_idx"));
				boardService = BoardService.getInstance();
				board = boardService.getBoardById(aIdx);
				
				commentService = CommentService.getInstance();
				commentList = commentService.getComment(aIdx);
				
				request.setAttribute("board", board);
				request.setAttribute("list", commentList);
				view = "board/detail";
				break;
			
			case "/board-edit.do":
				aIdx = Integer.parseInt(request.getParameter("a_idx"));
				boardService = BoardService.getInstance();
				board = boardService.getBoardById(aIdx);
				
				request.setAttribute("board", board);
				
				view = "board/edit";
				break;
				
			case "/board-edit-process.do":
				
				
				board = new Board();
				board.setA_idx(Integer.parseInt(request.getParameter("a_idx")));
				board.setA_writer(request.getParameter("id"));
				board.setA_title(request.getParameter("title"));
				board.setA_content(request.getParameter("content"));
				
				boardService = BoardService.getInstance();
				boardService.editBoard(board);
						
				view = "board/insert-result";
				break;
			
			case "/board-delete.do":
				
				
				board = new Board();
				board.setA_idx(Integer.parseInt(request.getParameter("a_idx")));
				
				
				boardService = BoardService.getInstance();
				boardService.deleteBoard(board);
						
				view = "board/delete";
				break;
				
			case "/comment-insert.do":
				comment = new Comment();
				comment.setB_name(request.getParameter("id"));
				comment.setB_title(request.getParameter("title"));
				comment.setB_content(request.getParameter("content"));
				comment.setA_idx(Integer.parseInt(request.getParameter("a_idx")));						
				commentService = CommentService.getInstance();
				commentService.insertComment(comment);
						
				view = "board/insert-result";
				break;

				
	
		}
		
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher(view+".jsp");
		rd.forward(request, response);

	}
}


