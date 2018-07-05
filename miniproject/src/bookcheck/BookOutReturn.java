package bookcheck;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import books.booksManagement;

public class BookOutReturn {
	
	//대출 처리 메서드
	public void checkOut(booksManagement books) { //책이름, 카테고리, 아이디,
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db연결
			System.out.println("연결 확인");
			
			//date_add()메서드를 사용해 빌린날짜로부터 2달 이후의 날짜를 입력한다.
			pstmt = conn.prepareStatement("insert into books_out_in(m_id, book_cate, book_name, book_out_date, book_limit_date) values(?,?,?,now(),date_add(now(), interval 2 month)"); //쿼리문준비
			
			//1번 인덱스에는 세션에서 받은 아이디값
			pstmt.setString(2, books.getBook_cate());
			pstmt.setString(3, books.getBook_name());
			
			pstmt.executeUpdate(); //쿼리문 실행

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	//반납처리 리스트
	public void checkIn(int bookNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db연결
			System.out.println("연결 확인");
			
			pstmt = conn.prepareStatement("update books_out_in set book_in_date=now() where logs=?"); //쿼리문준비
			
			//1번 인덱스에는 세션에서 받은 아이디값
			pstmt.setInt(1, bookNo);
			
			pstmt.executeUpdate(); //쿼리문 실행
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
