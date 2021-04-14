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
	
		try {
			conn = DBConnection.getConnection();
			//String query = "select * from user limit ?,3";
			String query = new StringBuilder()
					.append("SELECT 		* ")
					.append("FROM 			board ")
					.append("LIMIT			?, 3 ")
					.toString();
	       	pstmt = conn.prepareStatement(query); 
	       	pstmt.setInt(1, page);
	        rs = pstmt.executeQuery();
	        list = new ArrayList<Board>();

	        while(rs.next()){     
	        	Board board = new Board();
	        	
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
	
	


}
