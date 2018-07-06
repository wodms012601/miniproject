<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<%@ page import = "books.*" %>
<!DOCTYPE html>
<%
	//메인 페이지에서 책 사진을 클릭하면 책의 no가 함께 넘어온다
	int bookNo = Integer.parseInt(request.getParameter("no"));
	
	//로그인 후 세션에 저장한 아이디,이름값
	String mId = (String)session.getAttribute("mId");
	String mName = (String)session.getAttribute("mName");
	
	bookDao dao = new bookDao();
	booksManagement book = dao.selectBookInfo(bookNo);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/main.css">
	</head>
	<body>
		<header>
			<section id="top">
				<a id="logo" href="indexed.jsp"><img src="img/logo.gif"></a>
				<div id="search">
					<div id="search_title"><a href="#">도서검색</a></div>
					<div id="search_form"><input type="text"></div>
					<div id="search_button"><img src="img/btn_search.gif"></div>
				</div>
				<nav id="top_menu">
					<ul>
						<li class="green"><a href="#">로그인</a></li>
						<li class="green"><a href="#">회원가입</a></li>
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
			<section id="cat1_1">
					<img src="img/img4co.PNG">
			</section>
			<section id="cat2_1">
				
				카테고리 : <%=book.getBook_cate() %><br><br>
				제목 : <%=book.getBook_name() %><br><br>
				저자 : <%=book.getBook_writer() %><br><br>
				출판사 : <%=book.getBook_publisher() %><br><br>
				요약 : <%=book.getBook_short() %><br><br>
				내용 : <%=book.getBook_contents() %><br>
				<div id="id">
					<a href="<%=request.getContextPath() %>/Checkoutbook/bookOut.jsp?no=<%=bookNo %>"><img src="img/DC.png"></a> 
					<a href="<%=request.getContextPath() %>/Checkoutbook/bookReturn.jsp?no=<%=bookNo %>"><img src="img/BN.png"></a>
				</div>
			</section>
		</section>
		<div class="clear"></div>
		
		<footer>
			<section id="footer_box">
				<div id="footer_logo">
					<img src="img/title_comment.gif">
				</div>
				
				<form action="./bookDetailAction.jsp" method="post">
					<div id="address">
						<input type="hidden" name="no" value="<%=bookNo %>">
						<input type="hidden" name="id" value="<%=mId %>">
						<input type="hidden" name="name" value="<%=mName %>">
						<textarea name="text"></textarea>
					</div>
					<div id="footer_banner">
						<input type="image" src="img/ok_ripple.gif">
					</div>
				</form>
			</section>
		</footer>
	</body>
</html>