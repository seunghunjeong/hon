<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/hon.css">
</head>
<body>
	<div id="nav">
		<div id="navF">
			<c:if test="${uid != null}">
				<script>
					$("#navF").css('width', '780px');
				</script>
				<div class="favor">
					<img src="http://placehold.it/60x60" alt="favor" class="img-circle">
					<br> <small>음식점 이름</small> <br> 안녕
				</div>
				<div class="favor">
					<img src="http://placehold.it/60x60" alt="favor" class="img-circle">
					<br> <small>음식점 이름</small>
				</div>
				<div class="favor">
					<img src="http://placehold.it/60x60" alt="favor" class="img-circle">
					<br> <small>음식점 이름</small>
				</div>
				<div class="favor">
					<img src="http://placehold.it/60x60" alt="favor" class="img-circle">
					<br> <small>음식점 이름</small>
				</div>
				<div class="favor">
					<img src="http://placehold.it/60x60" alt="favor" class="img-circle">
					<br> <small>음식점 이름</small>
				</div>
				<div class="favor">
					<img src="http://placehold.it/60x60" alt="favor" class="img-circle">
					<br> <small>음식점 이름</small>
				</div>
				<div class="favor">
					<img src="http://placehold.it/60x60" alt="favor" class="img-circle">
					<br> <small>음식점 이름</small>
				</div>
				<div class="favor">
					<img src="http://placehold.it/60x60" alt="favor" class="img-circle">
					<br> <small>음식점 이름</small>
				</div>
				<div class="favor">
					<img src="http://placehold.it/60x60" alt="favor" class="img-circle">
					<br> <small>음식점 이름</small>
				</div>
				<div class="favor">
					<img src="http://placehold.it/60x60" alt="favor" class="img-circle">
					<br> <small>음식점 이름</small>
				</div>
			</c:if>
			<c:if test="${uid == null}">
				<script>
					$("#navF").css('overflow', 'hidden');
				</script>
				<div id="welcome">
					<h3>좋아요한 맛집</h3>
					로그인 하시고 맛집을 추가해보세요!
				</div>
			</c:if>
		</div>
	</div>
	<!-- nav -->
</body>
<script>
	// 스크롤 상하를 좌우로 바꾸기

	$("#nav").on('mousewheel', function(e) {
		e.preventDefault();
		var wheelDelta = e.originalEvent.wheelDelta;

		if (wheelDelta > 0) {

			console.log("up");

			$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());

		} else {

			console.log("down");

			$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());

		}

	});
</script>
</html>