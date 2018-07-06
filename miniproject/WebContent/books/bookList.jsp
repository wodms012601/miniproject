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
	<header>
		<section id="top">
			<a id="logo" href="<%=request.getContextPath() %>/indexed.jsp"><img src="<%=request.getContextPath() %>/img/logo.gif"></a>
			<div id="search">
				<div id="search_title"><a href="<%=request.getContextPath() %>/books/selectBookSearch.jsp?no=go">도서검색</div>
				<div id="search_button"><img src="<%=request.getContextPath() %>/img/btn_search.gif"></div>
			</div>
			<nav id="top_menu">
				<ul>
					<li><a href="#">마이페이지</a></li>
					<li><a href="#">이용안내</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</section>
		
		<nav id="main_menu">
			<ul>
				<li><a href="">추천도서</a></li>
				<li><a href="">고객갤러리</a></li>
				<li><a href="">무료도서</a></li>
				<li><a href="">유료도서</a></li>
				<li><a href="">자주하는질문</a></li>
			</ul>
		</nav>
	</header>
	
	<section id="main">
		    <table border="1" id="ta">
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
	                <tr id="tb">
	                    <td><%=a.getInfo()%></td>
	                    <td><%=a.getBook_cate()%></td>
	                    <td><%=a.getBook_name()%></td>
	                    <td><%=a.getBook_writer()%></td>
	                    <td><%=a.getBook_publisher()%></td>
	                    <td><%=a.getBook_record_date()%></td>
	                    <td><a href="<%=request.getContextPath() %>/bookDetail.jsp?no=<%=a.getInfo()%>">상세정보</a></td>
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