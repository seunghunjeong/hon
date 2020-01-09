<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>map</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4abaa92483e721ff32ae76149a405f3f&&libraries=services"></script>
</head>
<body>
	<!-- value에 주소값을 넣어주면된다. -->
	<input type="hidden" id="address" value="${vo.location }" size="70">

	<!-- 이미지 지도를 표시할 div 입니다 -->
	<div id="staticMap"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4abaa92483e721ff32ae76149a405f3f"></script>
	<script>
		var address = document.getElementById("address");
		var x, y = "";
		var nameS ="${vo.sname}"; // 음식점 이름

		var gap = address.value; // 주소검색어

		// 주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색
		geocoder.addressSearch(gap, function(result, status) {

			// 정상적으로 검색이 완료됐으면,
			if (status == daum.maps.services.Status.OK) {

				var coords = new daum.maps.LatLng(result[0].y, result[0].x);

				y = result[0].x;
				x = result[0].y;

				// 이미지 지도에서 마커가 표시될 위치입니다 
				var markerPosition = new kakao.maps.LatLng(x, y);

				// 이미지 지도에 표시할 마커입니다
				// 이미지 지도에 표시할 마커는 Object 형태입니다
				var marker = {
					position : markerPosition,
					text : nameS
				};

				var staticMapContainer = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
				staticMapOption = {
					center : new kakao.maps.LatLng(x, y), // 이미지 지도의 중심좌표
					level : 3, // 이미지 지도의 확대 레벨
					marker : marker
				// 이미지 지도에 표시할 마커 
				};

				// 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
				var staticMap = new kakao.maps.StaticMap(staticMapContainer,
						staticMapOption);
			}
		});
	</script>
</body>
</html>