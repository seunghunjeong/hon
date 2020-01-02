<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:if test="${uid != null}">
		<button onClick="location.href='logout'" style="background:darkred;color:white;">로그아웃</button>
		아이디:${uid}
	</c:if>