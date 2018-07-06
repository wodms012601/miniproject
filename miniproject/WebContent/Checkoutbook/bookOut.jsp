<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "books.*" %>
<%@ page import = "bookcheck.*" %>
<!DOCTYPE html>
<%
	//도서상세정보에서 받은 도서 no값
	int bookNo = Integer.parseInt(request.getParameter("no"));
	
	//로그인 후 세션에 저장한 아이디값
	String mId = (String)session.getAttribute("mId");
	
	//bookDao클래스를 통해 객체를 생성
	bookDao dao = new bookDao();
	//도서검색 메서드를 호출하면서 도서상세정보(bookDetail.jsp)에서 받은 no값을 매개변수로 대입
	booksManagement books = dao.selectBookInfo(bookNo);
	
	BookOutReturn bookOut = new BookOutReturn();
	bookOut.checkOut(books, mId); //대출 처리 메서드를 호출
	
	System.out.println("대출완료");
	
	//모든 처리가 끝나면 대출,반납리스트로 이동
	response.sendRedirect(request.getContextPath() + "/Checkoutbook/bookOutReturnList.jsp");
%>