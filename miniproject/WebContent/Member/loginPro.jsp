<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<!DOCTYPE html>
<%
	//로그인화면에서 받은 id와 pw값
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	System.out.println(id);
	System.out.println(pw);
	
	
	Login login = new Login();
	Member member = login.loginPro(id, pw); //로그인 처리 메서드 호출
	
	System.out.println(member.getId());
	
	//댓글관리, 대출,반납관리에서 로그인한 id값을 써야하기때문에 세션처리를 해줌
	session.setAttribute("mId", member.getId());
	session.setAttribute("mName", member.getName());
	
	//모든 처리가 끝나면 메인페이지로
	response.sendRedirect(request.getContextPath() + "/indexed.jsp");
%>