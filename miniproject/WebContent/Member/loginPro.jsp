<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Login login = new Login();
	Member member = login.loginPro(id, pw); //로그인 처리 메서드 호출
	
	session.setAttribute("mId", member.getId());
	session.setAttribute("mName", member.getName());
%>