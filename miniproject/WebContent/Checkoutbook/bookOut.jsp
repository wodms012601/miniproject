<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "books.*" %>
<%@ page import = "bookcheck.*" %>
<!DOCTYPE html>
<%
	int bookNo = Integer.parseInt(request.getParameter("no"));
	
	//bookDaoŬ������ ���� ��ü�� ����
	bookDao dao = new bookDao();
	//�����˻� �޼��带 ȣ���ϸ鼭 ����������(bookDetail.jsp)���� ���� no���� �Ű������� ����
	booksManagement books = dao.selectBookInfo(bookNo);
	
	BookOutReturn bookOut = new BookOutReturn();
	bookOut.checkOut(books); //���� ó�� �޼��带 ȣ��
	
	response.sendRedirect(request.getContextPath() + "/books/bookList.jsp");
%>