<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%
	Connection conn = null;
	Statement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "1234");
		if (conn == null)
			throw new Exception("DB 연결불가");
		stmt = conn.createStatement(); // statement 객체호출
		String cmd = String.format("delete from purchase;");
		stmt.executeUpdate(cmd);
		
	} finally {
		try {
			stmt.close();
		} catch (Exception ignored) {
		}
		try {
			conn.close();
		} catch (Exception ignored) {
		}
	}
	
	Cookie cookie = new Cookie("House","");
    response.addCookie(cookie);

    response.sendRedirect("purchase.jsp");

%>