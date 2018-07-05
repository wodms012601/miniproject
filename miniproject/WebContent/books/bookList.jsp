<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="books.bookDao" %>
<%@ page import="books.booksManagement" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
	    currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	bookDao bookdao = new bookDao();
	int totalRowCount = bookdao.selectBookListCount();
	int pagePerRow = 10; // 한 페이지당 보이는 수
	int beginRow = (currentPage-1)*pagePerRow;
	ArrayList<booksManagement> bookList = bookdao.selectBookList(beginRow, pagePerRow);
%>
       
    <a href="insertBookForm.jsp">등록화면으로 이동</a><br><br>
    
    <table border="1">
        <thead>
            <tr>
                <th>info</th>
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
                <tr>
                    <td><%=a.getInfo()%></td>
                    <td><%=a.getBook_cate()%></td>
                    <td><%=a.getBook_name()%></td>
                    <td><%=a.getBook_writer()%></td>
                    <td><%=a.getBook_publisher()%></td>
                    <td><%=a.getBook_record_date()%></td>
                    <td><a href="bookInfo.jsp?send_id=<%=a.getInfo()%>">상세정보</a></td>
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

</body>
</html>