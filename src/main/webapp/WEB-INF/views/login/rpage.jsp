<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
<title>관리자 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
* {
	padding: 0;
	margin: 0;
	position: relative;	
	box-sizing: border-box;
}

body, html {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.wrap {
	width: 100%;
	height: 640px;
	margin: 0 auto;
}

/*root*/
.head {
	width: 100%;
	height: 50px;
	background: #E8B963;
}

.head>h1 {
	margin: 0 auto;
	text-align: center;
	line-height: 50px;
	font-weight: 100;
}

.head>span {
	color: white;
	right: 10px;
	font-size: 18px;
	position: absolute;
	top: 0;
	line-height: 50px;
	cursor: pointer;
}

/*back*/
.section1 {
	width: 100%;
	height: 120px;
	display: flex;
	align-items: center;
}

.section1>span {
	width: 100%;
	line-height: 120px;
	position: absolute;
	top: 0;
	font-size: 18px;
	transform: rotateY(180deg);
	left: -330px;
	cursor: pointer;
}

/*AD*/
.section2 {
	width: 100%;
	height: 80px;
	background: #d2d2d2;
}

.section2>p {
	width: 100%;
	line-height: 80px;
	position: absolute;
	top: 0;
	left: 30px;
}

/*user & CEO*/
.section3 {
	width: 100%;
	height: 150px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-bottom: 3px solid #d2d2d2;
}

.section3>div {
	width: 40%;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}

.section3>div>div {
	width: 100%;
	height: 40px;
	background: darkred;
	display: flex;
	align-items: center;
	justify-content: center;
}

.section3 .user>div {
	color: white;
	border-radius: 10px 0px 0px 10px;
	cursor: pointer;
}

.section3 .ceo>div {
	color: white;
	border-radius: 0px 10px 10px 0px;
	cursor: pointer;
}

.section3>div>div>span {
	line-height: 30px;
}

.section3 .user p {
	margin: 0;
	cursor: pointer;
}

.section3 .ceo p {
	margin: 0;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="wrap">
		<header class="head">
		<h1>root</h1>
		<span class="glyphicon glyphicon-cog" aria-hidden="true"></span> </header>
		<section class="section section1"> <span
			class="glyphicon glyphicon-share-alt" aria-hidden="true"></span> </section>
		<section class="section section2">
		<p>AD</p>
		</section>
		<section class="section section3">
		<div class="user">
			<div>
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
			</div>
			<p>User</p>
		</div>
		<div class="ceo">
			<div>
				<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			</div>
			<p>CEO</p>
		</div>
		</section>
	</div>
</body>
</html>