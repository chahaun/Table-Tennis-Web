<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	Statement stmt = null;
	
	String productId = (String)session.getAttribute("P_ID");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "1234");
		if (conn == null)
			throw new Exception("DB 연결불가");
		stmt = conn.createStatement(); // statement 객체호출
		ResultSet rs = stmt.executeQuery("select * from product");
		int pid = Integer.parseInt(productId);
		String productName = null;
		int prodectPrice = 0;
		String productDeliv = null;
		while (rs.next()) {
			if (rs.getInt("prod_ID") == pid) {
				productName = rs.getString("prod_Name");
				prodectPrice = rs.getInt("prod_Price");
				productDeliv = rs.getString("prod_Deliv");
			}
		}
		String cmd = String.format("insert into bucket(prod_ID, prod_Name, prod_Price, prod_deliv) values('%d', '%s', '%d', '%s');"
		, pid, productName, prodectPrice, productDeliv);
		
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
	
    response.sendRedirect("bucket.jsp");

%>