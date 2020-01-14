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
			<div>
				<div class="insertbox">
					<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>일반회원
				</div>

				<div class="insertbox" id="toggle">점장회원</div>
			</div>
		</div>
		<form name="frm" action="joinU" method="post">
			<div>
				<div class="box">
					<label for="uid">아이디</label>
					<div class="input-group">
						<input type="text" class="form-control" name="uid" id="uid">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button" id="idChk">Check!</button>
						</span>
					</div>
					<br> <label for="upw">비밀번호</label> <input type="password"
						name="upw" id="upw" class="form-control"> <br> <label
						for="upw1">비밀번호확인</label> <input type="password" name="upw1"
						id="upw1" class="form-control">
					<div class="alert alert-success" id="alert-success">비밀번호가
						일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
						않습니다.</div>
				</div>

				<hr align="center" style="border: solid 0.2px gray; width: 90%;">

				<div class="box">
					<label for="nick">닉네임</label>
					<div class="input-group">
						<input type="text" class="form-control" name="nick" id="nick">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button" id="nickChk">Check!</button>
						</span>
					</div>
					<br> <label for="birthday">생년월일</label> <input type="date"
						name="birthday" id="birthday" class="form-control"> <br>

					<label for="phone">전화번호</label> <input type="tel" name="phone"
						id="phone" class="form-control"
						pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
						placeholder="예) 010-1234-5678"> <br> <label
						for="location">지역</label> <input type="text" name="location"
						id="location" placeholder="예) 서울시 강남구" class="form-control">
					<br> <label for="email">이메일</label> <input type="email"
						name="email" id="email" class="form-control"> <br> <label>성별</label>
					<br> <input type="radio" id="male" name="gender"
						style="margin: 0px 5px 0px 50px" value="남"><label
						for="male">남자</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="radio" id="female" name="gender"
						style="margin: 0px 5px 0px 70px" value="여"><label
						for="female">여자</label>
				</div>

				<hr align="center" style="border: solid 0.2px gray; width: 90%;">

				<div>
					<div style="margin-left: 30px; margin-top: 20px">
						<label>◎혼자한끼 이용약관</label>
					</div>
					<div class="terms" style="margin-top: 10px">가입을 환영합니다.</div>
					<input type="checkbox" id="agree" name="agree"
						style="margin-top: 10px; margin-left: 30px;"> <span
						style="font-size: 10px;"> <label for="agree">위의
							'혼자한끼 이용약관'에 동의합니다.</label>
					</span>
				</div>
				<input type="submit"
					style="margin-left: 140px; margin-top: 10px; border-radius: 15px;"
					id="btnInsert" value=" 회원가입 ">
			</div>
		</form>
	</div>
	<div id="bottom"></div>
</body>
<script>
	$("#idChk").on("click", function() {
		var uid = $("#uid").val();
		$.ajax({
			type : "get",
			url : "idChk",
			data : {
				"uid" : uid
			},
			success : function(data) {
				if (data == 1) {
					alert("존재하는 아이디입니다.");
				} else if (uid == "") {
					alert("아이디를 입력해주세요.");
				} else if (data == 0) {
					alert("사용 가능합니다.");
				}
			}
		});
	});

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

	$("#toggle").on("click", function() {
		$.ajax({
			type : "get",
			url : "ceoInsert",
			success : function() {
				location.href = "ceoInsert"
			}
		});
	})

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
		if (this.uid.value == "") {
			alert("아이디를 입력하세요");
			this.uid.focus();
			return false;
		} else if (this.upw.value == "") {
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
		} else if (this.agree.checked == false) {
			alert("약관에 동의하지 않았습니다.");
			return false;
		} else {
			location.href = "login";
		}
	});
</script>
</html>