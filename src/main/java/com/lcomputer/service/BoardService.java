package com.lcomputer.service;

import java.util.ArrayList;

import com.lcomputer.dao.BoardDAO;
import com.lcomputer.vo.Board;
import com.lcomputer.vo.Pagination;
import com.lcomputer.vo.Search;


public class BoardService {
	
	private static BoardService service = null;
	private static BoardDAO dao = null;
    
	private BoardService() {
		
	}

	public static BoardService getInstance() {
		if(service == null) {
			service = new BoardService();
			dao = BoardDAO.getInstance();
		}
		return service;
	}

	public ArrayList<Board> getBoard(Pagination pagination) {
		return dao.getBoard(pagination);
	}
	
	public int getCount(Search search) {
		return dao.getCount(search);
	}
	
	public void insertBoard(Board board) {
		dao.insertBoard(board);
	}
	
	public Board getBoardById(int aIdx) {
		return dao.getBoardById(aIdx);
	}
	
	public void editBoard(Board board) {
		dao.editBoard(board);
	}
	
	public void deleteBoard(Board board) {
		dao.deleteBoard(board);
	}
	

	
	
	
	
	
	
	
	
	
	
	

}
