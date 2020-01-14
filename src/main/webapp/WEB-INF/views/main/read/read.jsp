<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>${vo.sname }</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- jquery -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--  bootstrap -->
<link rel="stylesheet" href="resources/hon.css">
<!--  css -->
</head>
<body onLoad="Popup('nanumi');">
	<div id="page">
		<div id="header">
			<jsp:include page="../menu.jsp"></jsp:include>
			<!-- 메뉴 -->
		</div>
		<!-- header -->
		<div id="contentR">
			<div id="storeImg"></div>
			<!-- content  -->
			<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
				<img src="{{filename}}">
		{{/each}}
				<div id="imgMenu">
					<div id="menuTXT" onClick=>메뉴</div>
				</div>
		</script>
			<!-- 			<div id="storeImg"> -->
			<!-- 				<img src="resources/main/read/gobe1.jpg"> <img -->
			<!-- 					src="resources/main/read/gobe2.jpg"> <img -->
			<!-- 					src="resources/main/read/gobe3.jpg"> <img -->
			<!-- 					src="resources/main/read/gobe4.jpg"> -->
			<!-- 				<div id="imgMenu"> -->
			<!-- 					<div id="menuTXT" onClick=>메뉴</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div id="storeInfo">
				<span id="storeName">${vo.sname }</span> <span
					class="glyphicon glyphicon-pencil" aria-hidden="true"
					id="iconReply"></span>&nbsp;&nbsp;<span
					class="glyphicon glyphicon-star" aria-hidden="true" id="iconFavor"></span><br>
				<table>
					<tr>
						<th>주소</th>
						<td>|</td>
						<td>${vo.location }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>|</td>
						<td>${vo.phone }</td>
					</tr>
					<tr>
						<th>음식종류</th>
						<td>|</td>
						<td>${vo.ftype }</td>
					</tr>
					<tr>
						<th>가격대</th>
						<td>|</td>
						<td>${vo.priceS }</td>
					</tr>
					<tr>
						<th>영업시간</th>
						<td>|</td>
						<td>${vo.openingT }</td>
					</tr>
					<tr>
						<th>소개</th>
						<td>|</td>
						<td>${vo.info }</td>
					</tr>
				</table>
			</div>
			<div id="storeMap">
				<jsp:include page="map.jsp"></jsp:include>
			</div>
		</div>
		<jsp:include page="footerR.jsp"></jsp:include>
	</div>
	<jsp:include page="dPage.jsp"></jsp:include>
	<!-- 	덧글 -->
	<div id="dBack">
		<div id="rBox">
			<c:if test="${uid == null}">
		로그인을 해주세요.
		</c:if>
			<c:if test="${uid != null}">
				<div id="close">
					<span id="x1" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
				</div>
				<br>
				<br>
				<input type="hidden" value="${user.uid }" id="uid">
				<input type="hidden" value="${vo.sid }" id="sid">
				<table id="tblRp" width="298px" border="1">
					<tr>
						<td>덧글 쓰기</td>
						<td>평점</td>
						<td><input type="radio" name="score" value="1">1 <input
							type="radio" name="score" value="2">2 <input type="radio"
							name="score" value="3">3 <input type="radio" name="score"
							value="4">4 <input type="radio" name="score" value="5">5</td>
					</tr>
					<tr>
						<td colspan="3"><textarea rows="3" cols="36" id="retext"></textarea></td>
					</tr>
				</table>
				<div id="btnCenter">
					<button id="btnReply" class="btn btn-primary">댓글등록</button>
				</div>
			</c:if>
		</div>
	</div>
</body>
<script>
	var sid = "${vo.sid}";
	var uid = "${uid}";
	var favor = 0;
	var toggle = 0;

	// 마우스 스크롤 이벤트
	$("#contentR").on('mousewheel DOMMouseScroll', function(e) {
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

		if (delta == -120) {
			$.ajax({
				url : "read2",
				type : "get",
				dataType : "text",
				data : {
					"sid" : sid
				},
				success : function(data) {
					$("#contentR").html(data);
				}
			});
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
		if (startY - endY > 50) {
			$.ajax({
				url : "read2",
				type : "get",
				dataType : "text",
				data : {
					"sid" : sid
				},
				success : function(data) {
					$("#contentR").html(data);
				}
			});
		}
	});

	$("#storeImg img").on("click", function() {

	});

	$("#btnRV").on("click", function() {
		location.href = "RV?sid=" + sid;
	});
</script>
<!-- 팝업 -->
<script language="JavaScript">
	function Cookie(document, name, hours, path, domain, secure) {
		this.$document = document;
		this.$name = name;
		if (hours)
			this.$expiration = new Date((new Date()).getTime() + hours
					* 3600000);
		else
			this.$expiration = null;
		if (path)
			this.$path = path;
		else
			this.$path = null;
		if (domain)
			this.$domain = domain;
		else
			this.$domain = null;
		if (secure)
			this.$secure = true;
		else
			this.$secure = false;
	}

	function _Cookie_store() {
		var cookieval = "";
		for ( var prop in this) {

			if ((prop.charAt(0) == '$') || ((typeof this[prop]) == 'function'))
				continue;
			if (cookieval != "")
				cookieval += '&';
			cookieval += prop + ':' + escape(this[prop]);
		}

		var cookie = this.$name + '=' + cookieval;
		if (this.$expiration)
			cookie += '; expires=' + this.$expiration.toGMTString();
		if (this.$path)
			cookie += '; path=' + this.$path;
		if (this.$domain)
			cookie += '; domain=' + this.$domain;
		if (this.$secure)
			cookie += '; secure';

		this.$document.cookie = cookie;
	}

	function _Cookie_load() {
		var allcookies = this.$document.cookie;
		if (allcookies == "")
			return false;

		var start = allcookies.indexOf(this.$name + '=');
		if (start == -1)
			return false;
		start += this.$name.length + 1;
		var end = allcookies.indexOf(';', start);
		if (end == -1)
			end = allcookies.length;
		var cookieval = allcookies.substring(start, end);

		var a = cookieval.split('&');
		for (var i = 0; i < a.length; i++)
			a[i] = a[i].split(':');

		for (var i = 0; i < a.length; i++) {
			this[a[i][0]] = unescape(a[i][1]);
		}
		return true;
	}

	function _Cookie_remove() {
		var cookie;
		cookie = this.$name + '=';
		if (this.$path)
			cookie += '; path=' + this.$path;
		if (this.$domain)
			cookie += '; domain=' + this.$domain;
		cookie += '; expires=Fri, 31-Jan-2001 00:00:00 GMT';

		this.$document.cookie = cookie;
	}

	new Cookie();
	Cookie.prototype.store = _Cookie_store;
	Cookie.prototype.load = _Cookie_load;
	Cookie.prototype.remove = _Cookie_remove;

	function Popup(site) {
		var exp = 8760;
		var page = "help";
		var windowprops = "width=300,height=300,location=no,toolbar=no,menubar=no,scrollbars=no";
		var temp = new Cookie(document, "nanumi", exp);

		if (!temp.load()) {
			temp.firstload = site;
			temp.store();
			subwin = window.open(page, "", windowprops);
		}
	}

	// 덧글

	$("#iconReply").on("click", function() {
		$("#dBack").show();
		$("body").css("overflow", "hidden");
		$("#dBack").css("overflow", "hidden");
	});

	// 즐겨찾기
	// 	getFavor();

	// 	function getFavor() {
	// 		$.ajax({
	// 			url : "listUFL.json",
	// 			type : "get",
	// 			data : {
	// 				"uid" : uid,
	// 				"sid" : sid
	// 			},
	// 			success : function(data) {
	// 				favor = data.favor;
	// 			}
	// 		});
	// 	}

	// 즐겨찾기 확인
	chkFavor();
	function chkFavor() {
		$.ajax({
			url : "FChk",
			type : "get",
			data : {
				"sid" : sid,
				"uid" : uid
			},
			success : function(data) {
				favor = data;
				if (favor == "" || favor == "0") {
					$("#iconFavor").css("color", "black");
				} else {
					$("#iconFavor").css("color", "red");
				}
			}
		});
	}

	$("#iconFavor").on("click", function() {
		if (uid == "") {
			alert("로그인을 해주세요.");
		} else {
			switch (favor) {
			case "":
				$.ajax({
					url : "userFI",
					type : "get",
					data : {
						"sid" : sid,
						"uid" : uid
					},
					success : function() {
						$("#iconFavor").css("color", "red");
						favor = 1;
					}
				});
				break;
			case "0":
			case 0:
				favor = 1;
				$.ajax({
					url : "userFU",
					type : "get",
					data : {
						"sid" : sid,
						"uid" : uid,
						"favor" : favor
					},
					success : function() {
						$("#iconFavor").css("color", "red");
					}
				});
				break;
			case "1":
			case 1:
				favor = 0;
				$.ajax({
					url : "userFU",
					type : "get",
					data : {
						"sid" : sid,
						"uid" : uid,
						"favor" : favor
					},
					success : function() {
						$("#iconFavor").css("color", "black");
					}
				});
				break;
			}
		}
	});

	// 닫기

	$("#dBack").on("click", function() {
		$("#dBack").hide();
		$("body").css("overflow", "visible");
	});

	$("#rBox").on("click", function(e) {
		e.stopPropagation();
	});

	$("#x1").on("click", function() {
		$("#dBack").hide();
	});

	$("#btnReply").on("click", function() {
		var sid = $("#sid").val();
		var uid = $("#uid").val();
		var score = $('input[name="score"]:checked').val();
		var retext = $("#retext").val();

		if (confirm("덧글을 입력하시겠습니까?")) {
			$.ajax({
				url : "rService",
				type : "get",
				data : {
					"sid" : sid,
					"uid" : uid,
					"score" : score,
					"retext" : retext
				},
				success : function(data) {
					$("#dBack").hide();
					$("body").css("overflow", "visible");
				}
			});
		} else {
			return;
		}
	});

	getImage();

	function getImage() {
		$.ajax({
			url : "listSI.json",
			type : "get",
			data : {
				"sid" : sid
			},
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#storeImg").html(temp(data));

				$("#storeImg img").on("click", function() {
					$("#imgB img").show();
					var imgB = $(this).attr("src");
					$("#imgB img").attr("src", imgB);
					$("#dPage").show();
				})

				$("#imgMenu").on("click", function(e) {
					$("#imgB img").hide();
					$("#dPage").show();
				});
			}
		});
	}
</script>
</html>