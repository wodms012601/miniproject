<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "bookcheck.*" %>
<!DOCTYPE html>
<%
	//�������������� ���� ���� no��
	int bookNo = Integer.parseInt(request.getParameter("no"));

	BookOutReturn bookReturn = new BookOutReturn();
	bookReturn.checkIn(bookNo); //�����ݳ��޼��� ȣ��
	
	System.out.println("�ݳ��Ϸ�");
	
	//��� ó���� ������ ����,�ݳ�����Ʈ�� �̵�
	response.sendRedirect(request.getContextPath() + "/Checkoutbook/bookOutReturnList.jsp");
%>
