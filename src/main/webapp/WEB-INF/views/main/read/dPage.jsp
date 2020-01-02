<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>more</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--  bootstrap -->
<link rel="stylesheet" href="resources/hon.css">
<!--  css -->
</head>
<body>
	<div id="dPage">
		<div id="dBox">
			<div id="nameB">구월동 고베 규카츠</div>
			<div id="close">
				<span id="x" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
			</div>
		</div>
		<div id="imgBox">
			<div id="imgB">
				<img src="resources/main/read/gobe1.jpg">
			</div>
		</div>
	</div>
</body>
<script>
	// 닫기
	$("#close").on("click", function(e) {
		e.stopPropagation();
		$("#dPage").hide();
	});

	$("#dPage").on("click", function() {
		$("#dPage").hide();
	});

	$("#imgBox").on("click", function(e) {
		e.stopPropagation();
	});
</script>
</html>