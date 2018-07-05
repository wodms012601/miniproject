<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>1조 프로젝트</title>
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/main.css">
	</head>

	<body>
		<header>
			<section id="top">
				<a id="logo" href="./indexed.jsp"><img src="img/logo.gif"></a>
				<div id="search">
					<div id="search_title">도서검색</div>
					<div id="search_form"><input type="text"></div>
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
				<img src="img/img1.gif">
			</section>
			
			<section id="cat3">
				<div> <!-- 로그인 폼 만들 화면 -->
					<article id="login_box">
						<img id="login_title" src="img/ttl_login.png">
						<div id="input_button">
							<ul id="login_input">
								<li><input type="text"></li>
								<li><input type="password"></li>	
							</ul>
							<img id="login_btn" src="img/btn_login.gif">
						</div>
						<div class="clear"></div>
						<div id="join_search">
							<img src="img/btn_join.gif">
							<img src="img/btn_search1.gif">
						</div>
					</article>
				</div>
				<div id="week_event">
					<img src="img/img3.jpg">
				</div>
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
				<div class="item">
<%
	request.setCharacterEncoding("EUC_KR");
	
	String abc = "imgF";
	String def = "imgE";
	String ghi = "imgG";
	String jkl = "imgK";
%>					
					<ul>	
						<li><a href="./bookDetail.jsp?img4=<%=abc %>" ><input type="image" src="img/img4.PNG"></a></li>
						<li class="subject">저자 : 탁재은</li>
						<li class="comment">포르투칼에 관한 풍경의 모든것</li>
						<li class="price">11,000원</li>
					</ul>
				</div>
				
				<div class="item">
					<ul>
						<li><a href="./bookDetail.jsp?img5=<%=def %>"><input type="image" src="img/img5.PNG"></a></li>				
						<li class="subject">저자 : 탁재은</li>
						<li class="comment">널 지켜보고 있다!</li>
						<li class="price">13,000원</li>
					</ul>
				</div>
				
				<div class="item">
					<ul>
						<li><a href="./bookDetail.jsp?img6=<%=ghi %>"><input type="image" src="img/img6.PNG"></a></li>
						<li class="subject">저자 : 송원민</li>
						<li class="comment">시바견에 대한 공감 이야기</li>
						<li class="price">14,000원</li>
					</ul>
				</div>
				
				<div class="item">
					<ul>
						<li><a href="./bookDetail.jsp?img7=<%=jkl %>"><input type="image" src="img/img7.jpg"></a></li>
						<li class="subject">저자 : 최윤석</li>
						<li class="comment">베스트셀러 1위 기욤뮈소 작품</li>
						<li class="price">18,000원</li>
					</ul>
				</div>
			</section>
		</section>
	</body>
</html>