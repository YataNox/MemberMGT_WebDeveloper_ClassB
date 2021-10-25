<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginForm</title>
		<script type="text/javascript">
			function loginCheck(){
				if(document.frm.userid.value == ""){
					alert("아이디를 입력하세요.");
					document.frm.userid.focus();
					return false;
				}
				if(document.frm.userpwd.value == ""){
					alert("암호를 입력하세요.");
					document.frm.userpwd.focus();
					return false;
				}
				return true;
			}
		</script>
	</head>
	<body>
		<form action="login.do" method="post" name="frm">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userpwd"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="로그인" onClick="return loginCheck()">
					<!-- loginCheck() 함수가 리턴해주는 true/false에 따라 form이
					action에 설정된 페이지로 이동할지 멈출지가 결정됩니다. false가 리턴되면 action으로 이동이 멈춤
					true가 리턴되면 이동은 계속 진행 -->
					<input type="button" value="회원가입" onClick="join.do"></td>
				</tr>
				<tr>
					<td colspan="2">${message}</td>
				</tr>
			</table>
		</form>
	</body>
</html>