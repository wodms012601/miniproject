<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="books.bookDao" %>
<%@ page import="books.booksManagement" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
<%	
	booksManagement b = new booksManagement();
	b.setInfo(Integer.parseInt(request.getParameter("info")));
	b.setBook_cate(request.getParameter("book_cate"));
	b.setBook_name(request.getParameter("book_name"));
	b.setBook_writer(request.getParameter("book_writer"));
	b.setBook_publisher(request.getParameter("book_publisher"));
	b.setBook_short(request.getParameter("book_short"));
	b.setBook_contents(request.getParameter("book_contents"));

	bookDao bookdao = new bookDao();
	
	bookdao.selectUpdateBook(b);
	response.sendRedirect(request.getContextPath() + "/books/bookList.jsp");
%>