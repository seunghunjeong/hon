<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js"
	type="application/javascript"></script>
<!-- 부트페이  -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>~~~음식점</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--  bootstrap -->
<link rel="stylesheet" href="resources/hon.css">
<!--  css -->
</head>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="../../menu.jsp"></jsp:include>
			<!-- 메뉴 -->
		</div>
		<!-- header -->
		<div id="contentRV">
			<jsp:include page="menu.jsp"></jsp:include>
			<div id="timeRV">
				<b>시간 선택</b> <select>
					<c:forEach begin="1" end="24" var="i">
						<option><c:out value="${i}" /></option>
					</c:forEach>
				</select>시 <select>
					<c:forEach begin="0" end="59" var="i">
						<option><c:out value="${i}" /></option>
					</c:forEach>
				</select>분
			</div>

			<div id="requestRV">
				<b>요청사항</b>
				<textarea class="form-control" rows="2"></textarea>
			</div>
		</div>
		<jsp:include page="../footerR.jsp"></jsp:include>
	</div>

</body>
<script>
	$("#btnRV").on("click", function() {
		var priceAll = 0;

		$("#menuInfo ul li input:checkbox:checked").each(function() {
			var tmp = parseInt($(this).attr("price"));
			priceAll += tmp;
		});

		BootPay.request({
			price : priceAll,
			application_id : "5e055a2b0627a80023682b58",
			name : '고베 규카츠',
			pg : '',
			method : '',
			show_agree_window : 0,
			items : [ {
				item_name : '규카츠',
				qty : 1,
				unique : '123',
				price : 1000,
				cat1 : 'TOP',
				cat2 : '티셔츠',
				cat3 : '라운드 티',
			} ],
			user_info : {
				username : '사용자 이름',
				email : '사용자 이메일',
				addr : '사용자 주소',
				phone : '010-1234-4567'
			},
			order_id : '고유order_id_1234',
			params : {
				callback1 : '그대로 콜백받을 변수 1',
				callback2 : '그대로 콜백받을 변수 2',
				customvar1234 : '변수명도 마음대로'
			},
			account_expire_at : '2018-05-25',
			extra : {
				start_at : '2019-05-10',
				end_at : '2022-05-10',
				vbank_result : 1,
				quota : '0'
			}
		}).error(function(data) {
			console.log(data);
		}).cancel(function(data) {
			console.log(data);
		}).ready(function(data) {
			console.log(data);
		}).confirm(function(data) {

			console.log(data);
			var enable = true;
			if (enable) {
				BootPay.transactionConfirm(data);
			} else {
				BootPay.removePaymentWindow();
			}
		}).close(function(data) {
			console.log(data);
		}).done(function(data) {
			console.log(data);
		});
	});
</script>
</html>