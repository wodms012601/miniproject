<!-- 2018.07.04 탁재은 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<!DOCTYPE html>
<%
	int memberNo = Integer.parseInt(request.getParameter("no"));

	MemberDao dao = new MemberDao();
	dao.deleteMember(memberNo); //회원삭제 메서드 호출
	
	response.sendRedirect(request.getContextPath()+"/Member/memberList.jsp");
%>