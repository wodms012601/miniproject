<!-- 2018.07.04 Ź���� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<!DOCTYPE html>
<%
	int memberNo = Integer.parseInt(request.getParameter("no"));

	MemberDao dao = new MemberDao();
	dao.deleteMember(memberNo); //ȸ������ �޼��� ȣ��
	
	response.sendRedirect(request.getContextPath()+"/Member/memberList.jsp");
%>