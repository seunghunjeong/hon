<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<div id="menu">
		<a href="mainPage"><img id="logo" src="resources/main/logo2.png"
			width=40></a>
		<div id="inputbox" class="input-group">
			<input type="text" id="keyword" class="form-control"> <span
				class="input-group-btn" style="float: left;">
				<button id="btnSearch" class="btn btn-default" type="button">검색</button>
			</span>
		</div>
		<!-- /input-group -->

		<c:if test="${uid != null}">
			<button onClick="location.href='logout'" class="btn btn-primary" id="login">로그아웃</button>
		<a href="myPage">${uid}</a>		<!-- 썸네일로 바꾸기 -->
	</c:if>
		<c:if test="${uid == null}">
		<button id="login" type="button" class="btn btn-primary" onClick="location.href='login'">로그인</button>
		</c:if>
	</div>
</body>
<script type="text/javascript">
	$("#btnSearch").on("click", function() {
		location.href = "search";
	});
</script>
</html>