<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="resources/honMY.css">
<!--  css -->
</head>
<body>
	<div id="page">
		<div id="title">
			<a href="mainPage"><img id="logo" src="resources/main/logo2.png"
				width=40></a> <span id="titleTXT">나의 리뷰</span>
		</div>
		<div id="contentU">
			<div class="boxBURL"></div>
			<script id="tempURL" type="text/x-handlebars-template">
				{{#each .}}
				<div class="boxB" sid="{{sid}}">
					<div class="imgBoxR">
						<img src="{{simage}}" alt="가게이미지" class="img-circle" width="55px" height="55px"><br>
						<p class="snameURL">{{sname}}</p>
					</div>
					<div class="rContentR">
						<span class="smallURL">{{regidate}} 평점 : {{score}}</span><br>
						<span>{{retext}}</span>
					</div>
					<span class="removeB glyphicon glyphicon-remove"
					aria-hidden="true" rid={{rid}}></span>
				</div>
				{{/each}}
			</script>
			<!-- 			<div class="boxB"> -->
			<!-- 				<div class="imgBoxR"> -->
			<!-- 					<img src="http://placehold.it/55x55" alt="favor" class="img-circle"><br> -->
			<!-- 					<p> -->
			<!-- 						규카츠 외 <br> <small>★☆☆☆☆</small> -->
			<!-- 					</p> -->
			<!-- 				</div> -->
			<!-- 				<div class="rContentR"> -->
			<!-- 					<small>2019.12.24</small> -->
			<!-- 					<p>가서 자다옴</p> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
		</div>
	</div>
</body>
<script>
	var uid = "${uid}";

	getlistURL();
	function getlistURL() {
		$.ajax({
			url : "listURL.json",
			type : "get",
			data : {
				"uid" : uid
			},
			success : function(data) {
				if (data.length == 0) {
					$("#contentU").html("리뷰를 등록하세요.");
					return;
				}
				for (var i = 0; i < data.length; i++) {
					// var date = new Date(data[i].regidate); // Wed Jan 08 2020 11:09:20 GMT+0900 (한국 표준시)
					// alert(datez(date));
					data[i].regidate = datez(new Date(data[i].regidate));
				}
				var temp = Handlebars.compile($("#tempURL").html());
				$(".boxBURL").html(temp(data));

				$(".boxB").on("click", function() {
					var sid = $(this).attr("sid");
					location.href = "read?sid=" + sid;
				})

				$(".removeB").on("click", function(e) {
					e.stopPropagation();
					var rid = $(this).attr("rid");
					if (!confirm("댓글을 삭제하시겠습니까?"))
						return;

					$.ajax({
						type : "post",
						url : "deleteUR",
						data : {
							"uid" : uid,
							"rid" : rid
						},
						success : function() {
							alert("삭제되었습니다.");
							getlistURL();
						}
					});
				});
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