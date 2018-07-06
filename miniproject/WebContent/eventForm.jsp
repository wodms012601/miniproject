<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "books.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>1조 프로젝트</title>
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/main.css">
	</head>
	<body>
<%
	int currentPage = 0;
	int pagePerRow = 4;
	String mName = (String)session.getAttribute("mName"); //로그인 후 세션에 저장한 이름값
	
	bookDao dao = new bookDao();
	ArrayList<booksManagement> bookList = dao.selectBookList(currentPage, pagePerRow);
%>
		<header>
			<section id="top">
				<a id="logo" href="./indexed.jsp"><img src="img/logo.gif"></a>
				<div id="search">
					<div id="search_title"><a href="<%=request.getContextPath() %>/books/selectBookSearch.jsp"><input type="image" src="img/Search.PNG"></a></div>
					<div id="search_button"><img src="img/btn_search.gif"></div>
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
			<section id="cat1">
				<div id="cat_title">
					도서분류
				</div>
				<ul>
					<li>액션/판타지</li>
					<li>무협</li>
					<li>코믹</li>
					<li>여행</li>
					<li>요리</li>
					<li>경제</li>
					<li>시,문학</li>
					<li>컴퓨터</li>
					<li>로맨스</li>
					<li>만화</li>
					<li>기타</li>
				</ul>
			</section>
			
			<section id="cat2">
				<br>
				<img src="img/Event01.gif">
				<img src="img/Event02.gif"><br>
				<img src="img/Event01.gif">
				<img src="img/Event02.gif">
			
			</section>
			
			<section id="cat3">
				<div> <!-- 로그인 폼 만들 화면 -->
					<article id="login_box">
						<img id="login_title" src="img/ttl_login.png">
					<%
						if(mName != null){
					%>
						<div><%=mName %>님 어서오세요.</div>
					<%
						} else {
					%>
						<form action="<%=request.getContextPath() %>/Member/loginPro.jsp" method="post">
							<div id="input_button">
								<ul id="login_input">
									<li><input type="text" name="id"></li>
									<li><input type="password" name="pw"></li>	
								</ul>
								<input type="image" src="img/btn_login.gif" id="login_btn">
							</div>
						</form>
						<div class="clear"></div>
						<div id="join_search">
							<a href="<%=request.getContextPath() %>/Member/insertMemberForm.jsp"><img src="img/btn_join.gif"></a>
							<img src="img/btn_search1.gif">
						</div>
					<%
						}
					%>
					</article>
				</div>
				<div id="week_event" ><a href="<%=request.getContextPath() %>/eventForm.jsp"><img src="img/img3.jpg"></a></div>
			</section>
			
			<section id="special_shop">
				<ul>
					<li><img src="img/special_img1.gif"></li>
					<li><img src="img/special_img2.gif"></li>
				</ul>
			</section>
			
			<section id="special_banner">
				<div id="banner1">
					<ul>
						<li><img src=""></li>
						<li><img src=""></li>
					</ul>
				</div>
				<div id="banner2">
					<ul>
						<li><img src=""></li>
						<li><img src=""></li>
					</ul>
				</div>
				<div id="banner3">
					<ul>
						<li><img src=""></li>
						<li><img src=""></li>
					</ul>
				</div>
			</section>
				<section id="new">
			<%
				for(int i=0; i<bookList.size(); i++){
			%>
				<div class="item">	
					<ul>	
						<li><a href="<%=request.getContextPath() %>/bookDetail.jsp?no=<%=bookList.get(i).getInfo() %>" ><input type="image" src="img/img4.PNG"></a></li>
						<li class="subject">저자 : <%=bookList.get(i).getBook_writer() %></li>
						<li class="comment">제목 : <%=bookList.get(i).getBook_name() %></li>
						<li class="price">출판사 : <%=bookList.get(i).getBook_publisher() %></li>
					</ul>
				</div>
			<%
				}
			%>
		</section>
</body>
</html>