<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="books.bookDao" %>
<%@ page import="books.booksManagement" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>1조 프로젝트</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<style>
		#ta{
			width:1000px;
			height:300px;
			text-align:center;
		}
	</style>
</head>
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
	<br>
	<br>
	<br>
	<%@ include file="/books/selectSearchListForm.jsp" %><br><br>
   
	<h3>검색결과</h3><br><br>
	
			<table border="1">
				<thead>
         		   <tr>
		               <th>info</th>
		               <th>cate</th>
		               <th>name</th>
		               <th>writer</th>
		               <th>publisher</th>
		               <th>date</th>
		               <th>상세정보</th>
          		   </tr>
				</thead>
				<tbody>
<%
	String sk = request.getParameter("sk");	
	String sv = request.getParameter("sv");
	String begin = request.getParameter("begin");
	String end = request.getParameter("end");

	ArrayList<booksManagement> searchList = new ArrayList<booksManagement>();
	bookDao bookdao = new bookDao();
	booksManagement b = new booksManagement();
	
	if(begin == null || begin.equals("") || end == null || end.equals("") || sk.equals("")){
		searchList = bookdao.selectSearchSv(b, sk, sv);

	}else if(!begin.equals("") && begin != null && !end.equals("") && end != null && sk != null && !sv.equals("")){
		searchList = bookdao.selectSearchDate(begin, end, sk, sv);

	}else if(!begin.equals("") && begin != null && !end.equals("") && end != null && sk != null && sv.equals("")){	
		searchList = bookdao.selectSearchDate(begin, end);

	}else{
		searchList = bookdao.selectSearchSv(b, sk, sv);
	}
	for(int i = 0; i < searchList.size(); i++){
		
		b = searchList.get(i);
		
%>		
	 				<tr>
						<td><%=b.getInfo()%></td>
						<td><%=b.getBook_cate()%></td>
						<td><%=b.getBook_name()%></td>
						<td><%=b.getBook_writer()%></td>
						<td><%=b.getBook_publisher()%></td>
						<td><%=b.getBook_record_date()%></td>						
              		    <td><a href="../bookDetail.jsp?no=<%=b.getInfo()%>">상세정보</a></td>
					</tr>
<%				 
}
%>

				</tbody>
			</table> 
		</section>
</body>
</html>