<!-- 2018.07.04 Ź���� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<%
	MemberDao dao = new MemberDao();
	ArrayList<Member> memberList = dao.listMember();
%>
<html>
	<head>
		<title>memberList</title>
	</head>
	<body>
		<table border="1">
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
		
		<%
			
		%>
		</table>
	</body>
</html>