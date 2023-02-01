<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../topBar.jsp" />
	<h1>정말 탈퇴하시겠습니까?</h1>
	<form action="withdraw" method="post">
		<input type="hidden" name="userId" value="${user.id }">
		<c:if test="${user.type eq 'auction' }">
		<h2>비밀번호를 입력해주세요</h2>
			<c:if test="${not empty msg }">
				<p style="color: red;">${msg }</p>
			</c:if>
			<input type="password" name="password">
			<button type="submit">탈퇴하기</button>
		</c:if>
		<c:if test="${user.type eq 'google' }">
			<input type="hidden" name="password" value="0">
			<button type="submit">탈퇴하기</button>
		</c:if>
	</form>
	<jsp:include page="../bottomBar.jsp"/>
</body>
</html>