<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import= "java.sql.Connection" %>
<%@ page import= "java.sql.PreparedStatement" %>
<%@ page import= "java.sql.SQLException" %>
<%@ page import= "java.sql.ResultSet" %>
<%@ page import= "java.sql.DriverManager" %>
<%@ page import= "books.bookDto" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1조 프로젝트</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC_KR");	

	bookDto b = new bookDto();

	String text = request.getParameter("text");
	System.out.println(text + "<-- 입력한 텍스트값");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev28db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev28id";
	String dbPass = "dev28pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	pstmt = conn.prepareStatement("insert into board_comment (board_comment_contents, board_comment_date) values(?,now())");
	pstmt.setString(1, text);
	
	pstmt.executeUpdate();
	
	pstmt2 = conn.prepareStatement("select info, m_id, m_name, board_comment_contents, board_comment_date board_comment where board_comment_contets=?");
	pstmt2.setString(1, text);
	
	rs = pstmt2.executeQuery();
	
	if(rs.next()) {
		b.setText(rs.getString("board_comment_contents"));
	}
%>
</body>
</html>