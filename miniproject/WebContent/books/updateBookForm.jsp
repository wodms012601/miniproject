<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="books.bookDao" %>
<%@ page import="books.booksManagement" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>

<%
	int send_id = Integer.parseInt(request.getParameter("send_id"));
	System.out.println(send_id);
	bookDao bookdao = new bookDao();
	booksManagement b = bookdao.selectUpdateForm(send_id);
%>

	<form action="<%=request.getContextPath()%>/books/updateBookAction.jsp" method="post" >
		<table>
			<tr>
				<td>info</td>
				<td><input type="text" name="info" value=<%=send_id%> readonly="readonly" ></td>
			</tr>
			<tr>
				<td>book_cate</td>
				<td><input type="text" name="book_cate" value=<%=b.getBook_cate()%>></td>
			</tr>
			<tr>
				<td>book_name</td>
				<td><input type="text" name="book_name" value=<%=b.getBook_name()%>></td>
			</tr>
			<tr>
				<td>book_writer</td>
				<td><input type="text" name="book_writer" value=<%=b.getBook_writer()%>></td>
			</tr>
			<tr>
				<td>book_publisher</td>
				<td><input type="text" name="book_publisher" value=<%=b.getBook_publisher()%>></td>
			</tr>
		</table>
	<input type="submit" value="수정">