<!-- 2018.07.04 Ź���� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<%
	MemberDao dao = new MemberDao();
	ArrayList<Member> memberList = dao.listMember(); //ȸ�� ����Ʈ �޼��� ȣ��
%>
<html>
	<head>
		<title>1�� ������Ʈ</title>
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
					<div id="search_title">�����˻�</div>
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
		    <table border="1" id="ta">
		        <thead>
					<tr>
						<th>ȸ���ѹ�</th>
						<th>ȸ�����̵�</th>
						<th>ȸ���̸�</th>
						<th>����</th>
						<th>����</th>
						<th>�ּ�</th>
						<th>����</th>
						<th>����</th>
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
						<td><a href="<%=request.getContextPath() %>/Member/updateMemberForm.jsp?no=<%=memberList.get(i).getMemberNo() %>">����</a></td>
						<td><a href="<%=request.getContextPath() %>/Member/deleteMember.jsp?no=<%=memberList.get(i).getMemberNo() %>">����</a></td>
					</tr>
				<%
					}
				%>
				</thead>
			</table>
		</section>
	</body>
</html>