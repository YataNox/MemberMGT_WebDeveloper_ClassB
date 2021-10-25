<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>idcheck</title>
		<script>
			function idok(){
				// 현재 팝업창의 아이디 입력란에 있는 아이디를 오프너의 아이디 입력란에 복사합니다.
				opener.document.frm.userid.value = document.frm.userid.value;
				// 현재 팝업창의 아이디 입력란에 있는 아이디를 오프너의 reid의 value에 복사합니다.
				opener.document.frm.reid.value = document.frm.userid.value;
				// 현재 팝업창은 스스로 닫습니다.
				self.close();
			}
		</script>
	</head>
	<body>
		<form action="idcheck.do" method="get" name="frm">
			아이디 : <input type="text" name="userid" value="${userid}">
			<input type="submit" value="중복 체크">
		</form> <br><br><br>
		
		<c:if test="${result==1}">
			${userid}는 이미 사용 중인 아이디입니다.
			<script>
				opener.document.useri.value=""; // 팝업창을 오픈한 주체 : opener
			</script>
		</c:if>
		<c:if test="${result==-1 }">
			${userid}는 사용 가능한 아이디입니다.
			<input type="button" value="사용" onClick="idok();"/>
		</c:if>
	</body>
</html>