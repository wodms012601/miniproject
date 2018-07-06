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
		<title>���� �ݳ�����</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css">
	</head>
	<body>
		<header>
			<section id="top">
				<a id="logo" href="<%=request.getContextPath() %>/indexed.jsp"><img src="<%=request.getContextPath() %>/img/logo.gif"></a>
				<div id="search">
					<div id="search_title"><a href="<%=request.getContextPath() %>/books/selectBookSearch.jsp">�����˻�</a></div>
					<div id="search_form"><input type="text"></div>
					<div id="search_button"><img src="<%=request.getContextPath() %>/img/btn_search.gif"></div>
				</div>
				<nav id="top_menu">
					<ul>
						<li><a href="#">����������</a></li>
						<li><a href="#">�̿�ȳ�</a></li>
						<li><a href="#">������</a></li>
					</ul>
				</nav>
				<div class="clear"></div>
			</section>
			
			<nav id="main_menu">
				<ul>
					<li><a href="">��õ����</a></li>
					<li><a href="">��������</a></li>
					<li><a href="">���ᵵ��</a></li>
					<li><a href="">���ᵵ��</a></li>
					<li><a href="">�����ϴ�����</a></li>
				</ul>
			</nav>
		</header>
		
		<section id="main">
			<table border="1">
				<tr>
					<th>����ڵ�</th>
					<th>ȸ�����̵�</th>
					<th>����ī�װ�</th>
					<th>�����̸�</th>
					<th>���⳯¥</th>
					<th>�ݳ�����</th>
					<th>�ݳ���¥</th>
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