<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/honMY.css">
<!--  css -->
</head>
<body>
	<div id="page">
		<div id="title">
			<a href="mainPage"><img id="logo" src="resources/main/logo2.png"
				width=40></a>
			<div id="titleTXT">내 정보</div>
		</div>
		<form name="frm" action="upU" method="post">
			<div>
				<div class="box">
					<label for="uid">아이디</label> <input type="text"
						class="form-control" name="uid" id="uid" value="${user.uid }"
						readonly> <br> <label for="upw">비밀번호</label> <input
						type="password" name="upw" id="upw" class="form-control">
					<br> <label for="upw1">비밀번호확인</label> <input type="password"
						name="upw1" id="upw1" class="form-control">
					<div class="alert alert-success" id="alert-success">비밀번호가
						일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
						않습니다.</div>
				</div>

				<hr align="center" style="border: solid 0.2px gray; width: 90%;">

				<div class="box">
					<label for="nick">닉네임</label>
					<div class="input-group">
						<input type="text" class="form-control" name="nick" id="nick"
							value="${user.nick }"> <span class="input-group-btn">
							<button class="btn btn-default" type="button" id="nickChk">Check!</button>
						</span>
					</div>
					<br> <br> <br> <label for="phone">전화번호</label> <input
						type="tel" name="phone" id="phone" class="form-control"
						value="${user.phone }" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
						placeholder="예) 010-1234-5678"> <br> <label
						for="location">지역</label> <input type="text" name="location"
						id="location" placeholder="예) 서울시 강남구" class="form-control"
						value="${user.location }"> <br> <label for="email">이메일</label>
					<input type="email" name="email" id="email" class="form-control"
						value="${user.email }">
				</div>

				<hr align="center" style="border: solid 0.2px gray; width: 90%;">
				<input type="submit"
					style="margin-left: 140px; margin-top: 10px; border-radius: 15px;"
					id="btnInsert" value=" 수정 ">
			</div>
		</form>
	</div>
	<div id="bottom"></div>
</body>
<script>
	$("#toggle").on("click", function() {
		$.ajax({
			type : "get",
			url : "ceoInsert",
			success : function() {
				location.href = "ceoInsert"
			}
		});
	})

	$("#nickChk").on("click", function() {
		var nick = $("#nick").val();
		$.ajax({
			type : "get",
			url : "nickChk",
			data : {
				"nick" : nick
			},
			success : function(data) {
				if (data == 1) {
					alert("존재하는 닉네임입니다.");
				} else if (nick == "") {
					alert("닉네임 입력해주세요.");
				} else if (data == 0) {
					alert("사용 가능합니다.");
				}
			}
		});
	});

	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var upw = $("#upw").val();
			var upw1 = $("#upw1").val();
			if (upw != "" || upw1 != "") {
				if (upw == upw1) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}

			}
		});
	});

	$(frm).submit(function() {
		var re = /^[0-9]+$/;
		if (this.upw.value == "") {
			alert("비밀번호를 입력하세요");
			this.upw.focus();
			return false;
		} else if (this.upw.value != this.upw1.value) {
			alert("비밀번호를 확인하세요")
			this.upw1.focus();
			return false;
		} else if (this.nick.value == "") {
			alert("닉네임을 입력하세요");
			this.nick.focus();
			return false;
		} else if (this.birthday.value == "") {
			alert("생년월일을 입력하세요");
			this.birthday.focus();
			return false;
		} else if (this.phone.value == "") {
			alert("전화번호를 입력하세요");
			this.phone.focus();
			return false;
		} else if (this.email.value == "") {
			alert("메일을 입력하세요");
			this.email.focus();
			return false;
		} else if (this.gender.value == "") {
			alert("성별을 선택하세요");
			return false;
		} else {
			location.href = "login";
		}
	});
</script>
</html>