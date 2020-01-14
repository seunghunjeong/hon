<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
<title>혼자 한끼</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- jquery -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--  bootstrap -->
<link rel="stylesheet" href="resources/hon.css">
<!--  css -->
</head>
<body>
	<div id="page">
		<div id="header">

			<jsp:include page="menu.jsp"></jsp:include>
			<!-- 메뉴 -->
			<div id="title">
				<img src="resources/main/title.PNG" width="100%">
			</div>
		</div>
		<jsp:include page="nav.jsp"></jsp:include>
		<div id="content"></div>
		<!-- content  -->
		<script id="temp" type="text/x-handlebars-template">
		<div id="TXT"><h3>오늘의 추천 맛집</h3></div>
		{{#each .}}
			<div class="thumb thumbnail" onClick="location.href='read?sid={{sid}}'">
				<img src="{{simage}}" class="imgTh img-thumbnail">
				<div class="caption">
					<h6 style="line-height:170%"><b>{{sname}}</b><br><small>{{location}}</small></h6>
				</div>
			</div>
		{{/each}}
		</script>
		<!-- <div class="thumb thumbnail">
				<img src="http://placehold.it/100x100" alt="favor"
					class="img-thumbnail">
				<div class="caption">
					<h6>
						음식점 이름 <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div> -->
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- page -->
</body>
<script>
	getListS();
	function getListS() {
		$.ajax({
			type : "get",
			url : "listS.json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#content").html(temp(data));

				$(".imgTh").css("width", "100px");
				$(".imgTh").css("height", "80px");
			}
		});
	}
</script>
</html>