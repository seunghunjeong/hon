<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="resources/hon.css">
</head>
<body>
	<form method="post" name="frm">
		<div id="page">
			<div id="contentRV">
				<div id="menuInfo">
					<h5>
						<b>메뉴</b>
					</h5>
					<input type="checkbox" id="chk_all"> <input type="button"
						value="삭제" id="btndel">
					<ul id=ulm>
						<c:forEach items="${mvo }" var="vo">
							<li class="row"><span id="chk"><input type="checkbox"
									class="chk" sid={{sid}} mcount={{mcount}}></span> ${vo.mname }
								${vo.price }</li>
						</c:forEach>
					</ul>
					<input type="button" value="등록" onClick="location.href='insertM'">
				</div>
			</div>
		</div>
	</form>
</body>
<script>
	var sid;
	var mcount;
	/*
	 $("#menuInfo").on("click", ".delete", function() {
	 if(confirm("삭제하시겠습니까?")) {
	 $.ajax({
	 type:"post",
	 url:"deleteM",
	 data:{"sid":sid, "mcount":mcount},
	 success:function() {
	 alert("삭제되었습니다.");
	 getList2();
	 },
	 error:function() {
	 alert("삭제를 실패했습니다.");
	 }
	 });
	 }
	 });
	 */
	$(document)
			.ready(
					function() {
						//체크박스 전체 선탣&해제
						$('#chk_all').click(
								function() {
									if ($("#chk_all").prop("checked")) {
										$("input[type=checkbox]").prop(
												"checked", true);
									} else {
										$("input[type=checkbox]").prop(
												"checked", false);
									}
								});

						$("#btndel")
								.on(
										"click",
										function() {
											if (!confirm("선택 메뉴를 삭제하시겠습니까?"))
												return;
											$("#ulm .row .chk:checked")
													.each(
															function() {
																sid = $(this)
																		.attr(
																				"sid");
																mcount = $(this)
																		.attr(
																				"mcount");
																$
																		.ajax({
																			type : "post",
																			url : "deleteM",
																			data : {
																				"sid" : sid,
																				"mcount" : mcount
																			},
																			success : function(
																					data) {
																				location.href = "http://192.168.0.39:8088/web/menu2sid?"
																						+ sid;
																			}
																		});
															});
										});

					});
</script>
</html>