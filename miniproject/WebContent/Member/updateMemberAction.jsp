<!-- 2018.07.04 Ź���� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("EUC-KR");
	
	//������ �޾ƿ°����� MemberŬ������ ���� ���� ��ü�� ���� ����
	Member member = new Member();
	member.setMemberNo(Integer.parseInt(request.getParameter("no")));
	member.setId(request.getParameter("id"));
	member.setPw(request.getParameter("pw"));
	member.setName(request.getParameter("name"));
	member.setGender(request.getParameter("gender"));
	member.setAddr(request.getParameter("addr"));
	
	//����ó�� �޼��� ȣ��
	MemberDao dao = new MemberDao();
	dao.updateMember(member);
	
	//��� ó���� ������ ȸ������Ʈ��
	response.sendRedirect(request.getContextPath()+"/Member/memberList.jsp");
%>