<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>1�� ������Ʈ</title>
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/main.css">
	</head>

	<body>
		<header>
			<section id="top">
				<a id="logo" href="./indexed.jsp"><img src="img/logo.gif"></a>
				<div id="search">
					<div id="search_title">�����˻�</div>
					<div id="search_form"><input type="text"></div>
					<div id="search_button"><img src="img/btn_search.gif"></div>
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
			<section id="cat1">
				<div id="cat_title">
					�����з�
				</div>
				<ul>
					<li>�׼�/��Ÿ��</li>
					<li>����</li>
					<li>�ڹ�</li>
					<li>����</li>
					<li>�丮</li>
					<li>����</li>
					<li>��,����</li>
					<li>��ǻ��</li>
					<li>�θǽ�</li>
					<li>��ȭ</li>
					<li>��Ÿ</li>
				</ul>
			</section>
			
			<section id="cat2">
				<img src="img/img1.gif">
			</section>
			
			<section id="cat3">
				<div> <!-- �α��� �� ���� ȭ�� -->
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
						<li class="subject">���� : Ź����</li>
						<li class="comment">������Į�� ���� ǳ���� ����</li>
						<li class="price">11,000��</li>
					</ul>
				</div>
				
				<div class="item">
					<ul>
						<li><a href="./bookDetail.jsp?img5=<%=def %>"><input type="image" src="img/img5.PNG"></a></li>				
						<li class="subject">���� : Ź����</li>
						<li class="comment">�� ���Ѻ��� �ִ�!</li>
						<li class="price">13,000��</li>
					</ul>
				</div>
				
				<div class="item">
					<ul>
						<li><a href="./bookDetail.jsp?img6=<%=ghi %>"><input type="image" src="img/img6.PNG"></a></li>
						<li class="subject">���� : �ۿ���</li>
						<li class="comment">�ùٰ߿� ���� ���� �̾߱�</li>
						<li class="price">14,000��</li>
					</ul>
				</div>
				
				<div class="item">
					<ul>
						<li><a href="./bookDetail.jsp?img7=<%=jkl %>"><input type="image" src="img/img7.jpg"></a></li>
						<li class="subject">���� : ������</li>
						<li class="comment">����Ʈ���� 1�� ��蹿�� ��ǰ</li>
						<li class="price">18,000��</li>
					</ul>
				</div>
			</section>
		</section>
	</body>
</html>