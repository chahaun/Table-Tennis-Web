<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@page import="java.sql.*"%>
<%@page import="java.net.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	Statement stmt = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "1234");
		if (conn == null)
			throw new Exception("DB 연결불가");
		stmt = conn.createStatement(); // statement 객체호출
		String house = request.getParameter("House");
		response.addCookie(new Cookie("House", URLEncoder.encode(house)));
		
		String arrID[] = new String[20];
		String arrName[] = new String[20];
		int arrPrice[] = new int[20];
		String arrDeliv[] = new String[20];
		int allPrice = 0;
		int cnt=0;
		ResultSet rs = stmt.executeQuery("select * from purchase");
		while (rs.next()) {
			arrID[cnt] = rs.getString("prod_ID");
			arrName[cnt] = rs.getString("prod_Name");
			arrPrice[cnt] = rs.getInt("prod_Price");
			arrDeliv[cnt] = rs.getString("prod_Deliv");
			allPrice += arrPrice[cnt];
			cnt++;
		}
		String cmd = String.format("insert into purchase (select * from bucket);");
		String cmd2 = String.format("delete from bucket;");
		
		int rowNum = stmt.executeUpdate(cmd);
		stmt.executeUpdate(cmd2);
		if(rowNum<0)
			throw new Exception("DB에 입력불가");
		
		response.sendRedirect("purchase.jsp");
		
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

%>