<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃</title>
<style>
</style>
</head>
<body>
	<%
  		session.invalidate(); // 세션 종료
 		response.sendRedirect("/TTProject/mainpage.jsp"); // index.jsp 로 이동 
     %>
</body>
</html>