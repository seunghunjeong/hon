<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="footerR">
		<div id="btnR">
			<div id="btnCall" class="btnBoxR">전화</div>
			<div id="btnRV" class="btnBoxR">예약</div>
		</div>
	</div>
</body>

<script>
	$("#btnCall").on("click", function() {
		location.href = 'tel:' + phone;
	});
</script>
</html>