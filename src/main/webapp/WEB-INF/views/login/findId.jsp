<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
	<title>아이디 찾기</title>
	<link href="${pageContext.request.contextPath}/resources/login.css?after"
	rel="stylesheet" />
</head>
<body>
	<div class="wrap">
        <header class="head">
            <p onclick="location.href='login'">로그인</p>
            <p>회원가입</p>
        </header>
        <section>
            <div class="id_btn">
                <input class="id id1" type="text" placeholder="(필수)휴대폰 전화번호 입력(-제외)">
            </div>
            <div class="id_btn2">
                <input class="id id2" type="text" placeholder="인증번호 입력">
            </div>
            <ul class="text">
                <li>인증번호가 도착하지 않았을 경우 '인증'버튼을 다시 눌러주세요.</li>
            </ul>
            <div class="e_btn">
                <button type="submit">아이디 찾기</button>
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