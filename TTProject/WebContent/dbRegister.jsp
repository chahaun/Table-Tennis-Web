<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
	<%
		request.setCharacterEncoding("euc-kr");
		String name = request.getParameter("NAME");
		String rrn1 = request.getParameter("RRN1");
		String rrn2 = request.getParameter("RRN2");
		String id = request.getParameter("ID");
		String passwd1 = request.getParameter("PASSWD1");
		String passwd2 = request.getParameter("PASSWD2");
		String email1 = request.getParameter("EMAIL1");
		String email2 = request.getParameter("EMAIL2");
		String email3 = request.getParameter("EMAIL3");
		String emailResult = null;
		String phone = request.getParameter("PHONE");
		String job = request.getParameter("JOB");
		String receive = request.getParameter("RECEIVE");
		String receiveResult = null;
		
		if(name == null || id == null || passwd1 == null)
			throw new Exception("�����͸� �Է��ϼ���!");

		if (email3.equals("e_default"))
			emailResult = email2;
		else
			emailResult = email3;

		if (receive.equals("yes"))
			receiveResult = "����";
		else if (receive.equals("no"))
			receiveResult = "���Űź�";
		else
			receiveResult = "����";
		
		response.setContentType("text/html;charset=euc-kr");

		if (passwd1.equals(passwd2)) {
			Connection conn = null;
			Statement stmt = null;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "1234");
				if (conn == null)
					throw new Exception("DB ����Ұ�");
				stmt = conn.createStatement(); // statement ��üȣ��
				String cmd = String.format("insert into user(name, rrn, userID, userPWD, email, phone, job, receive) values('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s');"
				, name, rrn1+"-"+rrn2, id, passwd1, email1+emailResult, phone, job, receiveResult);
				
				int rowNum = stmt.executeUpdate(cmd);
				if(rowNum<1)
					throw new Exception("DB�� �ԷºҰ�");
			}
			finally {
				try {
                    stmt.close();
             	}
             	catch (Exception ignored) {
             	}
             	try {
             	       conn.close();
             	}
            	catch (Exception ignored) {
            	}
			}
			response.sendRedirect("login.html");
		} else {
			out.println("��й�ȣ�� ��ġ���� �ʽ��ϴ�!");
		}
	%>