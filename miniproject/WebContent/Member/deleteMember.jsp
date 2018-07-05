<!-- 2018.07.04 탁재은 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<!DOCTYPE html>
<%
	//회원리스트페이지에서 받은 no값
	int memberNo = Integer.parseInt(request.getParameter("no"));

	MemberDao dao = new MemberDao();
	dao.deleteMember(memberNo); //회원삭제 메서드 호출
	
	//모든 처리가 끝나면 회원리스트로
	response.sendRedirect(request.getContextPath()+"/Member/memberList.jsp");
%>