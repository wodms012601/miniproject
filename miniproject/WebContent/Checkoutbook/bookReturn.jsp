<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "bookcheck.*" %>
<!DOCTYPE html>
<%
	//도서상세정보에서 받은 도서 no값
	int bookNo = Integer.parseInt(request.getParameter("no"));

	//로그인 후 세션에 저장한 아이디값
	String mId = (String)session.getAttribute("mId");

	BookOutReturn bookReturn = new BookOutReturn();
	bookReturn.checkIn(bookNo, mId); //도서반납메서드 호출
	
	System.out.println("반납완료");
	
	//모든 처리가 끝나면 대출,반납리스트로 이동
	response.sendRedirect(request.getContextPath() + "/Checkoutbook/bookOutReturnList.jsp");
%>
