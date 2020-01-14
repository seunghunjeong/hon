<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
<title>혼자 한끼</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- jquery -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--  bootstrap -->
<link rel="stylesheet" href="../resources/honMY.css">
<!--  css -->
</head>
<body>
	<div id="page">
		<div id="title">
			<a href="mainPage"><img id="logo"
				src="resources/main/logo2.png" width=40></a> <span
				id="titleTXT">회원 탈퇴</span>
		</div>
		<div id="contentU">
			<div id="termsDR">탈퇴하십니까?</div>
			<div id="agreeDR">
				<div id="drL">
					<input type="radio" name="agU">동의
				</div>
				<div id="drR">
					<input type="radio" name="agU">미동의
				</div>
			</div>
			<div id="dropPW">
				비밀번호 : <input type="password">
			</div>
			<div id="dropBtn">
				<button class="btn btn-primary">탈퇴하기</button>
			</div>
		</div>
	</div>
</body>
</html>