<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>insertBookForm</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/books/insertBookAction.jsp" method="post" >
		<table>				
			<tr>
				<td>책 카테고리</td>
				<td><input type="text" name="book_cate"></td>
			</tr>
			<tr>
				<td>책 이름</td>
				<td><input type="text" name="book_name"></td>
			</tr>
			<tr>
				<td>책 저자</td>
				<td><input type="text" name="book_writer"></td>
			</tr>
			<tr>
				<td>책 출판사</td>
				<td><input type="text" name="book_publisher"></td>
			</tr>
		</table>
		<input type="submit" value="책 리스트 등록">
	</form>
</body>
</html>