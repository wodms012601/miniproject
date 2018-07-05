<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "books.*" %>
<%@ page import = "bookcheck.*" %>
<!DOCTYPE html>
<%
	int bookNo = Integer.parseInt(request.getParameter("no"));
	
	//bookDao클래스를 통해 객체를 생성
	bookDao dao = new bookDao();
	//도서검색 메서드를 호출하면서 도서상세정보(bookDetail.jsp)에서 받은 no값을 매개변수로 대입
	booksManagement books = dao.selectBookInfo(bookNo);
	
	BookOutReturn bookOut = new BookOutReturn();
	bookOut.checkOut(books); //대출 처리 메서드를 호출
	
	response.sendRedirect(request.getContextPath() + "/books/bookList.jsp");
%>