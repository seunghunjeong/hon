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
				src="../resources/main/logo2.png" width=40></a> <span
				id="titleTXT">결제내역</span>
		</div>
		<div id="contentU">
			<div class="boxB">
				<div class="imgBoxR">
					<img src="http://placehold.it/55x55" alt="favor" class="img-circle"><br>
					<p>
						규카츠 외 <br> <small>★☆☆☆☆</small>
					</p>
				</div>
				<div class="rContentR">
					<small>2019.12.24</small>
					<p>가서 자다옴</p>
				</div>
			</div>
			<div class="boxB">
				<div class="imgBoxR">
					<img src="http://placehold.it/55x55" alt="favor" class="img-circle"><br>
					<p>
						규카츠 외 <br> <small>★☆☆☆☆</small>
					</p>
				</div>
				<div class="rContentR">
					<small>2019.12.24</small>
					<p>가서 자다옴</p>
				</div>
			</div>
			<div class="boxB">
				<div class="imgBoxR">
					<img src="http://placehold.it/55x55" alt="favor" class="img-circle"><br>
					<p>
						규카츠 외 <br> <small>★☆☆☆☆</small>
					</p>
				</div>
				<div class="rContentR">
					<small>2019.12.24</small>
					<p>가서 자다옴</p>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$("#removeB").on("click", function() {
		alert("삭제");
	});
</script>
</html>