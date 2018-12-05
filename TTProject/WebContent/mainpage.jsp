<%@page contentType="text/html; charset=euc-kr"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>#탁구용품 쇼핑몰 PingPong Market#</title>
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
	HttpSession sessionGet =request.getSession(); // session이 존재하면 해당 session을 리턴(존재하지 않으면 새롭게 session 생성)
	// getAttribute() 메서드는 Object 를 리턴하므로 String 으로 형변환을 해주어야 한다.
	String id = (String)sessionGet.getAttribute("sessionId"); // name 이 sessionId 의 value 값 리턴
	String logText = ""; // 로그인, 로그아웃 표시
	String logUrl = ""; // 로그인, 로그아웃 경로
	boolean login = id != null ? true : false; // 로그인 여부
	if(login){ // 로그인 되어 있을 경우, 표시될 내용 설정
		id = id + "님  ";
		logText = "로그아웃";
		logUrl = "/TTProject/logout.jsp";
	}else{ // 로그아웃 상태일 때의 표시될 내용 설정
		id = "";
		logText = "로그인";
		logUrl = "/TTProject/login.html";
	}
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

		<div id="sidebar">
			<h2>NOTICE</h2>
			<ul class="notices">
				<li>버터플라이 10/30 입고</li>
				<li>TSP 러버 내년 상반기 출시</li>
				<li>2018 전국 청소년 탁구대회 모집</li>
				<li>신상품 탁구화 출고</li>
				<li>홀마크 11/5 입고</li>
				<li>미즈노, 스핀로드 러버 출시</li>
				<li>미즈노 웨이브메달5 출시</li>
				<li>암스트롱 신상품 출시</li>
				<li>아디다스 크리스마스 에디션 12/25 입고</li>
			</ul>
		</div>

		<div id="contents1">
			<a href="/TTProject/product.jsp?ProdID=1"><img src="image/mainr1.jpg" width="710px" alt="라켓이미지"></a>
		</div>

		<div id="contents2">
			<h3 class="pakage">추천 패키지</h3>
			<div id="box1">
				<a href="/TTProject/product.jsp?ProdID=2"><img src="image/pakage1.PNG" width="450px" alt="라켓이미지"></a> 
				<a href="/TTProject/product.jsp?ProdID=3"><img src="image/pakage2.PNG" width="450px" alt="라켓이미지"></a>
			</div>
			<div id="box2">
				<a href="/TTProject/product.jsp?ProdID=4"><img src="image/pakage3.PNG" width="450px" alt="라켓이미지"></a> 
				<a href="/TTProject/product.jsp?ProdID=5"><img src="image/pakage4.PNG" width="450px" alt="라켓이미지"></a>
			</div>
		</div>
	</div>
	<div id="footer">
		<div class="copyright">COPYRIGHTⓒ2018 Cha Hae Wun for
			WebProject. ALL rights reserved.
		<div>상기 이미지는 (주)탁구존의 이미지를 가져온 것입니다.</div>
		</div>
	</div>
</body>
</html>

