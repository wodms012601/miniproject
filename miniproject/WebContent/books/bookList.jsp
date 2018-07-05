<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="books.bookDao" %>
<%@ page import="books.booksManagement" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>1조 프로젝트</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<style>
		#ta{
			width:1000px;
			height:300px;
			text-align:center;
		}
	</style>
</head>
<body>
<%
	String mName = (String)session.getAttribute("mName");

	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
	    currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	bookDao bookdao = new bookDao();
	int totalRowCount = bookdao.selectBookListCount();
	int pagePerRow = 5; // 한 페이지당 보이는 수
	int beginRow = (currentPage-1)*pagePerRow;
	ArrayList<booksManagement> bookList = bookdao.selectBookList(beginRow, pagePerRow);
%>
	<div>
		<a href="#"></a>
	</div>
	<section id="main">
		    <table border="1" id="ta">
		        <thead>
		            <tr>
		                <th>insofksofkosdk</th>
		                <th>cate</th>
		                <th>name</th>
		                <th>writer</th>
		                <th>publisher</th>
		                <th>date</th>
		                <th>상세정보</th>
		                <th>삭제</th>
		                <th>수정</th>
		            </tr>
		        </thead>
        		<tbody>
<%
            	for(booksManagement a : bookList) {
%>
	                <tr id="tb">
	                    <td><%=a.getInfo()%></td>
	                    <td><%=a.getBook_cate()%></td>
	                    <td><%=a.getBook_name()%></td>
	                    <td><%=a.getBook_writer()%></td>
	                    <td><%=a.getBook_publisher()%></td>
	                    <td><%=a.getBook_record_date()%></td>
	                    <td><a href="<%=request.getContextPath() %>/bookDetail.jsp?info=<%=a.getInfo()%>">상세정보</a></td>
	                    <td><a href="deleteBookAction.jsp?send_id=<%=a.getInfo()%>">삭제</a></td>
	                    <td><a href="updateBookForm.jsp?send_id=<%=a.getInfo()%>">수정</a></td>
	                </tr>
<%        
            	}
%>
        		</tbody>
    		</table>
<%
    int lastPage = totalRowCount/pagePerRow;
    if(totalRowCount%pagePerRow != 0) {
        lastPage++;
    }
%>
    <div>
<%
        if(currentPage>1) {
%>
            <a href="<%=request.getContextPath()%>/books/bookList.jsp?currentPage=<%=currentPage-1%>">이전</a>
<%
        }
        if(currentPage<lastPage) {
%>
            <a href="<%=request.getContextPath()%>/books/bookList.jsp?currentPage=<%=currentPage+1%>">다음</a>
<%
        }
%>
    </div>
    </section>
</body>
</html>