package bookcheck;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import books.booksManagement;

public class BookOutReturn {
	
	//���� ó�� �޼���
	public void checkOut(booksManagement books, String mId) { //å�̸�, ī�װ�, ���̵�,
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε�
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db����
			System.out.println("���� Ȯ��");
			
			//date_add()�޼��带 ����� ������¥�κ��� 2�� ������ ��¥�� �Է��Ѵ�.
			pstmt = conn.prepareStatement("insert into books_out_in(m_id, book_cate, book_name, book_out_date, book_limit_date) values(?,?,?,now(),date_add(now(), interval 2 month))"); //�������غ�
			
			//1�� �ε������� ���ǿ��� ���� ���̵�
			pstmt.setString(1, mId);
			pstmt.setString(2, books.getBook_cate());
			pstmt.setString(3, books.getBook_name());
			
			pstmt.executeUpdate(); //������ ����

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
	
	//�ݳ�ó�� ����Ʈ
	public void checkIn(int bookNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε�
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db����
			System.out.println("���� Ȯ��");
			
			pstmt = conn.prepareStatement("update books_out_in set book_in_date=now() where logs=?"); //�������غ�
			
			pstmt.setInt(1, bookNo);
			
			pstmt.executeUpdate(); //������ ����
			
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
			Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε�
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db����
			System.out.println("���� Ȯ��");
			
			pstmt = conn.prepareStatement("select logs, m_id, book_cate, book_name, book_out_date, book_limit_date, book_in_date from books_out_in"); //�������غ�
			
			rs = pstmt.executeQuery(); //������ ����
			
			while(rs.next()) {
				BookCheck book = new BookCheck(); //����,�ݳ� �����Ͱ� �����ִ� ��ü ����
				book.setLogs(rs.getInt("logs")); //������ �Է�
				book.setmId(rs.getString("m_id"));
				book.setBookCate(rs.getString("book_cate"));
				book.setBookName(rs.getString("book_name"));
				book.setBookOutDate(rs.getString("book_out_date"));
				book.setBookLimitDate(rs.getString("book_limit_date"));
				book.setBookInDate(rs.getString("book_in_date"));
				
				books.add(book); //�ѹ� �ݺ��Ҷ����� ��ü�ּҸ� �迭��ü�� ����
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
