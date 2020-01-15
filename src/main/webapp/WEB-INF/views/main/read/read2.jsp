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
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--  bootstrap -->
<link rel="stylesheet" href="resources/hon.css">
<!--  css -->
</head>
<body>
	<div id="">
		<%-- <div id="header">
			<jsp:include page="../menu.jsp"></jsp:include>
			<!-- 메뉴 -->
		</div>
		<!-- header --> --%>
		<div id="null">
			<div id="storeReview">
				<h5 id="Rps0">리뷰 ${RpsTOT }</h5>
				<div class="reviewRps"></div>
				<script id="tempRps" type="text/x-handlebars-template">
					{{#each .}}
					<div class="reviewR">
						<div id="imgBoxR">
						<img src="{{image}}" class="img-circle" width="60px"><br>
						<p> {{nick}} <br> <small>평점 : {{score}}</small></p>
						</div>
						<div id="rContentR">
						<small>{{regidate}}
						<p>{{retext}}</p>
						</div>
					</div>
					{{/each}}
				</script>
				<div id="moreR"></div>
			</div>
			<div id="storeBlog"><jsp:include page="blog.jsp"></jsp:include></div>
			<div id="storeRecom"><jsp:include page="storeR.jsp"></jsp:include></div>
		</div>
		<jsp:include page="footerR.jsp"></jsp:include>
	</div>
</body>
<script>
	var page = 0;
	var rps = "${RpsTOT }";
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
			location.href = "read?sid=" + sid;
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
			location.href = "read?sid=" + sid;
		}
	});

	$("#moreR").on("click", function() {
		$("#storeReview").on('touchend', function(e) {
			//상위로 이벤트가 전파되지 않도록 중단한다.
			e.stopPropagation();
		});
		page += 3
		getListRpS();
		$("#page").css("overflow", "auto");
	});
	$("#btnRV").on("click", function() {
		location.href = "RV";
	});

	// 덧글 리스트

	getListRpS();
	function getListRpS() {
		$.ajax({
			url : "listRpS.json",
			type : "get",
			data : {
				"page" : page,
				"sid" : sid
			},
			success : function(data) {
				var tempRps = Handlebars.compile($("#tempRps").html());
				for (var i = 0; i < data.length; i++) {
					// var date = new Date(data[i].regidate); // Wed Jan 08 2020 11:09:20 GMT+0900 (한국 표준시)
					// alert(datez(date));
					data[i].regidate = datez(new Date(data[i].regidate));
				}
				$(".reviewRps").append(tempRps(data));

				if (rps == 0) {
					$("#Rps0").html("첫 리뷰의 주인공이 되어주세요.");
				} else if (data.length == 0) {
					alert("리뷰가 없어요.");
				}

				if (rps > 3) {
					$("#moreR").html("더보기");
				}
			}
		});
	}

	// 날짜 포멧 변환

	function datez(date) {
		now = date;
		year = "" + now.getFullYear();
		month = "" + (now.getMonth() + 1);
		if (month.length == 1) {
			month = "0" + month;
		}
		day = "" + now.getDate();
		if (day.length == 1) {
			day = "0" + day;
		}
		hour = "" + now.getHours();
		if (hour.length == 1) {
			hour = "0" + hour;
		}
		minute = "" + now.getMinutes();
		if (minute.length == 1) {
			minute = "0" + minute;
		}
		second = "" + now.getSeconds();
		if (second.length == 1) {
			second = "0" + second;
		}
		return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":"
				+ second;
	}
</script>
</html>