package com.lcomputer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lcomputer.database.DBConnection;
import com.lcomputer.vo.Board;
import com.lcomputer.vo.Comment;

public class CommentDAO {
	
private static CommentDAO dao = null;

	private CommentDAO() {
		
	}
	
	public static CommentDAO getInstance() {
		if(dao==null) {
			dao = new CommentDAO();
		}
		return dao;
	}
	
	
	public ArrayList<Comment> getComment(int a_idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Comment> list = null;
		
		
		try {
			conn = DBConnection.getConnection();
			String query = new StringBuilder()
					.append("SELECT * FROM comment WHERE a_idx=?")
					.toString();
	       	pstmt = conn.prepareStatement(query); 
	       	pstmt.setInt(1,a_idx);
	       	rs = pstmt.executeQuery();
	        list = new ArrayList<Comment>();
	        
	        while(rs.next()){     
	        	Comment comment = new Comment();
	        	//comment.setRownum(rs.getInt("ROWNUM"));
      	       	comment.setB_idx(rs.getInt("b_idx"));
       	        comment.setB_name(rs.getString("b_name"));
       	       	comment.setB_title(rs.getString("b_title"));
       	       	comment.setB_content(rs.getString("b_content"));
       	       	comment.setB_redate(rs.getString("b_redate"));
       	       	
       	       	list.add(comment);
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
	
	public void insertComment(Comment comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
			
		try {
			conn = DBConnection.getConnection();
			String sql = "insert into comment(b_idx,b_name,b_title,b_content,a_idx) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment.getB_idx());
			pstmt.setString(2, comment.getB_name());
			pstmt.setString(3, comment.getB_title());
			pstmt.setString(4, comment.getB_content());
			pstmt.setInt(5, comment.getA_idx());
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
	
	public void deleteComment(Comment comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
			
		try {
			conn = DBConnection.getConnection();
			String sql = "DELETE FROM comment WHERE  b_idx = ? ";
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, comment.getB_idx());
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
	
	public Comment getCommentById(int bIdx) {
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Connection conn = null;
			Comment comment = null;
			
			try {
				conn = DBConnection.getConnection();
			    String query = "select * from comment where b_idx=?";
			   	pstmt = conn.prepareStatement(query);
			   	pstmt.setInt(1, bIdx);
			   	
			    rs = pstmt.executeQuery();
			
			    if(rs.next()){     
		   	      
		           comment = new Comment();
		           comment.setB_idx(rs.getInt("b_idx"));
		           comment.setB_name(rs.getString("b_name"));
		           comment.setB_title(rs.getString("b_title"));
		           comment.setB_content(rs.getString("b_content"));
		           comment.setB_redate(rs.getString("b_redate"));
		           
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
		    
			return comment;
	}
	
	public void editComment(Comment comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
			
		try {
			conn = DBConnection.getConnection();
			String sql = "UPDATE comment SET b_name = ?,b_content = ?,b_redate = ? WHERE  b_idx = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, comment.getB_name());
			pstmt.setString(2, comment.getB_content());
			pstmt.setString(3, comment.getB_redate());
			pstmt.setInt(4, comment.getB_idx());
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


