package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {
	
	//로그인 처리 메서드
	public Member loginPro(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Member member = new Member(); //select한 아이디와 이름값을 저장하기위해 객체 생성
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db연결
			System.out.println("연결 확인");
			
			pstmt = conn.prepareStatement("select m_id, m_name from member where m_id=? and m_pw=?"); //쿼리문준비
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery(); //쿼리문 실행
			
			if(rs.next()) {
				member.setId(rs.getString("m_id")); //Member클래스를 통해 생성한 객체에 아이디와 이름저장
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
