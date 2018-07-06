/*2018.07.04 Ź����*/
package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDao {
	
	//db�� ȸ������ ����ó���ϴ� �޼���
	public void insertMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε�
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db����
			System.out.println("���� Ȯ��");
			
			pstmt = conn.prepareStatement("insert into member(m_id, m_pw, m_name, m_level, m_gender, m_addr, book_check, book_count) values(?,?,?,?,?,?,?,?)"); //�������غ�
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getLevel());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getAddr());
			pstmt.setString(7, member.getYumu()); //���� ���� �Է�
			pstmt.setInt(8, member.getBookCount()); //����Ǽ� �Է�
			
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
	
	//ȸ������ ����Ʈó���ϴ� �޼���
	public ArrayList<Member> listMember() {
		ArrayList<Member> memberList = new ArrayList<Member>(); //��ü�� �ּҰ����� ��� �迭��ü ����
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε�
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db����
			System.out.println("���� Ȯ��");
			
			pstmt = conn.prepareStatement("select member_no, m_id, m_name, m_level, m_gender, m_addr from member"); //�������غ�
			
			rs = pstmt.executeQuery(); //������ ����
			
			while(rs.next()) {
				Member member = new Member(); //ResultSet��ü�� ��� �����͸� MemberŬ������ ���� ������ ��ü�� ���� 
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
	
	//�Ѹ��� ȸ�������� �˻��ϱ� ���� �޼���
	public Member selectMember(int MemberNo) {
		Member member = new Member(); //Member ��ü ����
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε�
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db����
			System.out.println("���� Ȯ��");
			
			pstmt = conn.prepareStatement("select member_no, m_id, m_name, m_level, m_gender, m_addr from member where member_no=?"); //�������غ�
			
			pstmt.setInt(1, MemberNo);
			
			rs = pstmt.executeQuery(); //������ ����
			
			if(rs.next()) {
				member.setMemberNo(rs.getInt("member_no")); //ResultSet��ü�� ��� �����͸� MemberŬ������ ���� ������ ��ü�� ����
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
	
	//�Ѹ��� ȸ�������� �˻��ϱ� ���� �޼���(�޼��� �����ε�)
		public Member selectMember(String mId) {
			Member member = new Member(); //Member ��ü ����
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε�
					
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db����
				System.out.println("���� Ȯ��");
				
				pstmt = conn.prepareStatement("select member_no, m_id, m_name, m_level, m_gender, m_addr from member where m_id=?"); //�������غ�
				
				pstmt.setString(1, mId);
				
				rs = pstmt.executeQuery(); //������ ����
				
				if(rs.next()) {
					member.setMemberNo(rs.getInt("member_no")); //ResultSet��ü�� ��� �����͸� MemberŬ������ ���� ������ ��ü�� ����
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
	
	//ȸ������ó�� �޼���
	public void updateMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε�
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db����
			System.out.println("���� Ȯ��");
			
			pstmt = conn.prepareStatement("update member set m_id=?, m_pw=?, m_name=?, m_gender=?, m_addr=? where member_no=?"); //�������غ�
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getAddr());
			pstmt.setInt(6, member.getMemberNo());
			
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
	
	//ȸ��Ż��ó�� �޼���
	public void deleteMember(int memberNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //����̹� �ε�
				
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/books_db01?useUnicode=true&characterEncoding=euckr", "books_id01", "books_pw01"); //db����
			System.out.println("���� Ȯ��");
			
			pstmt = conn.prepareStatement("delete from member where member_no=?"); //�������غ�
			
			pstmt.setInt(1, memberNo);
			
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
