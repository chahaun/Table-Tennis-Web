<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix= "fmt" uri= "http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>��ٱ���</title>
<style>
a {
	text-decoration: none;
}

h1.logo {
	margin-left: 350px;
	color: orange;
}

div {
	max-width: 960px;
}

#container {
	width: 960px;
	padding: 20px;
	margin: 0 auto;
}

#title {
	margin-top: 20px;
	margin-bottom: 20px;
}

#explain img {
	display: block;
}

#footer {
	max-width: 1920px;
	background-color: black;
	clear: both;
	padding: 20px;
}

.navi {
	list-style: none;
	padding: 0;
	margin: 0;
	max-width: 960px;
	background: #999;
	overflow: hidden;
}

.menu1 {
	float: left;
}

.menu1 a {
	padding: 14px 16px;
	display: inline-block;
	text-decoration: none;
	color: #fff;
}

.content1 {
	background: #f9f9f9;
	position: absolute;
	min-width: 160px;
	box-shadow: 0 1px 1px #CCC;
	display: none;
}

.content1 a {
	display: block;
	color: #333;
}

.content1 a:hover {
	background: #ccc;
}

.menu1:hover .content1 {
	display: block;
}

h3.title {
	color: darkslategray;
}

.btn_buy {
	font-weight: bold;
	background-color: red;
	vertical-align: middle;
	font-size: 20px;
	color: #ffffff;
	width: 196px;
	height: 60px;
	border-color: #659dab;
	border-width: 2px;
	border-style: solid;
}

.btn_back {
	font-weight: bold;
	background-color: #ffffff;
	vertical-align: middle;
	font-size: 20px;
	color: #000000;
	width: 196px;
	height: 60px;
	border-color: #659dab;
	border-width: 2px;
	border-style: solid;
}

.btnexp {
	margin-left: 270px;
}

.copyright {
	width: 100%;
	height: 25px;
	margin: auto;
	line-height: 25px;
	background-color: #111;
	text-align: center;
	font-size: 11px;
	color: #8c8c8c;
}
</style>
</head>

<body>
	<%
		HttpSession sessionGet = request.getSession(); // session�� �����ϸ� �ش� session�� ����(�������� ������ ���Ӱ� session ����)
		// getAttribute() �޼���� Object �� �����ϹǷ� String ���� ����ȯ�� ���־�� �Ѵ�.
		String id = (String) sessionGet.getAttribute("sessionId"); // name �� sessionId �� value �� ����
		String logText = ""; // �α���, �α׾ƿ� ǥ��
		String logUrl = ""; // �α���, �α׾ƿ� ���
		boolean login = id != null ? true : false; // �α��� ����
		if (login) { // �α��� �Ǿ� ���� ���, ǥ�õ� ���� ����
			id = id + "��  ";
			logText = "�α׾ƿ�";
			logUrl = "/TTProject/logout.jsp";
		} else { // �α׾ƿ� ������ ���� ǥ�õ� ���� ����
			id = "";
			logText = "�α���";
			logUrl = "/TTProject/login.html";
		}
		
		Connection conn = null;
		Statement stmt = null;
		//try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "1234");
			if (conn == null)
				out.println("����Ұ�<BR>");
			stmt = conn.createStatement(); // statement ��üȣ��
			String arrID[] = new String[20];
			String arrName[] = new String[20];
			int arrPrice[] = new int[20];
			String arrDeliv[] = new String[20];
			int allPrice = 0;
			int cnt=0;
			ResultSet rs = stmt.executeQuery("select * from bucket");
			while (rs.next()) {
				arrID[cnt] = rs.getString("prod_ID");
				arrName[cnt] = rs.getString("prod_Name");
				arrPrice[cnt] = rs.getInt("prod_Price");
				arrDeliv[cnt] = rs.getString("prod_Deliv");
				allPrice += arrPrice[cnt];
				cnt++;
			}
			
			/*
		} finally {
			try {
				//stmt.close();
			} catch (Exception ignored) {
			}
			try {
				//conn.close();
			} catch (Exception ignored) {
			}
		}
		*/
	%>
	<%int i=0; %>
	<!-- ��� ���� -->
	<div id="container">
		<table width="100%" border="0">
			<tr>
				<td height="20" border="0">
					<table width="960px">
						<tr>
							<td align="right">
							<%=id %><a href=<%=logUrl %>><%=logText %></a>
								 | <a href="/TTProject/registration.html">ȸ������</a> 
								 | <a href="/TTProject/bucket.jsp">��ٱ���</a> 
								 | <a href="/TTProject/purchase.jsp">�ֹ�/�����ȸ</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" bgcolor="#e1e0e0"></td>
			</tr>
		</table>
		<div id="header">
			<header>
				<div class="inner">
					<a href="/TTProject/mainpage.jsp"><h1 class="logo">Ping-Pong
							Market</h1></a>
				</div>
			</header>
		</div>
		<!-- ��� ���� -->

		<!-- �޴��� ���� -->
		<div id="menuBar">
			<ul class="navi">
				<li class="menu1"><a href="#">Ȩ������ �Ұ�</a>
					<div class="content1">
						<a href="/TTProject/notice.html">��������</a>
					</div></li>
				<li class="menu1"><a href="/TTProject/productList.jsp?ProdID=1">��Ȧ��
						����</a>
					<div class="content1">
						<a href="/TTProject/product.jsp?ProdID=3">�ڸ���</a> <a
							href="/TTProject/product.jsp?ProdID=4">�������</a> <a
							href="/TTProject/product.jsp?ProdID=5">Ƽ��ALC</a>
					</div></li>
				<li class="menu1"><a href="#">����ũ ����</a>
					<div class="content1">
						<a href="/TTProject/product.jsp?ProdID=2">����</a> <a
							href="/TTProject/product.jsp?ProdID=3">�ڸ���</a> <a
							href="/TTProject/product.jsp?ProdID=5">Ƽ��ALC</a>
					</div></li>
				<li class="menu1"><a href="#">�߱��� ����</a>
					<div class="content1">
						<a href="/TTProject/product.jsp?ProdID=3">�ڸ���</a> <a
							href="/TTProject/product.jsp?ProdID=4">�������</a> <a
							href="/TTProject/product.jsp?ProdID=5">Ƽ��ALC</a>
					</div></li>
				<li class="menu1"><a href="#">Ź������</a></li>
				<li class="menu1"><a href="#">Ź����</a></li>
				<li class="menu1"><a href="#">�Ƿ�&Ź��ȭ</a></li>
				<li class="menu1"><a href="#">Ź����</a></li>
			</ul>
		</div>
		<!-- �޴��� ���� -->

		<div id="title">
			<img src="image/bucket_title.png" width="960px" alt="Ÿ��Ʋ�̹���">
		</div>

		<div id="mainlist">
			<hr />
			<table border=0>
				<thead>
					<tr bgcolor="#e1e0e0">
						<th>��ǰ��ȣ</th>
						<th width = 230px>��ǰ��</th>
						<th width = 230px>��ǰ ����</th>
						<th width = 230px>��ۺ�</th>
						<th width = 40px>����</th>
					</tr>
				</thead>
				
				<c:forEach var="ii" begin="1" end="<%=cnt %>">
					<tr>
						<th><%=arrID[i] %></th>
						<th><%=arrName[i] %></th>
						<th><fmt:formatNumber value="<%=arrPrice[i]%>" pattern="###,###"/></th>
						<th><%=arrDeliv[i] %></th>
						<th style="font-size: 11px;"><a href="/TTProject/deleteBucket.jsp?ProdID=<%=arrID[i]%>">����</a></th>
					</tr>
					<% i++; %>
				</c:forEach>
				
				<tfoot>
					<tr bgcolor="#e1e0e0">
						<th width = 800px colspan="3"></th>
						<th>�� ���� : <fmt:formatNumber value="<%=allPrice%>" pattern="###,###"/>��</th>
					</tr>
				</tfoot>
			</table>
			

			<div>
				<form action=addPurchase.jsp>
					<br>
					<table>
						<tr>
							<th>����� �Է� : <input type=text name=House size=60></th>
						</tr>
					</table>
					<hr />
					<div class="btnexp">
						<input class="btn_buy" type="submit" value="���������ϱ�">
						<input class="btn_back" type="button" value="�������� ���ư���" onClick="history.go(-1)">
					</div>
				</form>
			</div>
		</div>

	</div>
	<div id="footer">
		<div class="copyright">COPYRIGHT��2018 Cha Hae Wun for
			WebProject. ALL rights reserved.</div>
	</div>
</body>
</html>