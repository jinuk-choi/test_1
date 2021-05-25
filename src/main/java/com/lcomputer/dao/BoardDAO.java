package com.lcomputer.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.lcomputer.database.DBConnection;
import com.lcomputer.vo.Board;
import com.lcomputer.vo.Pagination;
import com.lcomputer.vo.Search;
import com.lcomputer.vo.User;


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
	
	

	
	
	public ArrayList<Board> getBoard(Pagination pagination) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		//int page = pagination.getPage();
		int pageNum = pagination.getPageNum();
		
		int type = Search.NONE;
		String keyword = null;
		List<String> columns = null;
		
		Search search = pagination.getSearch();
		String where = "";
		if (search != null ) {		// 입력된 검색어가 있다면
			type = search.getType();
			keyword = search.getKeyword();
			
			columns = new ArrayList<String>();
			
			switch (type) {
				case Search.TITLE:
					columns.add("a_title");
					break;
				case Search.WRITER:
					columns.add("a_writer");
					break;
				case Search.CONTENT:
					columns.add("a_content");
					break;
				case Search.TITLE_CONTENT:
					columns.add("a_content");
					columns.add("a_title");
					break;
				default:
					break;
			}
			
			where = "WHERE ";
			for (int i=0; i<columns.size(); i++) {				
				where += columns.get(i) + " LIKE ? ";
				
				if (i < columns.size()-1)
					where += " OR ";
			}
		}
		
		try {
			conn = DBConnection.getConnection();
			//String query = "select * from board limit 3";
			String query = new StringBuilder()
					.append("SELECT 		@ROWNUM := @ROWNUM - 1 AS ROWNUM, ")
					.append("				ta.*, tb.u_id, tb.u_name, tb.u_auth \n")
					.append("FROM 			board ta \n")
					.append("LEFT JOIN 		user tb ON ta.u_idx = tb.u_idx, \n")
					.append("				(SELECT @rownum := (SELECT	COUNT(*)-?+1 FROM board ta))tc \n")
					.append(where)
					.append("ORDER BY		a_group DESC, a_order DESC ")
					.append("LIMIT			?, 3 \n")
					.toString();
	       	pstmt = conn.prepareStatement(query); 
	       	
	       	pstmt.setInt(1, pageNum);
	       	int index = 2;
		       	if (search != null) {
			      	for (String column : columns) {
			       		pstmt.setString(index, "%"+keyword+"%");
			       		index++; 
			       	}
		       	} 		       	
	       	pstmt.setInt(index, pageNum);

	        rs = pstmt.executeQuery();
	        list = new ArrayList<Board>();

	        while(rs.next()){     
	        	Board board = new Board();
	        	board.setRownum(rs.getInt("ROWNUM"));
      	       	board.setA_idx(rs.getInt("a_idx"));
       	       	board.setA_title(rs.getString("a_title"));
       	       	board.setA_content(rs.getString("a_content"));
       	       	board.setA_count(rs.getInt("a_count"));
       	       	board.setA_date(rs.getString("a_date"));
       	       	board.setA_group(rs.getInt("a_group"));
       	       	board.setA_order(rs.getInt("a_order"));
       	       	board.setA_depth(rs.getInt("a_depth"));
       	       	board.setU_idx(rs.getInt("u_idx"));
       	       	
       	       	User user = new User();
    	       	user.setU_name(rs.getString("u_name"));
    	       	user.setU_idx(rs.getInt("u_idx"));
    	       	user.setU_auth(rs.getInt("u_auth"));
    	        board.setUser(user);
       	       	
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
		} return list;
	} 
	
		
		
	

	
	
	
	
	
	public void insertBoard(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
			
		try {
			conn = DBConnection.getConnection();
			String sql = "insert into board(a_idx,a_title,a_count,a_content,a_group,a_order,a_depth,u_idx) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getA_idx());
			pstmt.setString(2, board.getA_title());
			pstmt.setInt(3, board.getA_count());
			pstmt.setString(4, board.getA_content());
			pstmt.setInt(5, board.getA_group());
			pstmt.setInt(6, board.getA_order());
			pstmt.setInt(7, board.getA_depth());
			pstmt.setInt(8, board.getU_idx());
			pstmt.executeUpdate();
			pstmt.close();
			if (board.getA_group() == 0) {	// 원글
				// 원글의 a_group 을 auto_increment 된 a_idx 로 수정
				sql = "update board set a_group = last_insert_id() where a_idx = last_insert_id()";
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
			} else  {						// 답글
				
				sql = "update board set a_order = a_order + 1 where a_group = ? and a_order >= ? and a_idx <> last_insert_id()";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, board.getA_group());
				pstmt.setInt(2, board.getA_order());
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
	
	
	public int getCount(Search search) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;	
		
		
		int type = Search.NONE;
		String keyword = null;
		List<String> columns = null;
		
		String where = "";
		if (search != null) {		// 입력된 검색어가 있다면
			type = search.getType();
			keyword = search.getKeyword();
			
			columns = new ArrayList<String>();
			
			switch (type) {
				case Search.TITLE:
					columns.add("a_title");
					break;
				case Search.WRITER:
					columns.add("a_writer");
					break;
				case Search.CONTENT:
					columns.add("a_content");
					break;
				case Search.TITLE_CONTENT:
					columns.add("a_content");
					columns.add("a_title");
					break;
				default:
					break;
			}
			
			where = "WHERE ";
			for (int i=0; i<columns.size(); i++) {				
				where += columns.get(i) + " LIKE ? ";
				
				if (i < columns.size()-1)
					where += " OR ";
			}
		}

		try {
			conn = DBConnection.getConnection();
			String query =  new StringBuilder()
				        .append("SELECT COUNT(*) count FROM board  ")
				        .append(where)
				        .toString();
	       	pstmt = conn.prepareStatement(query);
	    
	       	int index = 1;
		       	if (search != null) {
			      	for (String column : columns) {
			       		pstmt.setString(index, "%"+keyword+"%");
			       		index++; 
			       	}
		       	} 		       	
	        	
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
		    String query = "select ta.*, tb.u_id, tb.u_name from board ta left join user tb on ta.u_idx=tb.u_idx where a_idx=? ";
		   	pstmt = conn.prepareStatement(query);
		   	pstmt.setInt(1, aIdx);
		   	
		    rs = pstmt.executeQuery();
		
		    if(rs.next()){     
	   	      
	           board = new Board();
	           board.setA_idx(rs.getInt("a_idx"));
	           board.setA_title(rs.getString("a_title"));
	           board.setA_content(rs.getString("a_content"));
	           board.setA_count(rs.getInt("a_count"));
	           board.setA_date(rs.getString("a_date"));
	           board.setA_group(rs.getInt("a_group"));
	           board.setA_order(rs.getInt("a_order"));
	           board.setA_depth(rs.getInt("a_depth"));
	           board.setU_idx(rs.getInt("u_idx"));
	           User user = new User();
	           user.setU_name(rs.getString("u_name"));
	           board.setUser(user);
	        
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
			String sql = "UPDATE board SET a_title = ?,a_count = ?,a_content = ? WHERE  a_idx = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, board.getA_title());
			pstmt.setInt(2, board.getA_count());
			pstmt.setString(3, board.getA_content());
			pstmt.setInt(4, board.getA_idx());
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
	
	public void deleteBoard(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
			
		try {
			conn = DBConnection.getConnection();
			String sql = "DELETE FROM board WHERE  a_idx = ? ";
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, board.getA_idx());
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
	
	public void updateBoardCount(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		 try {
			 	conn = DBConnection.getConnection();
		        String sql = "update board set a_count = a_count+1 where a_idx= ? " ;

		        pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, board.getA_idx());
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


