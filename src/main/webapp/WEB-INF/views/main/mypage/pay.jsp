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
			<a href="mainPage"><img id="logo" src="resources/main/logo2.png"
				width=40></a> <span id="titleTXT">결제내역</span>
		</div>
		<div id="contentU">
			<div class="boxB">
				<img class="imgB" src="https://t1.daumcdn.net/cfile/tistory/99D3F2375A8A835A2F"
					class="img-rounded" align="middle" width="70px" height="70px">
				<div class="txtB">
					구월동 고베 규카츠 <br> <small>29000원<br> 인천시 남동구 구월동
						1463 | 032-508-0555 <br>2020.01.17
					</small>
				</div>
				<span id="removeB" class="glyphicon glyphicon-remove"
					aria-hidden="true"></span>
			</div>
		</div>
	</div>
</body>
<script>
	$("#")

	$("#removeB").on("click", function() {
		alert("삭제");
	});
</script>
</html>