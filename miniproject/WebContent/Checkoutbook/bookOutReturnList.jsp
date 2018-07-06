<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "bookcheck.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<%
	BookOutReturn books = new BookOutReturn();
	ArrayList<BookCheck> bookList = books.bookCheck();
%>
<html>
	<head>
		<title>대출 반납관리</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css">
	</head>
	<body>
		<header>
			<section id="top">
				<a id="logo" href="<%=request.getContextPath() %>/indexed.jsp"><img src="<%=request.getContextPath() %>/img/logo.gif"></a>
				<div id="search">
					<div id="search_title"><a href="<%=request.getContextPath() %>/books/selectBookSearch.jsp">도서검색</a></div>
					<div id="search_form"><input type="text"></div>
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
			<table border="1">
				<tr>
					<th>기록코드</th>
					<th>회원아이디</th>
					<th>도서카테고리</th>
					<th>도서이름</th>
					<th>대출날짜</th>
					<th>반납기한</th>
					<th>반납날짜</th>
				</tr>
			<%
				for(int i=0; i<bookList.size(); i++){
			%>
				<tr>
					<td><%=bookList.get(i).getLogs() %></td>
					<td><%=bookList.get(i).getmId() %></td>
					<td><%=bookList.get(i).getBookCate() %></td>
					<td><%=bookList.get(i).getBookName() %></td>
					<td><%=bookList.get(i).getBookOutDate() %></td>
					<td><%=bookList.get(i).getBookLimitDate() %></td>
					<td><%=bookList.get(i).getBookInDate() %></td>
				</tr>
			<%
				}
			%>
			</table>
		</section>
	</body>
</html>