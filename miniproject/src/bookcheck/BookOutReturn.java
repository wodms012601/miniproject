package bookcheck;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import books.booksManagement;

public class BookOutReturn {
	
	//대출 처리 메서드
	public void checkOut(booksManagement books, String mId) { //책이름, 카테고리, 아이디,
		Connection conn = null;
		PreparedStatement pstmt = null; //도서대출입력용
		PreparedStatement pstmt2 = null; //대출권수검색용
		PreparedStatement pstmt3 = null; //대출유무 및 대출권수 입력용
		ResultSet rs = null;
		String check = "유"; //대출 유무
		int bookCount = 0; //대출 권수
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db연결
			System.out.println("연결 확인");
			
			//date_add()메서드를 사용해 빌린날짜로부터 2달 이후의 날짜를 입력한다.
			pstmt = conn.prepareStatement("insert into books_out_in(m_id, book_info, book_cate, book_name, book_out_date, book_limit_date) values(?,?,?,?,now(),date_add(now(), interval 2 month))"); //쿼리문준비
			
			//1번 인덱스에는 세션에서 받은 아이디값
			pstmt.setString(1, mId);
			pstmt.setInt(2, books.getInfo());
			pstmt.setString(3, books.getBook_cate());
			pstmt.setString(4, books.getBook_name());
			
			pstmt.executeUpdate(); //쿼리문 실행
			
			//book_count컬럼에 있는값 +1을 해서 검색한뒤 그 값을 변수에 저장
			pstmt2 = conn.prepareStatement("select book_count+1 from member where m_id=?"); //쿼리문준비
			
			pstmt2.setString(1, mId);
			
			rs = pstmt2.executeQuery();
			
			if(rs.next()) {
				bookCount = rs.getInt("book_count+1");
				System.out.println(bookCount +"bookcount확인");
			}
			
			//대출했을경우 회원정보 update 대출유무=유, 대출권수+=1
			pstmt3 = conn.prepareStatement("update member set book_check=?, book_count=? where m_id=?"); //쿼리문준비
			
			pstmt3.setString(1, check);
			pstmt3.setInt(2, bookCount);
			pstmt3.setString(3, mId);
			
			pstmt3.executeUpdate(); //쿼리문 실행

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
	public void checkIn(int bookNo, String mId) { //책 넘버, 아이디
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null; //대출권수검색용
		PreparedStatement pstmt3 = null; //대출유무 및 대출권수 입력용
		ResultSet rs = null;
		String checkt = "유"; //대출 유무
		String checkf = "무"; //대출 유무
		int bookCount = 0; //대출 권수
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db연결
			System.out.println("연결 확인");
			
			//반납날짜 입력
			pstmt = conn.prepareStatement("update books_out_in set book_in_date=now() where book_info=?"); //쿼리문준비
			
			pstmt.setInt(1, bookNo);
			
			pstmt.executeUpdate(); //쿼리문 실행
			
			//book_count컬럼에 있는값 -1을 해서 검색한뒤 그 값을 변수에 저장
			pstmt2 = conn.prepareStatement("select book_count-1 from member where m_id=?"); //쿼리문준비
			
			pstmt2.setString(1, mId);
			
			rs = pstmt2.executeQuery();
			
			if(rs.next()) {
				bookCount = rs.getInt("book_count-1");
				System.out.println(bookCount +"bookcount확인");
			}
			
			pstmt3 = conn.prepareStatement("update member set book_check=?, book_count=? where m_id=?"); //쿼리문준비
			
			if(bookCount == 0) { //대출권수가 1권이면  대출유무=무, 대출권수=0
				pstmt3.setString(1, checkf);
				pstmt3.setInt(2, bookCount);
				pstmt3.setString(3, mId);
			} else { //나머지는 대출유무=유, 대출권수=bookCount-1
				pstmt3.setString(1, checkt);
				pstmt3.setInt(2, bookCount);
				pstmt3.setString(3, mId);
			}
			
			pstmt3.executeUpdate(); //쿼리문 실행
			
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
	
	public ArrayList<BookCheck> bookCheck(){
		ArrayList<BookCheck> books = new ArrayList<BookCheck>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db연결
			System.out.println("연결 확인");
			
			pstmt = conn.prepareStatement("select logs, book_info, m_id, book_cate, book_name, book_out_date, book_limit_date, book_in_date from books_out_in"); //쿼리문준비
			
			rs = pstmt.executeQuery(); //쿼리문 실행
			
			while(rs.next()) {
				BookCheck book = new BookCheck(); //대출,반납 데이터가 들어갈수있는 객체 생성
				book.setLogs(rs.getInt("logs")); //데이터 입력
				book.setBookInfo(rs.getInt("book_info"));
				book.setmId(rs.getString("m_id"));
				book.setBookCate(rs.getString("book_cate"));
				book.setBookName(rs.getString("book_name"));
				book.setBookOutDate(rs.getString("book_out_date"));
				book.setBookLimitDate(rs.getString("book_limit_date"));
				book.setBookInDate(rs.getString("book_in_date"));
				
				books.add(book); //한번 반복할때마다 객체주소를 배열객체에 저장
			}
			
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
		return books;
	}
}
