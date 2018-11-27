<%@page contentType="text/html; charset=euc-kr" isErrorPage="true"%>
<%@page import="java.sql.*"%>
<%@page import="java.net.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix= "fmt" uri= "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>구매 에러페이지</title>
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
	margin-left: 360px;
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
		response.setStatus(200);
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
					</div></li>
				<li class="menu1"><a href="/TTProject/productList.jsp?ProdID=1">펜홀더
						라켓</a>
					<div class="content1">
						<a href="/TTProject/product.jsp?ProdID=3">코르벨</a> <a
							href="/TTProject/product.jsp?ProdID=4">프리모락</a> <a
							href="/TTProject/product.jsp?ProdID=5">티모볼ALC</a>
					</div></li>
				<li class="menu1"><a href="#">쉐이크 라켓</a>
					<div class="content1">
						<a href="/TTProject/product.jsp?ProdID=2">제논</a> <a
							href="/TTProject/product.jsp?ProdID=3">코르벨</a> <a
							href="/TTProject/product.jsp?ProdID=5">티모볼ALC</a>
					</div></li>
				<li class="menu1"><a href="#">중국펜 라켓</a>
					<div class="content1">
						<a href="/TTProject/product.jsp?ProdID=3">코르벨</a> <a
							href="/TTProject/product.jsp?ProdID=4">프리모락</a> <a
							href="/TTProject/product.jsp?ProdID=5">티모볼ALC</a>
					</div></li>
				<li class="menu1"><a href="#">탁구러버</a></li>
				<li class="menu1"><a href="#">탁구공</a></li>
				<li class="menu1"><a href="#">의류&탁구화</a></li>
				<li class="menu1"><a href="#">탁구대</a></li>
			</ul>
		</div>
		<!-- 메뉴바 종료 -->

		<div id="title">
			<hr />
			<h3>장바구니에서 구매를 먼저 해주세요</h3>
		</div>

		<div id="mainlist">
			<hr />
			
			<div>
				<form action=mainpage.jsp>
					<div class="btnexp">
						<input class="btn_back" type="submit" value="메인으로 돌아가기">
					</div>
				</form>
			</div>
		</div>

	</div>
	<div id="footer">
		<div class="copyright">COPYRIGHTⓒ2018 Cha Hae Wun for
			WebProject. ALL rights reserved.</div>
	</div>
</body>
</html>