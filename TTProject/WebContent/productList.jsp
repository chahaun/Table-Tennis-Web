<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*"%>
<%@taglib prefix= "fmt" uri= "http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>상품 목록 보기</title>
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
		HttpSession sessionGet = request.getSession(); // session이 존재하면 해당 session을 리턴(존재하지 않으면 새롭게 session 생성)
		// getAttribute() 메서드는 Object 를 리턴하므로 String 으로 형변환을 해주어야 한다.
		String id = (String) sessionGet.getAttribute("sessionId"); // name 이 sessionId 의 value 값 리턴
		String logText = ""; // 로그인, 로그아웃 표시
		String logUrl = ""; // 로그인, 로그아웃 경로
		boolean login = id != null ? true : false; // 로그인 여부
		if (login) { // 로그인 되어 있을 경우, 표시될 내용 설정
			id = id + "님  ";
			logText = "로그아웃";
			logUrl = "/TTProject/logout.jsp";
		} else { // 로그아웃 상태일 때의 표시될 내용 설정
			id = "";
			logText = "로그인";
			logUrl = "/TTProject/login.html";
		}

		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC", "root", "1234");
			if (conn == null)
				out.println("연결불가<BR>");
			stmt = conn.createStatement(); // statement 객체호출
			ResultSet rs = stmt.executeQuery("select * from product");
			String prod_id = request.getParameter("ProdID");
			int pid = Integer.parseInt(prod_id);
			while (rs.next()) {
				if (rs.getInt("prod_ID") == pid) {
					String productName = rs.getString("prod_Name");
					int prodectPrice = rs.getInt("prod_Price");
					int prodectPrice2 = rs.getInt("prod_Price2");
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
	<!-- 헤더 시작 -->
	<div id="container">
		<table width="100%" border="0">
			<tr>
				<td height="20" border="0">
					<table width="960px">
						<tr>
							<td align="right">
							<%=id %><a href=<%=logUrl %>><%=logText %></a>
								 | <a href="/TTProject/registration.html">회원가입</a> 
								 | <a href="/TTProject/bucket.jsp">장바구니</a> 
								 | <a href="/TTProject/purchase.jsp">주문/배송조회</a>
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
		<!-- 헤더 종료 -->

		<!-- 메뉴바 시작 -->
		<div id="menuBar">
			<ul class="navi">
				<li class="menu1"><a href="#">홈페이지 소개</a>
					<div class="content1">
						<a href="/TTProject/notice.html">공지사항</a>
					</div>
				</li>
				<li class="menu1"><a href="/TTProject/productList.jsp?ProdID=1">초급용 라켓</a>
					<div class="content1">
						<a href="/TTProject/product.jsp?ProdID=3">코르벨</a> 
						<a href="/TTProject/product.jsp?ProdID=4">프리모락</a> 
						<a href="/TTProject/product.jsp?ProdID=5">티모볼ALC</a>
					</div>
				</li>
				<li class="menu1"><a href="/TTProject/productList.jsp?ProdID=2">고급용 라켓</a>
					<div class="content1">
						<a href="/TTProject/product.jsp?ProdID=2">제논</a> 
						<a href="/TTProject/product.jsp?ProdID=3">코르벨</a> 
						<a href="/TTProject/product.jsp?ProdID=5">티모볼ALC</a>
					</div>
				</li>
				<li class="menu1"><a href="/TTProject/productList.jsp?ProdID=3">러버 + 라켓</a>
					<div class="content1">
						<a href="/TTProject/product.jsp?ProdID=3">코르벨</a> 
						<a href="/TTProject/product.jsp?ProdID=4">프리모락</a> 
						<a href="/TTProject/product.jsp?ProdID=5">티모볼ALC</a>
					</div>
				</li>
				<li class="menu1"><a href="/TTProject/tempPage.jsp">인기제품</a></li>
				<li class="menu1"><a href="/TTProject/tempPage.jsp">탁구공</a></li>
				<li class="menu1"><a href="/TTProject/tempPage.jsp">의류&탁구화</a></li>
				<li class="menu1"><a href="/TTProject/tempPage.jsp">탁구대</a></li>
			</ul>
		</div>
		<!-- 메뉴바 종료 -->
		
		<div id="contents1">
			<table class="table1" cellpadding=10>
				<tr>
					<td><a href="/TTProject/product.jsp?ProdID=1"><img src="<%=e1%>" width="200px" alt="라켓이미지"></a></td>
					<td>
						<a href="/TTProject/product.jsp?ProdID=1"><b>코쿠타구 제논 로제나 세트</b></a><br><br>
						169,000원 <br><br>
						배송비 2,500원 <br> <br> <br> <br> 
						구매 24<br>
					</td>
				</tr>
				<tr>
					<td><a href="/TTProject/product.jsp?ProdID=1"><img src="<%=e2%>" width="200px" alt="라켓이미지"></a></td>
					<td>
						<a href="/TTProject/product.jsp?ProdID=1"><b>Kokutaku Zenon</b></a><br><br>
						169,000원 <br><br>
						배송비 2,500원 <br> <br> <br> <br>
						구매 4<br>
					</td>
				</tr>
				<tr>
					<td><a href="/TTProject/product.jsp?ProdID=1"><img src="<%=e3%>" width="200px" alt="라켓이미지"></a></td>
					<td>
						<a href="/TTProject/product.jsp?ProdID=1"><b>Shake Table Tenis Racket</b></a><br><br>
						145,000원 <br><br>
						배송비 무료배송 <br> <br> <br> <br>
						구매 11<br>
					</td>
				</tr>
				<tr>
					<td><a href="/TTProject/product.jsp?ProdID=1"><img src="<%=e4%>" width="200px" alt="라켓이미지"></a></td>
					<td>
						<a href="/TTProject/product.jsp?ProdID=1"><b>Kokutaku Rozena</b></a><br><br>
						112,000원 <br><br>
						배송비 2,500원 <br> <br> <br> <br>
						구매 21<br>
					</td>
				</tr>
				<tr>
					<td><a href="/TTProject/product.jsp?ProdID=1"><img src="<%=e5%>" width="200px" alt="라켓이미지"></a></td>
					<td>
						<a href="/TTProject/product.jsp?ProdID=1"><b>코쿠타구 제논 로제나 세트</b></a><br><br>
						285,000원 <br><br>
						배송비 2,500원 <br> <br> <br> <br>
						구매 78<br>
					</td>
				</tr>
				<tr>
					<td><a href="/TTProject/product.jsp?ProdID=1"><img src="<%=e6%>" width="200px" alt="라켓이미지"></a></td>
					<td>
						<a href="/TTProject/product.jsp?ProdID=1"><b>코쿠타구 제논 로제나 세트</b></a><br><br>
						368,000원 <br><br>
						배송비 2,500원 <br> <br> <br> <br>
						구매 54<br>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="footer">
		<div class="copyright">COPYRIGHTⓒ2018 Cha Hae Wun for
			WebProject. ALL rights reserved.</div>
	</div>
</body>
</html>

