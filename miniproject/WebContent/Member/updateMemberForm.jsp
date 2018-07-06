<!-- 2018.07.04 Ź���� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "member.*" %>
<!DOCTYPE html>
<%
	//ȸ������Ʈ���������� ���� no��
	int MemberNo = Integer.parseInt(request.getParameter("no"));
	
	MemberDao dao = new MemberDao();
	Member member = dao.selectMember(MemberNo);
%>
<html>
	<head>
		<title>ȸ������ ��</title>
		<script>
			/* ��й�ȣ üũ �Լ� */
			function passwordCheck(){
				var pw = document.getElementById("pw").value;
				var rePw = document.getElementById("rePw").value;
				var pwCheck = document.getElementById("pwCheck");
				// ��й�ȣ Ȯ�ΰ��� ������ ���� �Է����ּ���
				// ���� ���� �ٸ��� ���� �ٸ��ϴ� ���
				if(rePw == ""){
					pwCheck.innerHTML = "��й�ȣ�� �Է����ּ���.";
				} else if(pw !== rePw){
					pwCheck.innerHTML = "��й�ȣ�� �ٽ� �ѹ� Ȯ�����ּ���.";
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
			<!-- �α��� ���� -->
			<fieldset>
				<legend>01 �α��� ����</legend>
				<table>
					<tr><!-- ���̵�  -->
						<td>
							<img src="<%=request.getContextPath() %>/Image/check_icon.gif">
						</td>
						<td>
							���̵� : &nbsp;
						</td>
						<td>
							<input type="text" name="id" value="<%=member.getId() %>" required>
						</td>
						<td>
							<input type="button" value="�ߺ�Ȯ��">
						</td>
					</tr>
					<tr><!-- ��й�ȣ  -->
						<td>
							<img src="<%=request.getContextPath() %>/Image/check_icon.gif">
						</td>
						<td>
							��й�ȣ : &nbsp;
						</td>
						<td>
							<input type="password" id="pw" name="pw" required>
						</td>
					</tr>
					<tr><!-- ��й�ȣ Ȯ��  -->
						<td>
							<img src="<%=request.getContextPath() %>/Image/check_icon.gif">
						</td>
						<td>
							��й�ȣ Ȯ�� : &nbsp;
						</td>
						<td>
							<!-- onkeyup �Ӽ��� �̿��� Ű���忡�� ������ ��й�ȣ�� ���� Ȯ���Ѵ�. -->
							<input type="password" id="rePw" onkeyup="passwordCheck()" required>
						</td>
						<td>
							<span id="pwCheck"></span>
						</td>
					</tr>
				</table>
			</fieldset>
			
			<!-- ��������  -->
			<fieldset>
				<legend>02 ���� ����</legend>
				<table>
					<tr><!-- �̸� -->
						<td>
							<img src="<%=request.getContextPath() %>/Image/check_icon.gif">
						</td>
						<td>
							�̸� : &nbsp;
						</td>
						<td>
							<input type="text" name="name" value="<%=member.getName() %>" required>
						</td>
					</tr>
					<tr><!-- ���� -->
						<td>
							<img src="<%=request.getContextPath() %>/Image/check_icon.gif">
						</td>
						<td>
							���� : &nbsp;
						</td>
						<td>
							<input type="radio" name="gender" value="����" required>����
							<input type="radio" name="gender" value="����" required>����
						</td>
					</tr>
					<tr><!-- �ּ� -->
						<td>
							<img src="<%=request.getContextPath() %>/Image/check_icon.gif">
						</td>
						<td>
							�ּ� : &nbsp;
						</td>
						<td colspan="3">
							<input type="text" name="addr" size="40" value="<%=member.getAddr() %>" required>
						</td>
					</tr>
				</table>
			</fieldset>
			<br>
			<fieldset>
				<input type="submit" value="����">
			</fieldset>
		</form>
	</body>
</html>