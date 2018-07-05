<!-- 2018.07.04 탁재은 -->
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
		
		<%
			
		%>
		</table>
	</body>
</html>