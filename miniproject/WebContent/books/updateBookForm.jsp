<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="books.bookDao" %>
<%@ page import="books.booksManagement" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css">
</head>
<%
	int send_id = Integer.parseInt(request.getParameter("send_id"));
	System.out.println(send_id);
	bookDao bookdao = new bookDao();
	booksManagement b = bookdao.selectUpdateForm(send_id);
%>
<body>
	<header>
		<section id="top">
			<a id="logo" href="<%=request.getContextPath() %>/indexed.jsp"><img src="<%=request.getContextPath() %>/img/logo.gif"></a>
			<div id="search">
				<div id="search_title"><a href="<%=request.getContextPath() %>/books/selectBookSearch.jsp">도서검색</a></div>
				<div id="search_button"><img src="<%=request.getContextPath() %>/img/btn_search.gif"></div>
			</div>
			<nav id="top_menu">
				<ul>
					<li><a href="#">마이페이지</a></li>
					<li><a href="#">이용안내</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</section>
		
		<nav id="main_menu">
			<ul>
				<li><a href="">추천도서</a></li>
				<li><a href="">고객갤러리</a></li>
				<li><a href="">무료도서</a></li>
				<li><a href="">유료도서</a></li>
				<li><a href="">자주하는질문</a></li>
			</ul>
		</nav>
	</header>
	
	<section id="main">
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
				<tr>
					<td>book_short</td>
					<td><input type="text" name="book_short" value=<%=b.getBook_short()%>></td>
				</tr>
							<tr>
					<td>book_contents</td>
					<td><input type="text" name="book_contents" value=<%=b.getBook_contents()%>></td>
				</tr>
			</table>
			<input type="submit" value="수정">
		</form>
	</section>
</body>
</html>