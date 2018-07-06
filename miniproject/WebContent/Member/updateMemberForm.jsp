<!-- 2018.07.04 탁재은 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<!DOCTYPE html>
<%
	//회원리스트페이지에서 받은 no값
	int MemberNo = Integer.parseInt(request.getParameter("no"));
	
	MemberDao dao = new MemberDao();
	Member member = dao.selectMember(MemberNo);
%>
<html>
	<head>
		<title>회원수정 폼</title>
		<script>
			/* 비밀번호 체크 함수 */
			function passwordCheck(){
				var pw = document.getElementById("pw").value;
				var rePw = document.getElementById("rePw").value;
				var pwCheck = document.getElementById("pwCheck");
				// 비밀번호 확인값이 없으면 값을 입력해주세요
				// 값이 서로 다르면 서로 다릅니다 출력
				if(rePw == ""){
					pwCheck.innerHTML = "비밀번호를 입력해주세요.";
				} else if(pw !== rePw){
					pwCheck.innerHTML = "비밀번호를 다시 한번 확인해주세요.";
				} else{
					pwCheck.innerHTML = "OK";
				}
			}
			window.addEventListener("load", function() {
				passwordCheck();
			});
		</script>
	</head>
	<body>
		<form action="<%=request.getContextPath() %>/Member/updateMemberAction.jsp?no=<%=MemberNo %>" method="post">
			<!-- 로그인 정보 -->
			<fieldset>
				<legend>01 로그인 정보</legend>
				<table>
					<tr><!-- 아이디  -->
						<td>
							<img src="<%=request.getContextPath() %>/Image/check_icon.gif">
						</td>
						<td>
							아이디 : &nbsp;
						</td>
						<td>
							<input type="text" name="id" value="<%=member.getId() %>" required>
						</td>
						<td>
							<input type="button" value="중복확인">
						</td>
					</tr>
					<tr><!-- 비밀번호  -->
						<td>
							<img src="<%=request.getContextPath() %>/Image/check_icon.gif">
						</td>
						<td>
							비밀번호 : &nbsp;
						</td>
						<td>
							<input type="password" id="pw" name="pw" required>
						</td>
					</tr>
					<tr><!-- 비밀번호 확인  -->
						<td>
							<img src="<%=request.getContextPath() %>/Image/check_icon.gif">
						</td>
						<td>
							비밀번호 확인 : &nbsp;
						</td>
						<td>
							<!-- onkeyup 속성을 이용해 키보드에서 놓을때 비밀번호를 서로 확인한다. -->
							<input type="password" id="rePw" onkeyup="passwordCheck()" required>
						</td>
						<td>
							<span id="pwCheck"></span>
						</td>
					</tr>
				</table>
			</fieldset>
			
			<!-- 개인정보  -->
			<fieldset>
				<legend>02 개인 정보</legend>
				<table>
					<tr><!-- 이름 -->
						<td>
							<img src="<%=request.getContextPath() %>/Image/check_icon.gif">
						</td>
						<td>
							이름 : &nbsp;
						</td>
						<td>
							<input type="text" name="name" value="<%=member.getName() %>" required>
						</td>
					</tr>
					<tr><!-- 성별 -->
						<td>
							<img src="<%=request.getContextPath() %>/Image/check_icon.gif">
						</td>
						<td>
							성별 : &nbsp;
						</td>
						<td>
							<input type="radio" name="gender" value="여자" required>여자
							<input type="radio" name="gender" value="남자" required>남자
						</td>
					</tr>
					<tr><!-- 주소 -->
						<td>
							<img src="<%=request.getContextPath() %>/Image/check_icon.gif">
						</td>
						<td>
							주소 : &nbsp;
						</td>
						<td colspan="3">
							<input type="text" name="addr" size="40" value="<%=member.getAddr() %>" required>
						</td>
					</tr>
				</table>
			</fieldset>
			<br>
			<fieldset>
				<input type="submit" value="가입">
			</fieldset>
		</form>
	</body>
</html>