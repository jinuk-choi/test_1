package com.lcomputer.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lcomputer.database.DBConnection;
import com.lcomputer.vo.Board;


public class BoardDAO {
	
private static BoardDAO dao = null;
    
	private BoardDAO() {
		
	}

	public static BoardDAO getInstance() {
		if(dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}
	
	

	public ArrayList<Board> getBoard(int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		int pageNum = (page-1)*3;
		


		
	
		try {
			conn = DBConnection.getConnection();
			//String query = "select * from board limit 3";
			String query = new StringBuilder()
					.append("SELECT 		@ROWNUM := @ROWNUM - 1 AS ROWNUM,\n")
					.append("				ta.*\n")
					.append("FROM 			board ta,\n")
					.append("				(SELECT @rownum := (SELECT	COUNT(*)-?+1 FROM board ta)) tb\n")
					.append("LIMIT			?, 3\n")
					.toString();
	       	pstmt = conn.prepareStatement(query); 
	       	pstmt.setInt(1, pageNum);
	       	pstmt.setInt(2, pageNum);
	        rs = pstmt.executeQuery();
	        list = new ArrayList<Board>();

	        while(rs.next()){     
	        	Board board = new Board();
	        	board.setRownum(rs.getInt("ROWNUM"));
      	       	board.setA_idx(rs.getInt("a_idx"));
       	        board.setA_writer(rs.getString("a_writer"));
       	       	board.setA_title(rs.getString("a_title"));
       	       	board.setA_content(rs.getString("a_content"));
       	       	board.setA_count(rs.getInt("a_count"));
       	       	
       	       	list.add(board);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	 return list;
	}
	
	public void insertBoard(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
			
		try {
			conn = DBConnection.getConnection();
			String sql = "insert into board(a_idx,a_writer,a_title,a_count,a_content) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getA_idx());
			pstmt.setString(2, board.getA_writer());
			pstmt.setString(3, board.getA_title());
			pstmt.setInt(4, board.getA_count());
			pstmt.setString(5, board.getA_content());
			pstmt.executeUpdate();
		} catch( Exception ex) {
			System.out.println("SQLException : "+ex.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public int getCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			String query = "SELECT COUNT(*) count FROM board ";
	       	pstmt = conn.prepareStatement(query);
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()){     
	        	count = rs.getInt("count");
	        }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	public Board getBoardById(int aIdx) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		Board board = null;
		
		try {
			conn = DBConnection.getConnection();
		    String query = "select * from board where a_idx=?";
		   	pstmt = conn.prepareStatement(query);
		   	pstmt.setInt(1, aIdx);
		   	
		    rs = pstmt.executeQuery();
		
		    if(rs.next()){     
	   	      
	           board = new Board();
	           board.setA_idx(rs.getInt("a_idx"));
	           board.setA_writer(rs.getString("a_writer"));
	           board.setA_title(rs.getString("a_title"));
	           board.setA_content(rs.getString("a_content"));
	           board.setA_count(rs.getInt("a_count"));
	           
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	    
		return board;
	}
	
	public void editBoard(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
			
		try {
			conn = DBConnection.getConnection();
			String sql = "UPDATE board SET a_idx = ?,a_writer = ?,a_title = ?,a_count = ?,a_content = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getA_idx());
			pstmt.setString(2, board.getA_writer());
			pstmt.setString(3, board.getA_title());
			pstmt.setInt(4, board.getA_count());
			pstmt.setString(5, board.getA_content());
			pstmt.executeUpdate();
		} catch( Exception ex) {
			System.out.println("SQLException : "+ex.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}


