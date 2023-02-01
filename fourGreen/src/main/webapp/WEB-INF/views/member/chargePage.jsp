<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<style>
	.point{
		margin: 10% 20%;
	}
	.point input{
		height: 20px;
	}
</style>
</head>
<body>
<jsp:include page="../topBar.jsp" />
<c:if test="${empty user }">
	<script type="text/javascript">
		location.href='signIn';
	</script>
</c:if>
<div class="point">
<c:if test="${not empty user }">
	<form action="requestCharge" method="post" onsubmit="return check()">
		<h2>포인트충전 페이지입니다</h2>	
		<input type="hidden" id="id" name="id" value="${user.id }">
		<input type="number" id="charge" name="charge">
		<button type="submit">충전하기</button>
	</form>
</c:if>
</div>
<script type="text/javascript">
	function check(){
		let point = document.getElementById('charge').value;
		if(point <= 0){
			alert('1포인트 이상만 충전이 가능합니다.')
			return false;
		}
		
		let flag = confirm('정말 '+point+'포인트를 충전하시겠습니까?');	
		if(!flag){
			return false; 
		}else{
			alert('관리자의 승인까지 조금만 기다려주세요.');
		}
		
	}
</script>
<jsp:include page="../bottomBar.jsp"/>
</body>
</html>