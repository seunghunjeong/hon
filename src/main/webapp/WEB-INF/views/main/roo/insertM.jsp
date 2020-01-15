<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
</head>
<body>
	<form action="insertM" method="post" name="frm">
		<table>
			<tr>
	            <td width=100>매장번호</td>
	            <td><input type="text" name="sid" size=50></td>
         	</tr>
         	<tr>
				<td>번호</td>
				<td><input type="text" name="mcount" size=50></td>
			</tr>
			<tr>
				<td>메뉴이름</td>
				<td><input type="text" name="mname" size=50></td>
			</tr>
			<tr>
				<td>메뉴이미지</td>
				<td><input type="text" name="mimage" size=50></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" size=50></td>
			</tr>
			<tr>
				<td>special</td>
				<td><input type="text" name="special" size=50></td>
			</tr>
		</table>
		<input type="submit" value="저장"> <input type="reset"
         value="취소">
	</form>
	<input type="button" value="메뉴"
         onClick="location.href='menu'">
</body>
</html>