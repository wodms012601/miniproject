/*2018.07.04 탁재은*/
package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDao {
	
	//db에 회원정보 저장처리하는 메서드
	public void insertMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db연결
			System.out.println("연결 확인");
			
			pstmt = conn.prepareStatement("insert into member(m_id, m_pw, m_name, m_level, m_gender, m_addr, book_check, book_count) values(?,?,?,?,?,?,?,?)"); //쿼리문준비
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getLevel());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getAddr());
			pstmt.setString(7, member.getYumu()); //대출 유무 입력
			pstmt.setInt(8, member.getBookCount()); //대출권수 입력
			
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
	
	//회원정보 리스트처리하는 메서드
	public ArrayList<Member> listMember() {
		ArrayList<Member> memberList = new ArrayList<Member>(); //객체의 주소값들을 담는 배열객체 생성
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db연결
			System.out.println("연결 확인");
			
			pstmt = conn.prepareStatement("select member_no, m_id, m_name, m_level, m_gender, m_addr from member"); //쿼리문준비
			
			rs = pstmt.executeQuery(); //쿼리문 실행
			
			while(rs.next()) {
				Member member = new Member(); //ResultSet객체에 담긴 데이터를 Member클래스를 통해 생성된 객체에 저장 
				member.setMemberNo(rs.getInt("member_no"));
				member.setId(rs.getString("m_id"));
				member.setName(rs.getString("m_name"));
				member.setLevel(rs.getString("m_level"));
				member.setGender(rs.getString("m_gender"));
				member.setAddr(rs.getString("m_addr"));
				
				memberList.add(member);
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
		return memberList;
	}
	
	//한명의 회원정보를 검색하기 위한 메서드
	public Member selectMember(int MemberNo) {
		Member member = new Member(); //Member 객체 생성
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db연결
			System.out.println("연결 확인");
			
			pstmt = conn.prepareStatement("select member_no, m_id, m_name, m_level, m_gender, m_addr from member where member_no=?"); //쿼리문준비
			
			pstmt.setInt(1, MemberNo);
			
			rs = pstmt.executeQuery(); //쿼리문 실행
			
			if(rs.next()) {
				member.setMemberNo(rs.getInt("member_no")); //ResultSet객체에 담긴 데이터를 Member클래스를 통해 생성된 객체에 저장
				member.setId(rs.getString("m_id"));
				member.setName(rs.getString("m_name"));
				member.setLevel(rs.getString("m_level"));
				member.setGender(rs.getString("m_gender"));
				member.setAddr(rs.getString("m_addr"));
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
	
	//한명의 회원정보를 검색하기 위한 메서드(메서드 오버로딩)
		public Member selectMember(String mId) {
			Member member = new Member(); //Member 객체 생성
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
					
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db연결
				System.out.println("연결 확인");
				
				pstmt = conn.prepareStatement("select member_no, m_id, m_name, m_level, m_gender, m_addr from member where m_id=?"); //쿼리문준비
				
				pstmt.setString(1, mId);
				
				rs = pstmt.executeQuery(); //쿼리문 실행
				
				if(rs.next()) {
					member.setMemberNo(rs.getInt("member_no")); //ResultSet객체에 담긴 데이터를 Member클래스를 통해 생성된 객체에 저장
					member.setId(rs.getString("m_id")); 
					member.setName(rs.getString("m_name"));
					member.setLevel(rs.getString("m_level"));
					member.setGender(rs.getString("m_gender"));
					member.setAddr(rs.getString("m_addr"));
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
	
	//회원수정처리 메서드
	public void updateMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db연결
			System.out.println("연결 확인");
			
			pstmt = conn.prepareStatement("update member set m_id=?, m_pw=?, m_name=?, m_gender=?, m_addr=? where member_no=?"); //쿼리문준비
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getAddr());
			pstmt.setInt(6, member.getMemberNo());
			
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
	
	//회원탈퇴처리 메서드
	public void deleteMember(int memberNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db연결
			System.out.println("연결 확인");
			
			pstmt = conn.prepareStatement("delete from member where member_no=?"); //쿼리문준비
			
			pstmt.setInt(1, memberNo);
			
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
