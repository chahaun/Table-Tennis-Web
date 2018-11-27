<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>#Ź����ǰ ���θ� PingPong Market#</title>
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
	width: 220px;
	padding: 20px;
	float: right;
	margin-bottom: 20px;
	background: #eee;
}

#contents1 {
	width: 696px;
	float: left;
}

#contents2 {
	width: 960px;
	float: left;
	margin-bottom: 20px;
}

#box1 img {
	display: inline;
	margin: 10px;
}

#box2 img {
	display: inline;
	margin: 10px;
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

.notices li {
	font-size: 14px;
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
	HttpSession sessionGet =request.getSession(); // session�� �����ϸ� �ش� session�� ����(�������� ������ ���Ӱ� session ����)
	// getAttribute() �޼���� Object �� �����ϹǷ� String ���� ����ȯ�� ���־�� �Ѵ�.
	String id = (String)sessionGet.getAttribute("sessionId"); // name �� sessionId �� value �� ����
	String logText = ""; // �α���, �α׾ƿ� ǥ��
	String logUrl = ""; // �α���, �α׾ƿ� ���
	boolean login = id != null ? true : false; // �α��� ����
	if(login){ // �α��� �Ǿ� ���� ���, ǥ�õ� ���� ����
		id = id + "��  ";
		logText = "�α׾ƿ�";
		logUrl = "/TTProject/logout.jsp";
	}else{ // �α׾ƿ� ������ ���� ǥ�õ� ���� ����
		id = "";
		logText = "�α���";
		logUrl = "/TTProject/login.html";
	}
%>
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
				<li class="menu1"><a href="/TTProject/productList.jsp?ProdID=1">�ʱ޿� ����</a>
					<div class="content1">
						<a href="/TTProject/product.jsp?ProdID=3">�ڸ���</a> 
						<a href="/TTProject/product.jsp?ProdID=4">�������</a> 
						<a href="/TTProject/product.jsp?ProdID=5">Ƽ��ALC</a>
					</div>
				</li>
				<li class="menu1"><a href="/TTProject/productList.jsp?ProdID=2">��޿� ����</a>
					<div class="content1">
						<a href="/TTProject/product.jsp?ProdID=2">����</a> 
						<a href="/TTProject/product.jsp?ProdID=3">�ڸ���</a> 
						<a href="/TTProject/product.jsp?ProdID=5">Ƽ��ALC</a>
					</div>
				</li>
				<li class="menu1"><a href="/TTProject/productList.jsp?ProdID=3">���� + ����</a>
					<div class="content1">
						<a href="/TTProject/product.jsp?ProdID=3">�ڸ���</a> 
						<a href="/TTProject/product.jsp?ProdID=4">�������</a> 
						<a href="/TTProject/product.jsp?ProdID=5">Ƽ��ALC</a>
					</div>
				</li>
				<li class="menu1"><a href="/TTProject/tempPage.jsp">�α���ǰ</a></li>
				<li class="menu1"><a href="/TTProject/tempPage.jsp">Ź����</a></li>
				<li class="menu1"><a href="/TTProject/tempPage.jsp">�Ƿ�&Ź��ȭ</a></li>
				<li class="menu1"><a href="/TTProject/tempPage.jsp">Ź����</a></li>
			</ul>
		</div>
		<!-- �޴��� ���� -->

		<div id="sidebar">
			<h2>NOTICE</h2>
			<ul class="notices">
				<li>�����ö��� 10/30 �԰�</li>
				<li>TSP ���� ���� ��ݱ� ���</li>
				<li>2018 ���� û�ҳ� Ź����ȸ ����</li>
				<li>�Ż�ǰ Ź��ȭ ���</li>
				<li>Ȧ��ũ 11/5 �԰�</li>
				<li>�����, ���ɷε� ���� ���</li>
				<li>����� ���̺�޴�5 ���</li>
				<li>�Ͻ�Ʈ�� �Ż�ǰ ���</li>
				<li>�Ƶ�ٽ� ũ�������� ����� 12/25 �԰�</li>
			</ul>
		</div>

		<div id="contents1">
			<a href="/TTProject/product.jsp?ProdID=1"><img src="image/mainr1.jpg" width="710px" alt="�����̹���"></a>
		</div>

		<div id="contents2">
			<h3 class="pakage">��õ ��Ű��</h3>
			<div id="box1">
				<a href="/TTProject/product.jsp?ProdID=2"><img src="image/pakage1.PNG" width="450px" alt="�����̹���"></a> 
				<a href="/TTProject/product.jsp?ProdID=3"><img src="image/pakage2.PNG" width="450px" alt="�����̹���"></a>
			</div>
			<div id="box2">
				<a href="/TTProject/product.jsp?ProdID=4"><img src="image/pakage3.PNG" width="450px" alt="�����̹���"></a> 
				<a href="/TTProject/product.jsp?ProdID=5"><img src="image/pakage4.PNG" width="450px" alt="�����̹���"></a>
			</div>
		</div>
	</div>
	<div id="footer">
		<div class="copyright">COPYRIGHT��2018 Cha Hae Wun for
			WebProject. ALL rights reserved.
		<div>��� �̹����� (��)Ź������ �̹����� ������ ���Դϴ�.</div>
		</div>
	</div>
</body>
</html>

