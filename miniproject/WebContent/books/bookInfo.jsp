<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "books.bookDao" %>
<%@ page import = "books.booksManagement" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>bookInfo</title>
	
<%		
	int send_id = Integer.parseInt(request.getParameter("send_id"));

	bookDao bookdao = new bookDao();
	booksManagement b = bookdao.selectBookInfo(send_id);			
%>
<table border=1>
	<tr>
		<th>책코드</th>
		<td><%=b.getInfo()%></td>
	</tr>
	<tr>
		<th>책카테고리</th>
		<td><%=b.getBook_cate()%></td>
	</tr>
	<tr>
		<th>책이름</th>
		<td><%=b.getBook_name()%></td>
	</tr>
	<tr>
		<th>책저자</th>
		<td><%=b.getBook_writer()%></td>
	</tr>
	<tr>
		<th>책출판사</th>
		<td><%=b.getBook_publisher()%></td>
	</tr>
	<tr>
		<th>책 내용 요약</th>
		<td><%=b.getBook_short()%></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><%=b.getBook_contents()%></td>
	</tr>
	<tr>
		<th>등록날짜</th>
		<td><%=b.getBook_record_date()%></td>
	</tr>
	<tr>
		<th>대여하기</th>
		<td><a href="<%=request.getContextPath()%>/books/bookOut.jsp?send_id=<%=b.getInfo()%>">대여</a></td>
	</tr>
	<tr>
		<th>반납하기</th>
		<td><a href="<%=request.getContextPath()%>/books/bookIn.jsp?send_id=<%=b.getInfo()%>">반납</a></td>
	</tr>
	<tr>
		<th>돌아가기</th>
		<td><a href="<%=request.getContextPath()%>/books/bookList.jsp">도서리스트로 이동</a></td>
	</tr>

</table>