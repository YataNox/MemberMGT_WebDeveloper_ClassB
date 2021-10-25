<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
	</head>
	<body>
		<%
		//response.sendRedirect("member/loginForm.jsp");
		
		// 시작페이지 index.jsp에서는 실제 내용을 담은 페이지 또는 서블릿으로  로딩과 동시에
		// 이동하는 동작을 넣는 것이 보통이며, 통상 보안을 위해서 서블릿으로 이동하는 것이 보통입니다.
		response.sendRedirect("login.do");
		%>
	</body>
</html>