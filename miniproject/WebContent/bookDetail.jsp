<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<%@ page import = "books.*" %>
<!DOCTYPE html>
<%
	//���� ���������� å ������ Ŭ���ϸ� å�� no�� �Բ� �Ѿ�´�
	int bookNo = Integer.parseInt(request.getParameter("no"));
	
	//�α��� �� ���ǿ� ������ ���̵�,�̸���
	String mId = (String)session.getAttribute("mId");
	String mName = (String)session.getAttribute("mName");
	
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
					<div id="search_title">�����˻�</div>
					<div id="search_form"><input type="text"></div>
					<div id="search_button"><img src="img/btn_search.gif"></div>
				</div>
				<nav id="top_menu">
					<ul>
						<li class="green"><a href="#">�α���</a></li>
						<li class="green"><a href="#">ȸ������</a></li>
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
			<section id="cat1_1">
					<img src="img/img4co.PNG">
			</section>
			<section id="cat2_1">
				
				ī�װ� : 
				���� : ������ ������ �� ������Į<br><br>
				���� : Ź����<br><br>
				���ǻ� : 11000��<br><br>
				��� : ������Į�� ǳ�濡 ���� ��� ��<br><br>
				���� : 2013�� Ź���� �۰��� ������Į���� �� �޵��� �ӹ��� �־���.<br>
				&emsp;&emsp;&emsp;���ѹα� ������� �Ͽ� ���� ��鼭 ���������� ������ ���̸� ���� �� �ְ�<br>
				&emsp;&emsp;&emsp;���� ǳ���� ���� å�̸� �ӹ��� �ִ� ���� ������Į�� ���� ������ ��ȭ,<br>
				&emsp;&emsp;&emsp;������� ���� ���� ��û�� ����Ʈ����	
				<div id="id">
					<a href="<%=request.getContextPath() %>/Checkoutbook/bookOut.jsp?no="><img src="img/DC.png"></a> 
					<a href="<%=request.getContextPath() %>/Checkoutbook/bookReturn.jsp"><img src="img/BN.png"></a>
				</div>
			</section>
		</section>
		
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