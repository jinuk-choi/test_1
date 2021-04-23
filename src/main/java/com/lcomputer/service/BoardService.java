package com.lcomputer.service;

import java.util.ArrayList;

import com.lcomputer.dao.BoardDAO;
import com.lcomputer.vo.Board;


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

	public ArrayList<Board> getBoard(int page) {
		return dao.getBoard(page);
	}
	
	public int getCount() {
		return dao.getCount();
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
