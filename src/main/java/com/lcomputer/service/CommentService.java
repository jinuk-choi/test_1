package com.lcomputer.service;

import java.util.ArrayList;
import com.lcomputer.dao.CommentDAO;
import com.lcomputer.vo.Board;
import com.lcomputer.vo.Comment;

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
	
	public ArrayList<Comment> getComment(int a_idx) {
		return dao.getComment(a_idx);
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

	
	
	
	
	
	

}
