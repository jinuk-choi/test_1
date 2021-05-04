package com.lcomputer.service;

import java.util.ArrayList;
import com.lcomputer.dao.CommentDAO;
import com.lcomputer.vo.Board;
import com.lcomputer.vo.Comment;
import com.lcomputer.vo.Pagination;
import com.lcomputer.vo.Search;

public class CommentService {
	
	private static CommentService service = null;
	private static CommentDAO dao = null;
    
	private CommentService() {
		
	}
	
	public static CommentService getInstance() {
		if(service == null) {
			service = new CommentService();
			dao = CommentDAO.getInstance();
		}
		return service;
	}
	
	public ArrayList<Comment> getComment(Board board) {
		return dao.getComment(board);
	}
	
	public void insertComment(Comment comment) {
		dao.insertComment(comment);
	}
	
	public void deleteComment(Comment comment) {
		dao.deleteComment(comment);
	}
	
	public Comment getCommentById(int bIdx) {
		return dao.getCommentById(bIdx);
	}
	
	public void editComment(Comment comment) {
		dao.editComment(comment);
	}
	
	public int getCommentCount(Board board) {
		return dao.getCommentCount(board);
	}

	
	
	
	
	
	

}
