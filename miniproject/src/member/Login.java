package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {
	
	//�α��� ó�� �޼���
	public Member loginPro(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Member member = new Member(); //select�� ���̵�� �̸����� �����ϱ����� ��ü ����
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε�
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db����
			System.out.println("���� Ȯ��");
			
			pstmt = conn.prepareStatement("select m_id, m_name from member where m_id=? and m_pw=?"); //�������غ�
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery(); //������ ����
			
			if(rs.next()) {
				member.setId(rs.getString("m_id")); //MemberŬ������ ���� ������ ��ü�� ���̵�� �̸�����
				member.setName(rs.getString("m_name"));
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
		return member;
	}
}
