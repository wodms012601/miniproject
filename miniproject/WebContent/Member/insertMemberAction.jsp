<!-- 2018.07.04 탁재은 -->
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
	
	//회원가입 처리 메서드 호출
	MemberDao dao = new MemberDao();
	dao.insertMember(member);
	
	//모든 처리가 끝나면 회원리스트로
	response.sendRedirect(request.getContextPath()+"/Member/memberList.jsp");
%>
