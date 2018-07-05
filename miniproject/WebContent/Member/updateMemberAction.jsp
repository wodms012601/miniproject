<!-- 2018.07.04 탁재은 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("EUC-KR");
	
	//폼에서 받아온값들을 Member클래스를 통해 만든 객체에 전부 저장
	Member member = new Member();
	member.setMemberNo(Integer.parseInt(request.getParameter("no")));
	member.setId(request.getParameter("id"));
	member.setPw(request.getParameter("pw"));
	member.setName(request.getParameter("name"));
	member.setGender(request.getParameter("gender"));
	member.setAddr(request.getParameter("addr"));
	
	//수정처리 메서드 호출
	MemberDao dao = new MemberDao();
	dao.updateMember(member);
	
	//모든 처리가 끝나면 회원리스트로
	response.sendRedirect(request.getContextPath()+"/Member/memberList.jsp");
%>