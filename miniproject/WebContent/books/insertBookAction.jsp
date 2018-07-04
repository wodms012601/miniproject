<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "books.bookDao" %>
<%@ page import = "books.booksManagement" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>

<%
	booksManagement b = new booksManagement();
	b.setBook_cate(request.getParameter("book_cate"));
	b.setBook_name(request.getParameter("book_name"));
	b.setBook_writer(request.getParameter("book_writer"));
	b.setBook_publisher(request.getParameter("book_publisher"));

	bookDao bookdao = new bookDao();
	bookdao.binsert(b);
	response.sendRedirect(request.getContextPath() + "/books/bookList.jsp");
%>
