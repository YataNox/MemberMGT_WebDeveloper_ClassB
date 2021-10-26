<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty loginUser}">
	<jsp:forward page="login.do"/>
</c:if>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>updateForm</title>
	</head>
	<body>
		<h2>회원정보 수정</h2>
		<form action="update.do" method="post" name="frm">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${member.name}" size="20">&nbsp;</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>${loginUser.userid}"
						<input type="hidden" name="userid" value="${loginUser.userid}"/>
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
					<td><input type="text" name="email" value="${loginUser.email}" size="20"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" value="${loginUser.phone}" size="20"></td>
				</tr>
				<tr>
					<td>등급</td>
					<td>
						<c:choose>
							<c:when test="${loginUser.admin==0}">
								<input type="radio" name="admin" value="0" checked="checked">일반회원&nbsp;
								<input type="radio" name="admin" value="1">관리자
							</c:when>
							<c:otherwise>
								<input type="radio" name="admin" value="0">일반회원&nbsp;
								<input type="radio" name="admin" value="1" checked="checked">관리자
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="확인" onClick="return joinCheck()">&nbsp;
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>