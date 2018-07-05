<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="books.bookDao" %>
<%@ page import="books.booksManagement" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>

	<%@ include file="/books/selectSearchListForm.jsp" %>
    
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
	String sk = request.getParameter("sk");	
	String sv = request.getParameter("sv");
	String begin = request.getParameter("begin");
	String end = request.getParameter("end");

	ArrayList<booksManagement> searchList = new ArrayList<booksManagement>();
	bookDao bookdao = new bookDao();
	booksManagement b = new booksManagement();
	
	if(begin == null || begin.equals("") || end == null || end.equals("") || sk == null && sk.equals("")){
		searchList = bookdao.selectSearchSv(b, sv);

	}else if(!begin.equals("") && begin != null && !end.equals("") && end != null && sk != null && !sv.equals("")){
		searchList = bookdao.selectSearchDate(begin, end, sk, sv);

	}else if(!begin.equals("") && begin != null && !end.equals("") && end != null && sk != null && sv.equals("")){	
		searchList = bookdao.selectSearchDate(begin, end);

	}else{
		searchList = bookdao.selectSearchSv(b, sv);
	}
	for(int i = 0; i < searchList.size(); i++){
		
		b = searchList.get(i);
		
%>		
	 				<tr>
						<td><%=b.getInfo()%></td>
						<td><%=b.getBook_cate()%></td>
						<td><%=b.getBook_name()%></td>
						<td><%=b.getBook_writer()%></td>
						<td><%=b.getBook_publisher()%></td>
						<td><%=b.getBook_record_date()%></td>						
              		    <td><a href="bookInfo.jsp?send_id=<%=b.getInfo()%>">상세정보</a></td>
            	        <td><a href="deleteBookAction.jsp?send_id=<%=b.getInfo()%>">삭제</a></td>
            	        <td><a href="updateBookForm.jsp?send_id=<%=b.getInfo()%>">수정</a></td>
					</tr>
<%				 
}
%>

				</tbody>
			</table> 
</body>
</html>