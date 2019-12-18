<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>혼자 한끼</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
#page {
	width: 360px;
	height: 640px;
	background: gray;
}

#header {
	width: 360px;
	height: 110px;
	background: green;
}

#menu {
	width: 360px;
	height: 40px;
	text-align: center;
}

#title {
	width: 360px;
	height: 70px;
	background: yellow;
	color: white;
}

#nav {
	width: 360px;
	height: 100px;
	background: red;
}

#content {
	width: 360px;
	height: 430px;
	background: blue;
}

#login {
	
}
</style>
</head>
<body>
	<div id="page">
		<div id="header">
			<div id="menu">
				<img src="resources/logo.png" width=40> <input type="text"
					style="width: 100px">
				<button id="login" type="button" class="btn btn-primary"
					style="float: right">로그인</button>
			</div>
			<div id="title">
				<img src="resources/title2.jpg">
			</div>

		</div>
		<div id="nav">
			즐겨찾기한 음식점 <br> <img src="http://placehold.it/60x60" alt="favor"
				class="img-circle"> <img src="http://placehold.it/60x60"
				alt="favor" class="img-circle"> <img
				src="http://placehold.it/60x60" alt="favor" class="img-circle">
			<img src="http://placehold.it/60x60" alt="favor" class="img-circle">
		</div>
		<div id="content">
			<img src="http://placehold.it/100x100" alt="favor"
				class="img-thumbnail"> <img src="http://placehold.it/100x100"
				alt="favor" class="img-thumbnail"> <img
				src="http://placehold.it/100x100" alt="favor" class="img-thumbnail">
			<img src="http://placehold.it/100x100" alt="favor"
				class="img-thumbnail"> <img src="http://placehold.it/100x100"
				alt="favor" class="img-thumbnail"> <img
				src="http://placehold.it/100x100" alt="favor" class="img-thumbnail">
			<img src="http://placehold.it/100x100" alt="favor"
				class="img-thumbnail"> <img src="http://placehold.it/100x100"
				alt="favor" class="img-thumbnail">
		</div>
	</div>
</body>
</html>