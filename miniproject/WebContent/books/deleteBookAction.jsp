<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "books.bookDao" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>

<%
	int send_id = Integer.parseInt(request.getParameter("send_id"));
	bookDao bookdao = new bookDao();
	bookdao.deleteBook(send_id);
	response.sendRedirect(request.getContextPath() + "/books/bookList.jsp");
%>
