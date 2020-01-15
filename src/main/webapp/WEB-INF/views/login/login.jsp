<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
<title>login</title>
<link href="${pageContext.request.contextPath}/resources/login.css?after"
	rel="stylesheet" />
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="554136634321-rdq5u8nladc5kr7kcdk1a6dr8hdu7sdk.apps.googleusercontent.com">
</head>
<body style="margin: 0px;">
	<div class="body_mo">
		<div id="title">
			<img src="resources/login/title.png" width="100%">
		</div>
		<form action="loginPost" method="post" name="frm"
			onSubmit="return CheckLogin()">
			<div>
				<div>
					<input type="radio" name="Radio_btn" id="Radio_btn" value="0"
						onclick="Rradio_uc('Radio_user');" checked /> 회원 <input
						type="radio" name="Radio_btn" id="Radio_btn" value="1"
						onclick="Rradio_uc('Radio_ceo');" /> 점장
				</div>
				<div id="Radio_user" height="30" style="display: '';">
					<span align="left" class="input_text">회원</span>
					<div>
						<input type="text" name="uid" id="uid" placeholder="아이디" />
					</div>
					<div>
						<input type="password" name="upw" id="upw" placeholder="비밀번호" />
					</div>
				</div>
				<div id="Radio_ceo" height="30" style="display: none;">
					<span align="left" class="input_text">점장</span>
					<div>
						<input type="text" name="cid" id="cid" placeholder="아이디" />
					</div>
					<div>
						<input type="password" name="cpw" id="cpw" placeholder="비밀번호" />
					</div>
				</div>

				<div style="font-size: 13px;">
					<input type="checkbox" class="log_auto">자동
					로그인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="findId"
						class="log_a">아이디</a> | <a href="findPw" class="log_a">비밀번호 찾기</a>
				</div>
				<br> <input type="submit" value="로그인" class="btn_login"
					onClick="funLogin()">
			</div>
		</form>
		<br> <br>

		<div>
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
			<div id="naver_id_login"></div>
			<!-- 다음아이디로로그인 버튼 노출 영역 -->
			<a id="kakao-login-btn"></a> <a
				href="http://developers.kakao.com/logout"></a>
			<!-- 구글아이디로로그인 버튼 노출 영역 -->
			<div id="google-login-btn">
				<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"
					style="width: 188px;"></div>
			</div>
		</div>

		<br> <br>
		<div style="font-size: 14px;">
			혼자한끼가 처음이신가요? <a href="join" class="log_a1">회원가입</a>
		</div>
		<br><br><br><br><br><br><br><br><br><br><br>
		<hr>
		<div style="font-size: 10px; text-align: left; color: gray;">
			<table>
				<tr>
					<td><img src="resources/login/2.png" /></td>
					<td><b>(주)혼자한끼</b><br> 인천광역시 미추홀구 매소홀로488번길 6-32|대표자 :
						혼끼|사업자등록번호:000-00-00000 사업자정보확인통신판매업신고:제 2019-인천미추홀-0000호|개인정보담당자
						: privacy@honkky.co.kr|제휴문의 : partnership@honjahankky.co.kr|고객만족센터
						: support@honkky.co.kr|호스트서비스사업자 : (주)ICIA <br>고객만족센터
						00-0000-0000 24시간, 연중무휴<br></td>
				</tr>
			</table>
		</div>

	</div>
</body>
<script type="text/javascript">
	//네이버로그인
	var naver_id_login = new naver_id_login("Uxl46jC3jMf2g1tg8wYq",
			"http://192.168.0.39:8088/web/naverLogin");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 3, 40);
	naver_id_login.setDomain("YOUR_SERVICE_URL");
	naver_id_login.setState(state);
	//naver_id_login.setPopup();	//팝업창
	naver_id_login.init_naver_id_login();

	//카카오로그인
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('2cc212750a30e19b74cfd88bbc08d1f9');
	// 카카오 로그인 버튼을 생성합니다.
	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			alert(JSON.stringify(authObj));
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
	//]]>

	//구글로그인
	function onSignIn(googleUser) {
		// Useful data for your client-side scripts:
		var profile = googleUser.getBasicProfile();
		console.log("ID: " + profile.getId()); // Don't send this directly to your server!
		console.log('Full Name: ' + profile.getName());
		console.log('Given Name: ' + profile.getGivenName());
		console.log('Family Name: ' + profile.getFamilyName());
		console.log("Image URL: " + profile.getImageUrl());
		console.log("Email: " + profile.getEmail());

		// The ID token you need to pass to your backend:
		var id_token = googleUser.getAuthResponse().id_token;
		console.log("ID Token: " + id_token);
	}
	/*
	function funLogin() {
		if(frm.uid.value.length==0) {
			alert("아이디를 입력하세요!");
		}else if(frm.upw.value.length==0) {
			alert("비밀번호를 입력하세요!");
		}else {
			frm.action="login";
			frm.method="post";
			frm.submit();
		}
		
		$(frm).submit(function() {
			var uid=frm.uid.value;
			if(uid=="") {
				alert("아이디를 입력하세요!");
				$(frm.uid).focus();
				return false
			}
		});
	}*/
	function Rradio_uc(id) {
		if (id == "Radio_user") {
			document.all["Radio_user"].style.display = ''; // 보이게
			document.all["Radio_ceo"].style.display = 'none'; // 안보이게
		} else {
			document.all["Radio_user"].style.display = 'none'; // 안보이게
			document.all["Radio_ceo"].style.display = ''; // 보이게
		}
	}
</script>
</html>