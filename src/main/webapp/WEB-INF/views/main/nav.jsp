<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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