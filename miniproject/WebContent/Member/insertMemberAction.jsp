<!-- 2018.07.04 Ź���� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("EUC-KR");
	
	Member member = new Member();
	member.setId(request.getParameter("id"));
	member.setPw(request.getParameter("pw"));
	member.setName(request.getParameter("name"));
	member.setLevel(request.getParameter("level"));
	member.setGender(request.getParameter("gender"));
	member.setAddr(request.getParameter("addr"));
	
	//ȸ������ ó�� �޼��� ȣ��
	MemberDao dao = new MemberDao();
	dao.insertMember(member);
	
	//��� ó���� ������ ȸ������Ʈ��
	response.sendRedirect(request.getContextPath()+"/Member/memberList.jsp");
%>
