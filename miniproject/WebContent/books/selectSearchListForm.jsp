<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>

<form action="<%=request.getContextPath() %>/books/selectBookSearch.jsp" method="post">
	<div>
		<h3>도서 기간별 검색<h3><br>
		<input type = "date" name = "begin" >검색 시작 날짜<br> 
		<input type = "date" name = "end" >검색 종료 날짜<br>
	</div>
		
	<select name="sk">
		<option value="book_name">책 이름</option>
		<option value="book_cate">책 카테고리</option>
		<option value="book_writer">책 저자</option>
		<option value="book_publisher">책 출판사</option>
	</select>
			
		<input type="text" name = "sv" >
		<input type="submit" value = "도서 리스트 검색">
</form>

</body>
</html>