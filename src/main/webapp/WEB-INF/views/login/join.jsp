<%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frm" action="joinU" method="post">
		<table border=1 width=500>
			<tr>
				<td width=100>아이디</td>
				<td><input type="text" name="uid" size=50></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="upw" size=50></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="nick" size=50></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="location" size=50></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="gender" value="남">남자 <input
					type="radio" name="gender" value="여">여자</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" size=50></td>
			</tr>
			<tr>
				<td>메일주소</td>
				<td><input type="text" name="email" size=50></td>
			</tr>
			<tr>
				<td>대표 이미지</td>
				<td><input type="text" name="image" size=50></td>
			</tr>
			<tr>
				<td>생일</td>
				<td><input type="text" name="birthday" size=50></td>
			</tr>
		</table>
		<input type="submit" value="저장"> <input type="reset"
			value="취소">
	</form>
	<input type="button" value="목록" onClick="location.href='mainPage'">
</body>
</html>