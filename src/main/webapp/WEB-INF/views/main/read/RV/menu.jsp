<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="menuInfo">
		<h5>
			<b>메뉴</b>
		</h5>
		<ul>
			<c:forEach var="SM" items="${SM }">
				<li><span id="chk"><input type="checkbox" price="${SM.price }"></span>
					<p class="l-txt">${SM.mname }</p>
					<p class="r-txt">${SM.price }</p></li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>