<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "books.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<%
	int currentPage = 0;
	int pagePerRow = 4;
	String mName = (String)session.getAttribute("mName"); //�α��� �� ���ǿ� ������ �̸���
	
	bookDao dao = new bookDao();
	ArrayList<booksManagement> bookList = dao.selectBookList(currentPage, pagePerRow);
%>
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
					<div id="search_title"><a href="<%=request.getContextPath() %>/books/selectBookSearch.jsp">�����˻�</a></div>
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
					<%
						if(mName != null){
					%>
						<div><%=mName %>�� �������.</div>
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
			<%
				for(int i=0; i<bookList.size(); i++){
			%>
				<div class="item">	
					<ul>	
						<li><a href="<%=request.getContextPath() %>/bookDetail.jsp?no=<%=bookList.get(i).getInfo() %>" ><input type="image" src="img/img4.PNG"></a></li>
						<li class="subject">���� : <%=bookList.get(i).getBook_writer() %></li>
						<li class="comment">���� : <%=bookList.get(i).getBook_name() %></li>
						<li class="price">���ǻ� : <%=bookList.get(i).getBook_publisher() %></li>
					</ul>
				</div>
			<%
				}
			%>
			</section>
		</section>
	</body>
</html>