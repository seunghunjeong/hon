<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frm" action="insertS" method="post">
		<table border=1 width=500>
			<tr>
				<td width=100>매장번호</td>
				<td><input type="text" name="sid" size=50></td>
			</tr>
			<tr>
				<td>매장이름</td>
				<td><input type="text" name="sname" size=50></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="location" size=50></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" size=50></td>
			</tr>
			<tr>
				<td>대표사진</td>
				<td><input type="text" name="simage" size=50></td>
			</tr>
			<tr>
				<td>날씨</td>
				<td><input type="text" name="weather" size=50></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="yearS" size=50></td>
			</tr>
			<tr>
				<td>난이도</td>
				<td><input type="text" name="lvs" size=50></td>
			</tr>
			<tr>
				<td>가격대</td>
				<td><input type="text" name="priceS" size=50></td>
			</tr>
			<tr>
				<td>영업시간</td>
				<td><input type="text" name="OpeningT" size=50></td>
			</tr>
			<tr>
				<td>쉬는 시간</td>
				<td><input type="text" name="RestT" size=50></td>
			</tr>
			<tr>
				<td>웹사이트</td>
				<td><input type="text" name="website" size=50></td>
			</tr>
			<tr>
				<td>음식 종류</td>
				<td><input type="text" name="Ftype" size=50></td>
			</tr>
			<tr>
				<td>휴일</td>
				<td><input type="text" name="RestD" size=50></td>
			</tr>
			<tr>
				<td>매장 소개</td>
				<td><input type="text" name="info" size=50></td>
			</tr>

		</table>
		<input type="submit" value="저장"> <input type="reset"
			value="취소">
	</form>
	 <input type="button" value="목록"
			onClick="location.href='mainPage'">
</body>
</html>