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
	.changePw{
		margin: 10% 20%;
		 line-height: 30px;
	}
</style>
</head>
<body>
<jsp:include page="../topBar.jsp" />
<div class="changePw">
<form action="" method="post" onsubmit="return check()">
	<input type="hidden" name="id" value="${user.id }">
	<table>
		<tr>
			<td>
				현재 비밀번호
			</td>
			<td>
				<input type="password" name="password" id="password">
			</td>
		</tr>	
		<tr>
			<td>
				새로운 비밀번호
			</td>
			<td>
				<input type="password" name="newPassword" id="newPassword">
			</td>
		</tr>	
		<tr>
			<td>
				비밀번호 확인
			</td>
			<td>
				<input type="password" name="passwordChk" id="passwordChk">
			</td>
		</tr>	
		<tr>
			<td>
				<button type="button" onclick="history.back();">뒤로가기</button>
			</td>
			<td>
				<button type="submit">변경하기</button>
			</td>
		</tr>
	</table>
</form>
</div>
	<c:if test="${not empty msg }">
		<script type="text/javascript">
			alert('${msg}');
		</script>
	</c:if>
	
	<script type="text/javascript">
	
	 function check(){
		let newPassword = document.getElementById('newPassword').value;
		let passwordChk = document.getElementById('passwordChk').value;
		
		if(newPassword != passwordChk){
			alert('비밀번호와 비밀번호 확인이 다릅니다');
			return false;
		}
	 }
	</script>
<jsp:include page="../bottomBar.jsp"/>
</body>
</html>