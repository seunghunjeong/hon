<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
<title>관리자 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
* {
	padding: 0;
	margin: 0;
	position: relative;
	box-sizing: border-box;
}

body, html {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.wrap {
	width: 100%;
	height: 640px;
	margin: 0 auto;
}

/*root*/
.head {
	width: 100%;
	height: 50px;
	background: #E8B963;
}

.head>h1 {
	margin: 0 auto;
	text-align: center;
	line-height: 50px;
	font-weight: 100;
}

.head>span {
	color: white;
	right: 10px;
	font-size: 18px;
	position: absolute;
	top: 0;
	line-height: 50px;
	cursor: pointer;
}

/*back*/
.section1 {
	width: 100%;
	height: 120px;
	display: flex;
	align-items: center;
}

.section1>span {
	width: 100%;
	line-height: 120px;
	position: absolute;
	top: 0;
	font-size: 18px;
	transform: rotateY(180deg);
	left: -330px;
	cursor: pointer;
}

/*AD*/
.section2 {
	width: 100%;
	height: 80px;
	background: #d2d2d2;
}

.section2>p {
	width: 100%;
	line-height: 80px;
	position: absolute;
	top: 0;
	left: 30px;
}

/*user & CEO*/
.section3 {
	width: 100%;
	height: 150px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-bottom: 3px solid #d2d2d2;
}

.section3>div {
	width: 40%;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}

.section3>div>div {
	width: 100%;
	height: 40px;
	background: darkred;
	display: flex;
	align-items: center;
	justify-content: center;
}

.section3 .user>div {
	color: white;
	border-radius: 10px 0px 0px 10px;
	cursor: pointer;
}

.section3 .ceo>div {
	color: white;
	border-radius: 0px 10px 10px 0px;
	cursor: pointer;
}

.section3>div>div>span {
	line-height: 30px;
}

.section3 .user p {
	margin: 0;
	cursor: pointer;
}

.section3 .ceo p {
	margin: 0;
	cursor: pointer;
}

.frm {
	display: none;
	position: absolute;
	left: 5px;
	top: 110px;
}

.frm1 {
	right: 5px;
	display: none;
	position: absolute;
	top: 110px;
}
</style>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script>
	$(document).ready(function() {
		$('.first').click(function() {
			$('.frm').fadeToggle();
			$('.frm1').fadeOut();
		});
	});

	$(document).ready(function() {
		$('.second').click(function() {
			$('.frm1').fadeToggle();
			$('.frm').fadeOut();
		});
	});
</script>
</head>
<body>
	<div class="wrap">
		<header class="head">
		<h1>root</h1>
		<span class="glyphicon glyphicon-cog" aria-hidden="true"></span> </header>
		<section class="section section1"> <span
			class="glyphicon glyphicon-share-alt" aria-hidden="true"
			onClick="location.href='mainPage'"></span> </section>
		<section class="section section2">
		<p>
			<a
				href="https://ssl.pstatic.net/tveta/libs/1261/1261679/98a2345c67c8a7ed8975_20200108132030439.jpg"></a>
		</p>
		</section>
		<section class="section section3">
		<div class="user">
			<div class="first" onClick="showHide();">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
			</div>
			<p>User</p>
			<form class="frm">
				<table id="tbl" width=300></table>
				<script id="temp" type="text/x-handlebars-template">
					<tr class="row">
						<td>회원ID</td>
						<td>성별</td>
						<td>삭제</td>
					</tr>
					{{#each .}}
						<tr class="row">
							<td>{{uid}}</td>
							<td>{{gender}}</td>
							<td><button class="delete" uid="{{uid}}">삭제</button></td>
						</tr>
					{{/each}}
				</script>
			</form>
		</div>

		<div class="ceo">
			<div class="second">
				<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			</div>
			<p>CEO</p>
			<form class="frm1">
				<table id="tbl1" width=300></table>
				<script id="temp1" type="text/x-handlebars-template">
						<tr class="row1">
							<td>사장ID</td>
							<td>가게이름</td>
							<td>삭제</td>
						</tr>
						{{#each .}}
							<tr class="row1">
								<td>{{sid}}</td>
								<td><a href="menu2?sid={{sid}}">{{sname}}</a></td>
								<td><button class="delete" sid="{{sid}}">삭제</button></td>
							</tr>
						{{/each}}
					</script>
			</form>
		</div>
		</section>
	</div>
</body>
<script>
	var sid;
	var uid;
	getList();
	function getList() {
		$.ajax({
			type : "get",
			url : "listU.json",
			data : {
				"uid" : uid
			},
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
			}
		});
	}

	$("#tbl").on("click", ".row .delete", function() {
		if (confirm("삭제하시겠습니까?")) {
			var uid = $(this).attr("uid");
			$.ajax({
				type : "post",
				url : "delU",
				data : {
					"uid" : uid
				},
				success : function() {
					alert("삭제되었습니다.");
					getList();
				},
				error : function() {
					alert("삭제를 실패했습니다.");
				}
			});
		}
	});
	getList1();
	function getList1() {
		$.ajax({
			type : "get",
			url : "listRS.json",
			data : {
				"sid" : sid
			},
			success : function(data) {
				var temp = Handlebars.compile($("#temp1").html());
				$("#tbl1").html(temp(data));
			}
		});
	}
	$("#tbl1").on("click", ".row1 .delete", function() {
		if (confirm("삭제하시겠습니까?")) {
			var sid = $(this).attr("sid");
			$.ajax({
				type : "post",
				url : "deleteS",
				data : {
					"sid" : sid
				},
				success : function() {
					alert("삭제되었습니다.");
					getList1();
				},
				error : function() {
					alert("삭제를 실패했습니다.");
				}
			});
		}
	});
</script>
</html>