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
<link rel="stylesheet" href="resources/honMY.css">
<!--  css -->
</head>
<body>
	<div id="page">
		<div id="title">
			<a href="mainPage"><img id="logo"
				src="resources/main/logo2.png" width=40></a>
			<div id="titleTXT">마이혼끼</div>
		</div>
		<div id="info">
			<img src="http://placehold.it/60x60" alt="favor" class="img-circle"
				align="middle"> <small>닉네임</small> <span class="enter">></span>
		</div>
		<div id="nav">
			<div id="userReview" class=boxN>
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span><br>
				내 리뷰
			</div>
			<div id="bookMark" class=boxN>
				<span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span><br>
				관심매장
			</div>
			<div id="pay" class=boxN>
				<span><img src="resources/mypage/won.png" width="17px" /></span><br>
				결제내역
			</div>
		</div>
		<div id="contentMY">
			<div class="fontR">예약내역</div>
			<div id="boxV">
				<div class="boxR">
					<img class="imgB" src="http://placehold.it/70x70" align="middle">
					<div class="txtB">
						구월동 고베 규카츠 <br> <small>1000원<br> 인천시 구월동 |
							032-0000-0000 <br>2019.12.24
						</small>
					</div>
					<span id="removeB" class="glyphicon glyphicon-remove"
						aria-hidden="true"></span>
				</div>
				<div class="boxR">
					<img class="imgB" src="http://placehold.it/70x70" align="middle">
					<div class="txtB">
						구월동 고베 규카츠 <br> <small>1000원<br> 인천시 구월동 |
							032-0000-0000 <br>2019.12.24
						</small>
					</div>
					<span id="removeB" class="glyphicon glyphicon-remove"
						aria-hidden="true"></span>
				</div>
				<div class="boxR">
					<img class="imgB" src="http://placehold.it/70x70" align="middle">
					<div class="txtB">
						구월동 고베 규카츠 <br> <small>1000원<br> 인천시 구월동 |
							032-0000-0000 <br>2019.12.24
						</small>
					</div>
					<span id="removeB" class="glyphicon glyphicon-remove"
						aria-hidden="true"></span>
				</div>
			</div>
			<div id="notice" class="boxM">
				<span class="fontM">공지사항</span><span class="enter">></span>
			</div>
			<div id="customerCenter" class="boxM">
				<span class="fontM">고객센터</span><span class="enter">></span>
			</div>
			<div id="logout" class="boxM">
				<span class="fontM">로그아웃</span><span class="enter">></span>
			</div>
			<div id="userDrop" class="boxM">
				<span class="fontM">회원탈퇴</span><span class="enter">></span>
			</div>
		</div>
	</div>
</body>
<script>
	$("#userReview").on("click", function() {
		location.href = "userReview";
	});

	$("#bookMark").on("click", function() {
		location.href = "bookMark";
	});

	$("#pay").on("click", function() {
		location.href = "pay";
	});

	$("#notice").on("click", function() {
		location.href = "notice";
	});

	$("#customerCenter").on("click", function() {
		location.href = "customerCenter";
	});

	$("#logout").on("click", function() {
		alert("로그아웃 하시겠습니까?");
	});

	$("#userDrop").on("click", function() {
		location.href = "userDrop";
	});
</script>
</html>