package com.lcomputer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lcomputer.database.DBConnection;
import com.lcomputer.vo.Board;
import com.lcomputer.vo.Comment;
import com.lcomputer.vo.Pagination;
import com.lcomputer.vo.Search;
import com.lcomputer.vo.User;

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
	
	
	public ArrayList<Comment> getComment(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Comment> list = null;
		Pagination pagination = board.getPagination();
		int pageNum = pagination.getPageNum();
		
		try {
			conn = DBConnection.getConnection();
			String query = new StringBuilder()
					.append("SELECT ta.*, tb.u_name, tb.u_id FROM comment ta LEFT JOIN user tb ON ta.u_idx = tb.u_idx WHERE a_idx=? ")
					.append("ORDER BY		b_group DESC, b_order DESC ")
					.append("LIMIT ?,3")
					.toString();
	       	pstmt = conn.prepareStatement(query); 
	       	pstmt.setInt(1, board.getA_idx());
	       	pstmt.setInt(2, pageNum);
	       	rs = pstmt.executeQuery();
	        list = new ArrayList<Comment>();
	        
	        while(rs.next()){     
	        	Comment comment = new Comment();
	        	comment.setA_idx(rs.getInt("a_idx"));
      	       	comment.setB_idx(rs.getInt("b_idx"));
       	        comment.setU_idx(rs.getInt("u_idx"));
       	       	comment.setB_content(rs.getString("b_content"));
       	       	comment.setB_group(rs.getInt("b_group"));
	       	    comment.setB_order(rs.getInt("b_order"));
	       	    comment.setB_depth(rs.getInt("b_depth"));
       	             	   
       	      	User user = new User();
       	       	user.setU_name(rs.getString("u_name"));
       	       	user.setU_idx(rs.getInt("u_idx"));
       	        comment.setUser(user);
       	        
      
       	        
       	      
       	       	
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
			String sql = "insert into comment(b_idx,u_idx,b_content,a_idx,b_group,b_order,b_depth) values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment.getB_idx());
			pstmt.setInt(2, comment.getU_idx());
			pstmt.setString(3, comment.getB_content());
			pstmt.setInt(4, comment.getA_idx());
			pstmt.setInt(5, comment.getB_group());
			pstmt.setInt(6, comment.getB_order());
			pstmt.setInt(7, comment.getB_depth());
			pstmt.executeUpdate();
			pstmt.close();
			
			if (comment.getB_group() == 0) {	// 원글
				// 원글의 b_group 을 auto_increment 된 b_idx 로 수정
				sql = "update comment set b_group = last_insert_id() where b_idx = last_insert_id()";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
			} else  {						// 답글
				
				sql = "update comment set b_order = b_order + 1 where b_group = ? and b_order >= ? and b_idx <> last_insert_id()";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, comment.getB_group());
				pstmt.setInt(2, comment.getB_order());
				pstmt.executeUpdate();
			} 
		
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
			    String query = "SELECT ta.*, tb.u_name, tb.u_id FROM comment ta LEFT JOIN user tb ON ta.u_idx = tb.u_idx where b_idx=?";
			   	pstmt = conn.prepareStatement(query);
			   	pstmt.setInt(1, bIdx);
			   	
			    rs = pstmt.executeQuery();
			
			    if(rs.next()){     
		   	      
		           comment = new Comment();
		           comment.setB_idx(rs.getInt("b_idx"));
		           comment.setU_idx(rs.getInt("u_idx"));
		           comment.setB_title(rs.getString("b_title"));
		           comment.setB_content(rs.getString("b_content"));
		           comment.setB_group(rs.getInt("b_group"));
		       	   comment.setB_order(rs.getInt("b_order"));
		       	   comment.setB_depth(rs.getInt("b_depth"));
		        		         
		           User user = new User();
		           user.setU_name(rs.getString("u_name"));
		           comment.setUser(user);
		           
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
			String sql = "UPDATE comment SET a_idx = ?, b_content = ? WHERE  b_idx = ? ";
			pstmt = conn.prepareStatement(sql);
			
			//pstmt.setInt(1, comment.getU_idx());
			pstmt.setInt(1, comment.getA_idx());
			pstmt.setString(2, comment.getB_content());
			pstmt.setInt(3, comment.getB_idx());
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
	
	public int getCommentCount(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;	
		try {
			conn = DBConnection.getConnection();
			String query =  new StringBuilder()
				        .append("SELECT COUNT(*) count FROM comment WHERE a_idx = ?  ")				     
				        .toString();
	       	pstmt = conn.prepareStatement(query);	
	       	pstmt.setInt(1, board.getA_idx() );
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
}
	


