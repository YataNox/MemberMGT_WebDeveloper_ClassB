<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>joinForm</title>
	</head>
	<body>
		<h2>회원가입</h2>
		'*' 표시 항목은 필수 입력 항목입니다.
		<form action="join.do" method="post" name="frm">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" size="20">&nbsp;*</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid" size="20">&nbsp;*
						<input type="button" value="중복체크" onClick="idCheck();"/>
						<input type="hidden" name="reid" value=""/>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userpwd" size="20">&nbsp;*</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="userpwd_check" size="20">&nbsp;*</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" size="20"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" size="20"></td>
				</tr>
				<tr>
					<td>등급</td>
					<td>
						<input type="radio" name="admin" value="0" checked="checked">일반회원&nbsp;
						<input type="radio" name="admin" value="1" checked="checked">관리자
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="회원가입" onClick="return joinCheck()">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>