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
				width=40></a> <span id="titleTXT">관심매장</span>
		</div>
		<div id="contentU">
			<div class="favorUFL"></div>
			<script id="tempUFL" type="text/x-handlebars-template">
				{{#each .}}
					<div class="boxB" sid={{sid}}>
							<img class="imgB" src="{{simage}}" class="img-rounded" align="middle" width="70px" height="70px">
							<div class="txtB">
								{{sname}} <br> <small>{{OpeningT}}<br> {{location}} |
									{{phone}} <br>{{Ftype}}
								</small>
							</div>
					<span class="removeB glyphicon glyphicon-remove"
					aria-hidden="true" sid={{sid}}></span>
						</div>
				{{/each}}
				</script>
			<!-- 			<div class="boxB"> -->
			<!-- 				<img class="imgB" src="http://placehold.it/70x70" -->
			<!-- 					class="img-rounded" align="middle"> -->
			<!-- 				<div class="txtB"> -->
			<!-- 					구월동 고베 규카츠 <br> <small>★★★☆☆<br> 인천시 구월동 | -->
			<!-- 						032-0000-0000 <br>고기 요리 -->
			<!-- 					</small> -->
			<!-- 				</div> -->
			<!-- 				<span id="removeB" class="glyphicon glyphicon-remove" -->
			<!-- 					aria-hidden="true"></span> -->
			<!-- 			</div> -->
		</div>
	</div>
</body>
<script>
	var uid = "${uid}";

	getlistUFL();
	function getlistUFL() {
		$.ajax({
			url : "listUFL.json",
			type : "get",
			data : {
				"uid" : uid
			},
			success : function(data) {
				if (data.length == 0) {
					$(".favor").html("마음에 드는 음식점을 즐겨찾기해보세요.");
					$("#nav").css("overflow", "hidden");
					return;
				} else if (data.length < 5) {
					$("#nav").css("overflow", "hidden");
				} else {
					$("#nav").css("overflow", "auto");
				}
				var temp = Handlebars.compile($("#tempUFL").html());
				$(".favorUFL").html(temp(data));

				$(".boxB").on("click", function() {
					var sid = $(this).attr("sid");
					location.href = "read?sid=" + sid;
				})

				$(".removeB").on("click", function(e) {
					e.stopPropagation();
					var sid = $(this).attr("sid");
					var favor = 0;
					$.ajax({
						url : "userFU",
						type : "get",
						data : {
							"sid" : sid,
							"uid" : uid,
							"favor" : favor
						},
						success : function() {
							getlistUFL();
						}
					});
				});
			}
		});
	}
</script>
</html>