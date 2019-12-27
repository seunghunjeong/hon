<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>~~~음식점</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--  bootstrap -->
<link rel="stylesheet" href="../resources/hon.css">
<!--  css -->
</head>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="../menu.jsp"></jsp:include>
			<!-- 메뉴 -->
		</div>
		<!-- header -->
		<div id="contentR">
			<div id="storeImg">
				<img src="../resources/main/read/gobe1.jpg"> <img
					src="../resources/main/read/gobe2.jpg"> <img
					src="../resources/main/read/gobe3.jpg"> <img
					src="../resources/main/read/gobe4.jpg">
				<div id="imgMenu">
					<div id="menuTXT">메뉴</div>
				</div>
			</div>
			<div id="storeInfo">
				<span id="storeName">고베 규카츠</span> <span
					class="glyphicon glyphicon-pencil" aria-hidden="true"></span> <span
					class="glyphicon glyphicon-star-empty" aria-hidden="true"></span><br>
				<table>
					<tr>
						<th>주소</th>
						<td>|</td>
						<td>인천시 남동구 구월동</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>|</td>
						<td>032-508-0555</td>
					</tr>
					<tr>
						<th>음식종류</th>
						<td>|</td>
						<td>고기</td>
					</tr>
					<tr>
						<th>가격대</th>
						<td>|</td>
						<td>15,000원 - 20,000원</td>
					</tr>
					<tr>
						<th>영업시간</th>
						<td>|</td>
						<td>매일. 오전 11시 30분 - 오후 10시</td>
					</tr>
				</table>
			</div>
			<div id="storeMap">
				<jsp:include page="map.jsp"></jsp:include>
			</div>
		</div>
		<jsp:include page="footerR.jsp"></jsp:include>
	</div>
	<jsp:include page="dPage.jsp"></jsp:include>
</body>
<script>
	$("#contentR").on('mousewheel DOMMouseScroll', function(e) {
		// html, body 에 마우스 휠 이벤트와 돔마우스스크롤 이벤트를 걸었습니다.
		var E = e.originalEvent;
		// 변수 E 에다가는 이벤트 객체의 속성으로 사용할 수 있는 속성 인 originalEvent 를 넣었습니다.
		delta = 0;
		// 변수 delta 에다가는 숫자 자료형 0 을 넣어 두었습니다.
		if (E.detail) {
			// 이 조건에서는 e.originalEvent 의 속성으로 detail 가 있다면 입니다.
			// 익스, 크롬 등은 e.originalEvent 에 detail 의 속성이 없으나,
			// 파이어 폭스 일 경우엔 detail 속성이 있습니다.
			// 그래서 이 조건을 실행 시킵니다.
			delta = E.detail * -40;
			// 이렇게 해주는 이유는 detail 의 값이 익스와 크롬과는 다르게 3 이 찍힙니다.
			// 익스, 크롬은 120 이 찍히죠.
			// 익스, 크롬과 동일하게 해주기 위해서 이렇게 해줍니다.
		} else {
			// 이곳에서는 익스, 크롬의 e.originalEvent 의 속성으로 wheelDelta 를 사용할 수 있습니다.
			delta = E.wheelDelta;
		}

		if (delta == -120) {
			location.href = "read2";
		}
	});

	$("#storeImg").on("click", function() {
		$("#dPage").show();
	});

	$("#imgMenu").on("click", function(e) {
		e.stopPropagation();
		alert("메뉴");
	});
	
	$("#btnRV").on("click",function(){
		location.href="RV";
	});
</script>
</html>