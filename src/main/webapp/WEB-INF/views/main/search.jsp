<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
<title>?? 검색 결과</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/hon.css">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="menu.jsp"></jsp:include>
			<!-- 메뉴 -->
			<div id="searchInfo">
				???? 검색결과
				<button id="btnFilter" type="button" class="btn btn-default btn-xs"
					style="float: right">
					<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span><b>
						필터</b>
				</button>
			</div>
		</div>
		<!-- header -->
		<div id="search">
			<div class="thumb thumbnail">
				<a href="read"><img src="http://placehold.it/100x100"
					alt="favor" class="img-thumbnail"></a>
				<div class="caption">
					<h6>
						음식점 이름 <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div>
			<div class="thumb thumbnail">
				<img src="http://placehold.it/100x100" alt="favor"
					class="img-thumbnail">
				<div class="caption">
					<h6>
						음식점 이름 <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div>
			<div class="thumb thumbnail">
				<img src="http://placehold.it/100x100" alt="favor"
					class="img-thumbnail">
				<div class="caption">
					<h6>
						음식점 이름 <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div>
			<div class="thumb thumbnail">
				<img src="http://placehold.it/100x100" alt="favor"
					class="img-thumbnail">
				<div class="caption">
					<h6>
						음식점 이름 <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div>
			<div class="thumb thumbnail">
				<img src="http://placehold.it/100x100" alt="favor"
					class="img-thumbnail">
				<div class="caption">
					<h6>
						음식점 이름 <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div>
			<div class="thumb thumbnail">
				<img src="http://placehold.it/100x100" alt="favor"
					class="img-thumbnail">
				<div class="caption">
					<h6>
						음식점 이름 <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div>
			<div class="thumb thumbnail">
				<img src="http://placehold.it/100x100" alt="favor"
					class="img-thumbnail">
				<div class="caption">
					<h6>
						음식점 이름 <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div>
			<div class="thumb thumbnail">
				<img src="http://placehold.it/100x100" alt="favor"
					class="img-thumbnail">
				<div class="caption">
					<h6>
						음식점 이름 <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div>
			<div class="thumb thumbnail">
				<img src="http://placehold.it/100x100" alt="favor"
					class="img-thumbnail">
				<div class="caption">
					<h6>
						음식점 이름 <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div>
			<div class="thumb thumbnail">
				<img src="http://placehold.it/100x100" alt="favor"
					class="img-thumbnail">
				<div class="caption">
					<h6>
						음식점 이름 <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div>
			<div class="thumb thumbnail">
				<img src="http://placehold.it/100x100" alt="favor"
					class="img-thumbnail">
				<div class="caption">
					<h6>
						음식점 이름 <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div>
			<div class="thumb thumbnail">
				<img src="http://placehold.it/100x100" alt="favor"
					class="img-thumbnail">
				<div class="caption">
					<h6>
						음식점 이름 <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div>
			<!-- 페이지네이션 -->
			<div style="text-align: center;">
				<ul class="pagination">
					<li class="disabled"><span> <span aria-hidden="true">&laquo;</span>
					</span></li>
					<li class="active"><span>1 <span class="sr-only">(current)</span></span>
					</li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</div>
		</div>
		<!-- search  -->

		<!-- 필터 창 -->
		<div id="dBack" class="bbox">
			<div id="lBox">
				<div id="sort1">
					<img src="resources/main/search/snowmanTXT.png" width="40px" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
						src="resources/main/search/ageTXT.png" width="40px" />
				</div>
				<div id="sort2">
					지역별 <img src="resources/main/search/임시.png" width="280px"
						height="100px">
				</div>
				<div id="sort3">
					가격별 <br> <img src="resources/main/search/price/0.png"
						width="60px"> <img
						src="resources/main/search/price/1.png" width="60px"> <img
						src="resources/main/search/price/2.png" width="60px"> <img
						src="resources/main/search/price/3.png" width="60px">
				</div>
				<div id="sort4">
					혼밥 난이도 <br> <img src="resources/main/search/lv/lv1.png"
						width="70px"> <img src="resources/main/search/lv/lv2.png"
						width="70px"> <img src="resources/main/search/lv/lv3.png"
						width="70px"><br> <img
						src="resources/main/search/lv/lv4.png" width="70px"> <img
						src="resources/main/search/lv/lv5.png" width="70px"> <img
						src="resources/main/search/lv/lv6.png" width="70px"><br>
					<img src="resources/main/search/lv/lv7.png" width="70px">
					<img src="resources/main/search/lv/lv8.png" width="70px">
					<img src="resources/main/search/lv/lv9.png" width="70px">
				</div>
				<div id="btnS">
					<div id="btnClose" class="btnBox">닫기</div>
					<div id="btnApply" class="btnBox">적용</div>
				</div>
			</div>
		</div>
	</div>
	<!-- page -->
</body>
<script>
	// 필터창
	$("#btnFilter").on("click", function() {
		$("#dBack").show();
		$("#page").bind('touchmove', function(e) {
			e.preventDefault()
		});
		
		$("#lBox").bind('touchmove', function(e) {
			e.stopPropagation();
			$("body").css('overflow','hidden');
			$("#dBack").css('overflow','hidden');
		});
	});

	// 닫기
	$("#btnClose").on("click", function() {
		$("#dBack").hide();
		$("#page").unbind('touchmove');
		$("body").css('overflow','auto');
		$("#dBack").css('overflow','auto');
	});

	// 어두운 부분 클릭하면 닫기
	$('#dBack').click(function(e) {
		if ($(e.target).hasClass("bbox")) {
			$("#dBack").hide();
			$("#page").unbind('touchmove');
			$("body").css('overflow','auto');
			$("#dBack").css('overflow','auto');
		}
	});
</script>
</html>