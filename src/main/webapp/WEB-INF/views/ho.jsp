<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>다음지도 - 주소로 위도/경도 좌표값 얻기</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- jquery -->
</head>
<body>
	<p style="text-align: center;">[주소로 위도, 경도 좌표값 얻기]</p>

	<input type="text" id="address" value="" size="70">
	<input type="button" value="좌표값 검색" onclick="addressChk()">

	<div id="map" style="width: 100%; height: 450px;"></div>

	<div id="coordXY"></div>

	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4abaa92483e721ff32ae76149a405f3f&libraries=services"></script>
	<script>
		var address = document.getElementById("address");
		var mapContainer = document.getElementById("map");
		var coordXY = document.getElementById("coordXY");
		var mapOption;
		var map;
		var x, y = "";

		if (address.value == "") {

			mapOption = {
				center : new daum.maps.LatLng(33.450701, 126.570667), // 임의의 지도 중심좌표 , 제주도 다음본사로 잡아봤다.
				level : 4
			// 지도의 확대 레벨

			};
		}

		// 지도 생성
		map = new daum.maps.Map(mapContainer, mapOption);

		function addressChk() {
			var gap = address.value; // 주소검색어
			if (gap == "") {
				alert("주소 검색어를 입력해 주십시오.");
				address.focus();
				return;
			}

			// 주소-좌표 변환 객체를 생성
			var geocoder = new daum.maps.services.Geocoder();

			// 주소로 좌표를 검색
			geocoder
					.addressSearch(
							gap,
							function(result, status) {

								// 정상적으로 검색이 완료됐으면,
								if (status == daum.maps.services.Status.OK) {

									var coords = new daum.maps.LatLng(
											result[0].y, result[0].x);

									y = result[0].x;
									x = result[0].y;

									// 결과값으로 받은 위치를 마커로 표시합니다.
									var marker = new daum.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명표시
									var infowindow = new daum.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:5px 0;">좌표위치</div>'
											});

									infowindow.open(map, marker);

									// 지도 중심을 이동
									map.setCenter(coords);

									coordXY.innerHTML = "<br>X좌표 : " + x
											+ "<br><br>Y좌표 : " + y;
								}
							});
		}
	</script>

	<div>
		<h1>[다음 날씨]</h1>
		<div id="boxW" style="width: 600px; float: left;"></div>
		<script id="tempW" type="text/x-handlebars-template">
			{{#each .}}				 
				<div>
					<div>{{area}}</div>
					<div>
						{{temper}}
					</div>
					<div>{{w}}</div>
			{{/each}}
		</script>
		<div id="i"></div>
	</div>

	<div id="z" style="width: 600px; float: left;"></div>
	<script id="t" type="text/x-handlebars-template">
			{{#each .}}				 
				<div>
					<div>{{favor}}</div>
					<div>
						{{fcnt}}
					</div>
					<div>{{uid}}</div>{{sid}}
			{{/each}}
		</script>

</body>
<script>
	getWeather();
	function getWeather() {
		$.ajax({
			type : "get",
			url : "weather.json",
			success : function(data) {
				var temp = Handlebars.compile($("#tempW").html());
				$("#boxW").html(temp(data));
				$("#i").html(data[1].area);
			}
		});
	}

	getFavor();

	function getFavor() {
		$.ajax({
			url : "listUFL.json",
			type : "get",
			data : {
				"uid" : "user00"
			},
			success : function(data) {
				var temp = Handlebars.compile($("#t").html());
				$("#z").html(temp(data));
			}
		});
	}
</script>

</html>