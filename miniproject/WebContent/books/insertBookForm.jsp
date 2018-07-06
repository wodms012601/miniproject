<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>1조 프로젝트</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<title>insertBookForm</title>
</head>
<body>
	<header>
		<section id="top">
			<a id="logo" href="<%=request.getContextPath() %>/indexed.jsp"><img src="<%=request.getContextPath() %>/img/logo.gif"></a>
			<div id="search">
				<div id="search_title">도서검색</div>
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
	
	<section id="main"><br><br>
		<form action="<%=request.getContextPath()%>/books/insertBookAction.jsp" method="post" >
			<table>				
				<tr>
					<td>책 카테고리</td>
					<td><input type="text" name="book_cate"></td>
				</tr>
				<tr>
					<td>책 이름</td>
					<td><input type="text" name="book_name"></td>
				</tr>
				<tr>
					<td>책 저자</td>
					<td><input type="text" name="book_writer"></td>
				</tr>
				<tr>
					<td>책 출판사</td>
					<td><input type="text" name="book_publisher"></td>
				</tr>
				<tr>
					<td>책 내용 요약</td>
					<td><input type="text" name="book_short"></td>
				</tr>
				<tr>
					<td>책 내용</td>
					<td><input type="text" name="book_contents"></td>
				</tr>
			</table>
			<input type="submit" value="책 리스트 등록">
		</form>
	</section>
</body>
</html>