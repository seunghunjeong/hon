<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<div id="menu">
		<a href="mainPage"><img id="logo"
			src="../resources/main/logo2.png" width=40></a>
		<div style="width: 20px; float: left;">&nbsp;</div>

		<div id="inputbox" class="input-group" style="float: left;">
			<input type="text" class="form-control" style="width: 150px">
			<span class="input-group-btn" style="float: left;">
				<button id="btnSearch" class="btn btn-default" type="button">검색</button>
			</span>
		</div>
		<!-- /input-group -->


		<button id="login" type="button" class="btn btn-primary">로그인</button>
	</div>
</body>
<script type="text/javascript">
	$("#btnSearch").on("click", function() {
		location.href = "search";
	});
</script>
</html>