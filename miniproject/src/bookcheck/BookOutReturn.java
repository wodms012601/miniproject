package bookcheck;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import books.booksManagement;

public class BookOutReturn {
	
	//���� ó�� �޼���
	public void checkOut(booksManagement books) { //å�̸�, ī�װ�, ���̵�,
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε�
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db����
			System.out.println("���� Ȯ��");
			
			//date_add()�޼��带 ����� ������¥�κ��� 2�� ������ ��¥�� �Է��Ѵ�.
			pstmt = conn.prepareStatement("insert into books_out_in(m_id, book_cate, book_name, book_out_date, book_limit_date) values(?,?,?,now(),date_add(now(), interval 2 month)"); //�������غ�
			
			//1�� �ε������� ���ǿ��� ���� ���̵�
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
			
			//1�� �ε������� ���ǿ��� ���� ���̵�
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
}
