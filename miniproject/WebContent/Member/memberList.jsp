<!-- 2018.07.04 탁재은 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<%
	MemberDao dao = new MemberDao();
	ArrayList<Member> memberList = dao.listMember(); //회원 리스트 메서드 호출
%>
<html>
	<head>
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
		
		<section id="main">
		    <table border="1" id="ta">
		        <thead>
					<tr>
						<th>회원넘버</th>
						<th>회원아이디</th>
						<th>회원이름</th>
						<th>권한</th>
						<th>성별</th>
						<th>주소</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				<%
					for(int i=0; i<memberList.size(); i++){
				%>	
					<tr>
				
						<td><%=memberList.get(i).getMemberNo() %></td>
						<td><%=memberList.get(i).getId() %></td>
						<td><%=memberList.get(i).getName() %></td>
						<td><%=memberList.get(i).getLevel() %></td>
						<td><%=memberList.get(i).getGender() %></td>
						<td><%=memberList.get(i).getAddr() %></td>
						<td><a href="<%=request.getContextPath() %>/Member/updateMemberForm.jsp?no=<%=memberList.get(i).getMemberNo() %>">수정</a></td>
						<td><a href="<%=request.getContextPath() %>/Member/deleteMember.jsp?no=<%=memberList.get(i).getMemberNo() %>">삭제</a></td>
					</tr>
				<%
					}
				%>
				</thead>
			</table>
		</section>
	</body>
</html>