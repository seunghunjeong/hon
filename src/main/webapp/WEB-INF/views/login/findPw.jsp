<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
<title>비밀번호 찾기</title>
<link
	href="${pageContext.request.contextPath}/resources/login.css?after"
	rel="stylesheet" />
</head>
<body>
	<div class="wrap">
		<header class="head">
		<p onClick="location.href='login'">로그인</p>
		<p>회원가입</p>
		</header>
		<section>
		<div class="id_btn">
			<input class="id" type="text" placeholder="이메일 아이디 입력">
		</div>
		<ul class="text">
			<li>&#8226;입력하신 이메일 주소로 비밀번호 재설정 메일이 발송됩니다.</li>
			<li>&#8226;소셜 계정 회원은 비밀번호 찾기가 불가능합니다.</li>
		</ul>
		<div class="e_btn">
			<button type="submit">이메일 발송</button>
		</div>
		</section>
		<footer>
		<ul>
			<li><a href="login">로그인</a><span></span></li>
			<li><a href="#">고객만족센터</a><span></span></li>
			<li><a href="#">회사소개</a><span></span></li>
			<li><a href="#">입점문의</a><span></span></li>
			<li><a href="#">APP설치</a><span></span></li>
			<li><a href="#">공지사항</a></li>
		</ul>
		</footer>
	</div>
</body>
</html>