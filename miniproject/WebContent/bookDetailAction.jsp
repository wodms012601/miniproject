<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import= "java.sql.Connection" %>
<%@ page import= "java.sql.PreparedStatement" %>
<%@ page import= "java.sql.SQLException" %>
<%@ page import= "java.sql.DriverManager" %>
<%@ page import= "java.sql.ResultSet"%>
<%@ page import= "book.bookDuo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1조 프로젝트</title>
</head>
<body>
<% 
	request.setCharacterEncoding("EUC_KR");
	
	int no = Integer.parseInt(request.getParameter("no"));
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String text = request.getParameter("text");
	
	bookDuo bd = new bookDuo();
	bd.booktext(no, id, name, text);
	bd.booktextSelect(no);
%> 
</body>
</html>