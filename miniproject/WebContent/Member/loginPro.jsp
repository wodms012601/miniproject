<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<!DOCTYPE html>
<%
	//�α���ȭ�鿡�� ���� id�� pw��
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	System.out.println(id);
	System.out.println(pw);
	
	
	Login login = new Login();
	Member member = login.loginPro(id, pw); //�α��� ó�� �޼��� ȣ��
	
	System.out.println(member.getId());
	
	//��۰���, ����,�ݳ��������� �α����� id���� ����ϱ⶧���� ����ó���� ����
	session.setAttribute("mId", member.getId());
	session.setAttribute("mName", member.getName());
	
	//��� ó���� ������ ������������
	response.sendRedirect(request.getContextPath() + "/indexed.jsp");
%>