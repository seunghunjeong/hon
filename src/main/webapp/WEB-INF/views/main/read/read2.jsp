<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
<title>~~~음식점</title>
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
			<div id="storeReview">
				<h5>리뷰(3)</h5>
				<div class="reviewR">
					<div id="imgBoxR">
						<img src="http://placehold.it/55x55" alt="favor"
							class="img-circle"><br>
						<p>
							2조 <br> <small>★☆☆☆☆</small>
						</p>
					</div>
					<div id="rContentR">
						<small>2019.12.24</small>
						<p>가성비는 좋지않음. 맛은 그럭저럭.</p>
					</div>
				</div>
				<div class="reviewR">
					<div id="imgBoxR">
						<img src="http://placehold.it/55x55" alt="favor"
							class="img-circle"><br>
						<p>
							조장 <br> <small>★☆☆☆☆</small>
						</p>
					</div>
					<div id="rContentR">
						<small>2019.12.24</small>
						<p>그냥 일본가서 사먹는게 나음</p>
					</div>
				</div>
				<div class="reviewR">
					<div id="imgBoxR">
						<img src="http://placehold.it/55x55" alt="favor"
							class="img-circle"><br>
						<p>
							잠만보 <br> <small>★☆☆☆☆</small>
						</p>
					</div>
					<div id="rContentR">
						<small>2019.12.24</small>
						<p>가서 자다옴</p>
					</div>
				</div>
				<div id="moreR">더보기</div>
			</div>
			<div id="storeBlog"><jsp:include page="blog.jsp"></jsp:include></div>
			<div id="storeRecom"><jsp:include page="storeR.jsp"></jsp:include></div>
		</div>
		<jsp:include page="footerR.jsp"></jsp:include>
	</div>
</body>
<script>
	$("#contentR").on('mousewheel DOMMouseScroll', function(e) {
		e.stopPropagation();
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

		if (delta == 120) {
			location.href = "read";
		}
	});

	// 터치 스크롤 이벤트
	var startX, startY, endX, endY;
	$("#page").on('touchstart', function(event) {
		startX = event.originalEvent.changedTouches[0].screenX;
		startY = event.originalEvent.changedTouches[0].screenY;
	});
	$("#page").on('touchend', function(event) {
		endX = event.originalEvent.changedTouches[0].screenX;
		endY = event.originalEvent.changedTouches[0].screenY;
		if (endY - startY > 50) {
			location.href = "read";
		}
	});

	$("#moreR").on("click", function() {
		$("#storeReview").on('mousewheel DOMMouseScroll', function(e) {
			//상위로 이벤트가 전파되지 않도록 중단한다.
			e.stopPropagation();
		});
	});
	$("#btnRV").on("click", function() {
		location.href = "RV";
	});
</script>
</html>