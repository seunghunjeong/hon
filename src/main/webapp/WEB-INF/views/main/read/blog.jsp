<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블로그 검색</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="../resources/hon.css">
<!--  css -->
</head>
<body>
	<h4>블로그 리뷰</h4>
	<table id="tblB"></table>
	<script id="tempB" type="text/x-handlebars-template">
		{{#each items}}
			<tr>
				<td>
					<a href="{{link}}">{{{title}}}</a> <br> 
					<small>{{bloggername}} | {{postdate}}</small>
				</td>
			</tr>
		{{/each}}
	</script>
</body>
<script>
	var keyword = "구월동 고베 규카츠";
	var start = 1;

	getListB();
	function getListB() {
		$.ajax({
			type : "get",
			url : "blog.json",
			data : {
				"keyword" : keyword,
				"start" : start
			},
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#tempB").html());
				$("#tblB").append(temp(data));
			}
		});
	}
	
	//더보기
// 	$("#btnMore").on("click", function() {
// 		start += 1;
// 		getListB();
// 	});
</script>
</html>