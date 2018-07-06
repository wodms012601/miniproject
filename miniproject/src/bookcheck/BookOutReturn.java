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
		PreparedStatement pstmt = null; //���������Է¿�
		PreparedStatement pstmt2 = null; //����Ǽ��˻���
		PreparedStatement pstmt3 = null; //�������� �� ����Ǽ� �Է¿�
		ResultSet rs = null;
		String check = "��"; //���� ����
		int bookCount = 0; //���� �Ǽ�
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε�
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db����
			System.out.println("���� Ȯ��");
			
			//date_add()�޼��带 ����� ������¥�κ��� 2�� ������ ��¥�� �Է��Ѵ�.
			pstmt = conn.prepareStatement("insert into books_out_in(m_id, book_info, book_cate, book_name, book_out_date, book_limit_date) values(?,?,?,?,now(),date_add(now(), interval 2 month))"); //�������غ�
			
			//1�� �ε������� ���ǿ��� ���� ���̵�
			pstmt.setString(1, mId);
			pstmt.setInt(2, books.getInfo());
			pstmt.setString(3, books.getBook_cate());
			pstmt.setString(4, books.getBook_name());
			
			pstmt.executeUpdate(); //������ ����
			
			//book_count�÷��� �ִ°� +1�� �ؼ� �˻��ѵ� �� ���� ������ ����
			pstmt2 = conn.prepareStatement("select book_count+1 from member where m_id=?"); //�������غ�
			
			pstmt2.setString(1, mId);
			
			rs = pstmt2.executeQuery();
			
			if(rs.next()) {
				bookCount = rs.getInt("book_count+1");
				System.out.println(bookCount +"bookcountȮ��");
			}
			
			//����������� ȸ������ update ��������=��, ����Ǽ�+=1
			pstmt3 = conn.prepareStatement("update member set book_check=?, book_count=? where m_id=?"); //�������غ�
			
			pstmt3.setString(1, check);
			pstmt3.setInt(2, bookCount);
			pstmt3.setString(3, mId);
			
			pstmt3.executeUpdate(); //������ ����

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
	public void checkIn(int bookNo, String mId) { //å �ѹ�, ���̵�
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null; //����Ǽ��˻���
		PreparedStatement pstmt3 = null; //�������� �� ����Ǽ� �Է¿�
		ResultSet rs = null;
		String checkt = "��"; //���� ����
		String checkf = "��"; //���� ����
		int bookCount = 0; //���� �Ǽ�
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε�
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db����
			System.out.println("���� Ȯ��");
			
			//�ݳ���¥ �Է�
			pstmt = conn.prepareStatement("update books_out_in set book_in_date=now() where book_info=?"); //�������غ�
			
			pstmt.setInt(1, bookNo);
			
			pstmt.executeUpdate(); //������ ����
			
			//book_count�÷��� �ִ°� -1�� �ؼ� �˻��ѵ� �� ���� ������ ����
			pstmt2 = conn.prepareStatement("select book_count-1 from member where m_id=?"); //�������غ�
			
			pstmt2.setString(1, mId);
			
			rs = pstmt2.executeQuery();
			
			if(rs.next()) {
				bookCount = rs.getInt("book_count-1");
				System.out.println(bookCount +"bookcountȮ��");
			}
			
			pstmt3 = conn.prepareStatement("update member set book_check=?, book_count=? where m_id=?"); //�������غ�
			
			if(bookCount == 0) { //����Ǽ��� 1���̸�  ��������=��, ����Ǽ�=0
				pstmt3.setString(1, checkf);
				pstmt3.setInt(2, bookCount);
				pstmt3.setString(3, mId);
			} else { //�������� ��������=��, ����Ǽ�=bookCount-1
				pstmt3.setString(1, checkt);
				pstmt3.setInt(2, bookCount);
				pstmt3.setString(3, mId);
			}
			
			pstmt3.executeUpdate(); //������ ����
			
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
			
			pstmt = conn.prepareStatement("select logs, book_info, m_id, book_cate, book_name, book_out_date, book_limit_date, book_in_date from books_out_in"); //�������غ�
			
			rs = pstmt.executeQuery(); //������ ����
			
			while(rs.next()) {
				BookCheck book = new BookCheck(); //����,�ݳ� �����Ͱ� �����ִ� ��ü ����
				book.setLogs(rs.getInt("logs")); //������ �Է�
				book.setBookInfo(rs.getInt("book_info"));
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
