<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "bookcheck.*" %>
<!DOCTYPE html>
<%
	//도서상세정보에서 받은 도서 no값
	int bookNo = Integer.parseInt(request.getParameter("no"));

	BookOutReturn bookReturn = new BookOutReturn();
	bookReturn.checkIn(bookNo); //도서반납메서드 호출
	
	//모든 처리가 끝나면 대출,반납리스트로 이동
	response.sendRedirect(request.getContextPath() + "/Checkoutbook/bookOutReturnList.jsp");
%>
