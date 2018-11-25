<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	Statement stmt = null;
	
	String productId = request.getParameter("ProdID");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "1234");
		if (conn == null)
			throw new Exception("DB 연결불가");
		stmt = conn.createStatement(); // statement 객체호출
		ResultSet rs = stmt.executeQuery("select * from product");
		int pid = Integer.parseInt(productId);

		String cmd = String.format("DELETE FROM `shopping`.`bucket` WHERE (`prod_ID` = '%d');", pid);
		
		int rowNum = stmt.executeUpdate(cmd);
		if(rowNum<1)
			throw new Exception("DB에 입력불가");
		
		
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
	
	session.invalidate();
    response.sendRedirect("bucket.jsp");

%>