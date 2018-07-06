package book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import book.bookDuo;

public class bookDuo {
	
	
	public void booktext(int no, String id, String name, String text) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    
	try {
		Class.forName("com.mysql.jdbc.Driver");
			 
		String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";		
		String dbUserId = "books_id01";
		String dbPassword = "books_pw01";
		
		conn = DriverManager.getConnection(URL, dbUserId, dbPassword);
	
		System.out.println("데이터 베이스 연결");
		
		pstmt = conn.prepareStatement("insert into board_comment (info, m_id, m_name, board_comment_contents, board_comment_date) values(?,?,?,?,now())");
		pstmt.setInt(1, no);
		pstmt.setString(2, id);
		pstmt.setString(3, name);
		pstmt.setString(4, text);
		
		pstmt.executeUpdate();
		
	} catch(SQLException | ClassNotFoundException a) {
			System.out.println(a.getMessage() + "<-- catch");
			
	} finally{
			
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			catch(SQLException a) {
				System.out.println(a.getMessage() + "<-- catch");
			}
		}		
	}
	
	public bookDso booktextSelect(int no) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    bookDso b = null;
	    
	try {
		Class.forName("com.mysql.jdbc.Driver");
			 
		String URL = "jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr";		
		String dbUserId = "books_id01";
		String dbPassword = "books_pw01";
		
		conn = DriverManager.getConnection(URL, dbUserId, dbPassword);
	
		System.out.println("데이터 베이스 연결");
		
		b = new bookDso();
		
		pstmt = conn.prepareStatement("select info, m_id, m_name, board_comment_contents, board_comment_date board_comment where info=?");	
		pstmt.setInt(1, no);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			b.setM_id(rs.getString("m_id"));
			b.setM_name(rs.getString("m_name"));
			b.setText(rs.getString("board_comment_contents"));
		}
	} catch(SQLException | ClassNotFoundException a) {
			System.out.println(a.getMessage() + "<-- catch");
			
	} finally{
			
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			catch(SQLException a) {
				System.out.println(a.getMessage() + "<-- catch");
			}
		}
	return b;		
	}
}
