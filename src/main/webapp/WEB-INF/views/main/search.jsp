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
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/hon.css">
</head>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="menu.jsp"></jsp:include>
			<!-- 메뉴 -->
			<div id="searchInfo">
				<span id="t">${pm.cri.keyword } 검색결과 총 ${pm.totalCount }건</span> <span id="w"></span>
				<button id="btnFilter" type="button" class="btn btn-default btn-xs"
					style="float: right">
					<span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span><b>
						필터</b>
				</button>
			</div>
		</div>
		<!-- header -->
		<div id="search"></div>
		<script id="tempS" type="text/x-handlebars-template">
		{{#each list}}
			<div class="thumb thumbnail">
				<a href="read?sid={{sid}}"><img src="{{simage}}"
					alt="favor" class="img-thumbnail"></a>
				<div class="caption">
					<h6>
						{{sname}}<br> <small>평점 ★★★★☆</small>
					</h6>
				</div>
			</div>			
		{{/each}}
	</script>
		<!-- 페이지네이션 -->
		<div style="text-align: center; clear: both;">
			<ul id="pagination" class="pagination"></ul>
		</div>
		<!-- search  -->

		<!-- 필터 창 -->
		<div id="dBack" class="bbox">
			<div id="lBox">
				<div id="sort1">
					<img src="resources/main/search/snowmanTXT.png" width="40px"
						onclick="getWeather()" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
						src="resources/main/search/ageTXT.png" width="40px" onclick="getAge()"/>
				</div>
				<div id="sort2">
					지역별 <br>
					<button type="button" class="btn btn-success" id="btnSeoul">서울</button>
					<button type="button" class="btn btn-success" id="btnIncheon">인천</button>
					<button type="button" class="btn btn-success" id="btnBusan">부산</button>

				</div>
				<div id="sort3">
					가격별 <br> <img src="resources/main/search/price/0.png"
						width="60px" id="img0"> <img src="resources/main/search/price/1.png"
						width="60px" id="img1"> <img src="resources/main/search/price/2.png"
						width="60px" id="img2"> <img src="resources/main/search/price/3.png"
						width="60px" id="img3">
				</div>
				<div id="sort4">
					혼밥 난이도 <br> <img src="resources/main/search/lv/lv1.png"
						width="70px" id="imgL1"> <img src="resources/main/search/lv/lv2.png"
						width="70px" id="imgL2"> <img src="resources/main/search/lv/lv3.png"
						width="70px" id="imgL3"><br> <img
						src="resources/main/search/lv/lv4.png" width="70px" id="imgL4"> <img
						src="resources/main/search/lv/lv5.png" width="70px" id="imgL5">
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
	var page = 1;
	var keyword = "${pm.cri.keyword}";
	var searchType = "";
	var tmp = "";

	// 검색
	getSearchS();

	function getSearchS() {
		$
				.ajax({
					type : "get",
					url : "searchS.json",
					data : {
						"keyword" : keyword,
						"page" : page,
						"searchType" : searchType,
						"tmp" : tmp
					},
					success : function(data) {
						var temp = Handlebars.compile($("#tempS").html());
						$("#search").html(temp(data));
						
						var total = data.pm.totalCount;
						
 						$("#t").html(keyword + " 검색결과 총 " + total + " 건");

						if (total == 0) {
							$("#search").html("검색결과가 없습니다.");
						}

						//페이지 리스트
						var str = "";
						if (data.pm.prev) {
							str += "<li><a href='"
									+ (data.pm.startPage - 1)
									+ "' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>"
						}
						for (var i = data.pm.startPage; i <= data.pm.endPage; i++) {
							str += "<li><a href='" + i +"'>" + i + "</a></li>";
						}
						if (data.pm.next) {
							str += "<li><a href='"
									+ (data.pm.endPage + 1)
									+ "' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";

						}
						$("#pagination").html(str);
					}
				});
	}

	// 페이징

	$("#pagination").on("click", "a", function(event) {
		event.preventDefault();
		page = $(this).attr("href");
		getSearchS();
	});

	// 필터창
	$("#btnFilter").on("click", function() {
		$("#dBack").show();
		$("#page").bind('touchmove', function(e) {
			e.preventDefault()
		});

		$("#lBox").bind('touchmove', function(e) {
			e.stopPropagation();
			$("body").css('overflow', 'hidden');
			$("#dBack").css('overflow', 'hidden');
		});
	});

	// 날씨 정렬

	function getWeather() {
		$.ajax({
			type : "get",
			url : "weather.json",
			success : function(data) {
				keyword = "${pm.cri.keyword}";
				page = 1;
				searchType = "weather";
				tmp = data[1].w;
				$("#w").html(data[1].area + " " + tmp);
				switch (tmp) {
				case "맑음":
					tmp = '1';
					break;
				case "흐림":
					tmp = '2';
					break;
				case "비":
					tmp = '3';
					break;
				case "소나기":
					tmp = '3';
					break;
				case "흐리고 비":
					tmp = '3';
					break;
				case "가끔 비":
					tmp = '3';
					break;
				case "한때 비":
					tmp = '3';
					break;
				case "눈":
					tmp = '4';
					break;
				case "가끔 눈":
					tmp = '4';
					break;
				case "한때 눈":
					tmp = '4';
					break;
				case "구름":
					tmp = '5';
					break;
				case "구름조금(낮)":
					tmp = '5';
					break;
				case "구름많음(낮)":
					tmp = '5';
					break;
				case "구름조금(밤)":
					tmp = '5';
					break;
				case "구름많음(밤)":
					tmp = '5';
					break;
				}
				getSearchS();
				$("#dBack").hide();
			}
		});
	}
	
	// 나이순 정렬
	
	function getAge(){
		keyword = "${pm.cri.keyword}";
		page = 1;
		searchType = "yearS";
		tmp = "20";
		$("#w").html(tmp + "대 추천 음식점");
		getSearchS();
		$("#dBack").hide();
	}
	
	// 지역순 정렬
	
	$("#btnSeoul").on("click",function(){
		tmp="서울";
		getLoca();
	});
	$("#btnIncheon").on("click",function(){
		tmp="인천";
		getLoca();
	});
	$("#btnBusan").on("click",function(){
		tmp="부산";
		getLoca();
	});
	
	function getLoca(){
		keyword = "${pm.cri.keyword}";
		page = 1;
		searchType = "location";
		$("#w").html(tmp + " 음식점");
		getSearchS();
		$("#dBack").hide();
	}

	// 가격순 정렬
	
	$("#img0").on("click",function(){
		tmp = "만원 미만";
		getPriceS();
	});
	$("#img1").on("click",function(){
		tmp = "1 만원";
		getPriceS();
	});
	$("#img2").on("click",function(){
		tmp = "2 만원";
		getPriceS();
	});
	$("#img3").on("click",function(){
		tmp = "3 만원";
		getPriceS();
	});

	function getPriceS(){
		keyword = "${pm.cri.keyword}";
		page = 1;
		searchType = "priceS";
		$("#w").html(tmp);
		getSearchS();
		$("#dBack").hide();
	}
	
	// 가격순 정렬
	
	$("#imgL1").on("click",function(){
		tmp = "1";
		getLvS();
	});
	$("#imgL2").on("click",function(){
		tmp = "2";
		getLvS();
	});
	$("#imgL3").on("click",function(){
		tmp = "3";
		getLvS();
	});
	$("#imgL4").on("click",function(){
		tmp = "4";
		getLvS();
	});
	$("#imgL5").on("click",function(){
		tmp = "5";
		getLvS();
	});

	function getLvS(){
		keyword = "${pm.cri.keyword}";
		page = 1;
		searchType = "lvs";
		$("#w").html("혼밥 " + tmp + " 단계");
		getSearchS();
		$("#dBack").hide();
	}

	// 닫기
	$("#btnClose").on("click", function() {
		$("#dBack").hide();
		$("#page").unbind('touchmove');
		$("body").css('overflow', 'auto');
		$("#dBack").css('overflow', 'auto');
	});
	
	// 어두운 부분 클릭하면 닫기
	$('#dBack').click(function(e) {
		if ($(e.target).hasClass("bbox")) {
			$("#dBack").hide();
			$("#page").unbind('touchmove');
			$("body").css('overflow', 'auto');
			$("#dBack").css('overflow', 'auto');
		}
	});
</script>
</html>