<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>main</title>
	</head>
	<body>
		<table>
			<tr>
				<td>안녕하세요. ${loginUser.name}(${loginUser.userid})님</td>
			</tr>
			<tr>
				<td>email : ${loginUser.email}</td>
			</tr>
			<tr>
				<td>전화번호 : ${loginUser.phone}</td>
			</tr>
			<tr>
				<td><input type="button" value ="로그아웃" onClick="location.href='logout.do'"/>
					<input type="button" value ="회원정보변경" onClick="location.href='update.do?userid=${loginUser.userid}'"/></td>
				<!-- 문자데이터들 사이에 EL문법이 껴들어서 조합 문자데이터 구성 가능합니다. -->
			</tr>
			<tr><td colspan="2">${message}</td></tr>
		</table>
	</body>
</html>