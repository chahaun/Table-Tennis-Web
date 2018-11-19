<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>��ǰ ���� ����</title>
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

#sidebar {
	width: 400px;
	padding: 20px;
	float: right;
	margin-bottom: 20px;
}

#contents1 {
	width: 960px;
	float: left;
}

#contents2 {
	width: 960px;
	float: left;
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

.menu1 a:hover {
	background:;
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

.exp1 {
	color: dimgrey;
}

.exp2 {
	color: red;
	font-weight: bold;
	font-size: 20px;
	margin-left: 5px;
}

.exp3 {
	color: black;
	margin-left: 5px;
}

h3.pakage {
	margin-left: 20px;
	color: blue;
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
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "1234");
			if (conn == null)
				out.println("����Ұ�<BR>");
			stmt = conn.createStatement(); // statement ��üȣ��
			ResultSet rs = stmt.executeQuery("select * from product");
			String prod_id = request.getParameter("ProdID");
			int pid = Integer.parseInt(prod_id);
			while (rs.next()) {
				if (rs.getInt("prod_ID") == pid) {
					String productName = rs.getString("prod_Name");
					String prodectPrice = rs.getString("prod_Price");
					String prodectPrice2 = rs.getString("prod_Price2");
					String productDeliv = rs.getString("prod_Deliv");
					request.setAttribute("PROD_NAME", productName);
					request.setAttribute("PROD_PRICE", prodectPrice);
					request.setAttribute("PROD_PRICE2", prodectPrice2);
					request.setAttribute("PROD_DELIV", productDeliv);
				}
			}
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
		
		String e1 = "image/prod_image/product" + request.getParameter("ProdID") + "_1.PNG";
		String e2 = "image/prod_image/product" + request.getParameter("ProdID") + "_2.PNG";
		String e3 = "image/prod_image/product" + request.getParameter("ProdID") + "_3.PNG";
		String e4 = "image/prod_image/product" + request.getParameter("ProdID") + "_4.PNG";
		String e5 = "image/prod_image/product" + request.getParameter("ProdID") + "_5.PNG";
		String e6 = "image/prod_image/product" + request.getParameter("ProdID") + "_6.PNG";
	%>
	<!-- ��� ���� -->
	<div id="container">
		<table width="100%" border="0">
			<tr>
				<td height="20" border="0">
					<table width="960px">
						<tr>
							<td align="right"><%=id%><a href=<%=logUrl%>><%=logText%></a>
								| <a href="#">ȸ������</a> | <a href="#">��ٱ���</a> | <a href="#">�ֹ�/�����ȸ</a>
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
					<a href="/TTProject/mainpage.jsp"><h1 class="logo">Ping-Pong Market</h1></a>
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
					</div>
				</li>
				<li class="menu1"><a href="/TTProject/productList.jsp?ProdID=1">��Ȧ�� ����</a>
					<div class="content1">
						<a href="#">��ǰ 1</a> <a href="#">��ǰ 2</a> <a href="#">��ǰ 3</a>
					</div>
				</li>
				<li class="menu1"><a href="#">����ũ ����</a>
					<div class="content1">
						<a href="#">��ǰ 1</a> <a href="#">��ǰ 2</a> <a href="#">��ǰ 3</a>
					</div>
				</li>
				<li class="menu1"><a href="#">�߱��� ����</a>
					<div class="content1">
						<a href="#">��ǰ 1</a> <a href="#">��ǰ 2</a> <a href="#">��ǰ 3</a>
					</div>
				</li>
				<li class="menu1"><a href="#">Ź������</a></li>
				<li class="menu1"><a href="#">Ź����</a></li>
				<li class="menu1"><a href="#">�Ƿ�&Ź��ȭ</a></li>
				<li class="menu1"><a href="#">Ź����</a></li>
				<li class="menu1"><a href="#">���ô±�</a></li>
			</ul>
		</div>
		<!-- �޴��� ���� -->
		
		<div id="contents1">
			<table class="table1" cellpadding=10>
				<tr>
					<td><a href="/TTProject/product.jsp?ProdID=1"><img src="<%=e1%>" width="200px" alt="�����̹���"></a></td>
					<td>
						<b>����Ÿ�� ���� ������ ��Ʈ</b><br><br>
						169,000�� <br><br>
						��ۺ� 2,500�� <br> <br> <br> <br>
						���� 24<br>
					</td>
				</tr>
				<tr>
					<td><a href="/TTProject/product.jsp?ProdID=1"><img src="<%=e2%>" width="200px" alt="�����̹���"></a></td>
					<td>
						<b>Kokutaku Zenon</b><br><br>
						169,000�� <br><br>
						��ۺ� 2,500�� <br> <br> <br> <br>
						���� 4<br>
					</td>
				</tr>
				<tr>
					<td><a href="/TTProject/product.jsp?ProdID=1"><img src="<%=e3%>" width="200px" alt="�����̹���"></a></td>
					<td>
						<b>Shake Table Tenis Racket</b><br><br>
						169,000�� <br><br>
						��ۺ� 2,500�� <br> <br> <br> <br>
						���� 11<br>
					</td>
				</tr>
				<tr>
					<td><a href="/TTProject/product.jsp?ProdID=1"><img src="<%=e4%>" width="200px" alt="�����̹���"></a></td>
					<td>
						<b>Kokutaku Rozena</b><br><br>
						169,000�� <br><br>
						��ۺ� 2,500�� <br> <br> <br> <br>
						���� 21<br>
					</td>
				</tr>
				<tr>
					<td><a href="/TTProject/product.jsp?ProdID=1"><img src="<%=e5%>" width="200px" alt="�����̹���"></a></td>
					<td>
						<b>����Ÿ�� ���� ������ ��Ʈ</b><br><br>
						169,000�� <br><br>
						��ۺ� 2,500�� <br> <br> <br> <br>
						���� 78<br>
					</td>
				</tr>
				<tr>
					<td><a href="/TTProject/product.jsp?ProdID=1"><img src="<%=e6%>" width="200px" alt="�����̹���"></a></td>
					<td>
						<b>����Ÿ�� ���� ������ ��Ʈ</b><br><br>
						169,000�� <br><br>
						��ۺ� 2,500�� <br> <br> <br> <br>
						���� 54<br>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="footer">
		<div class="copyright">COPYRIGHT��2018 Cha Hae Wun for
			WebProject. ALL rights reserved.</div>
	</div>
</body>
</html>
