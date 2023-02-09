<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<style>
*{
	padding: 0;
} 
#outter{
	width: 100%; 
}  
.infoTb{
  	width: 750px;
  	height: 650px;
  	padding-top: 50px; 
  	margin: 0 auto;
  	font-size: 20px;
  	border-collapse: collapse;
  	line-height: 50px;
}

input{
	width: 300px;
	padding: 0 5px;
	height: 40px;
	font-size: 16px;
	border: 1px solid black;
}

</style>
</head>
<body>
<jsp:include page="../topBar.jsp" />
<div id="outter">
	<div style="border: 1px solid black; border-radius:10px; padding:10px; width: 500px; margin: 100px auto;">
		<h1>정말 탈퇴하시겠습니까?</h1>
		<form action="withdraw" method="post" onsubmit="return check()">
			<input type="hidden" name="userId" value="${user.id }">
			<c:if test="${user.type eq 'auction' }">
			<h2>비밀번호를 입력해주세요</h2>
				<c:if test="${not empty msg }">
					<p style="color: red;">${msg }</p>
				</c:if>
				<input type="password" name="password">
				<button class="w-btn w-btn-blue" type="submit">탈퇴하기</button>
			</c:if>
			<c:if test="${user.type eq 'google' }">
				<input type="hidden" name="password" value="0">
				<button class="w-btn w-btn-blue" style="" type="submit">탈퇴하기</button>
			</c:if>
		</form>
	</div>
</div>
	<jsp:include page="../bottomBar.jsp"/>
	<script type="text/javascript">
		function check() {
			let flag = confirm('정말 탈퇴하시겠습니까?');
			if(flag){
				alert('탈퇴가 완료되었습니다.');
				return true;
			}
			return false;
		}
	</script>
</body>
</html>