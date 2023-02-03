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
	.infoTb{
	  	width: 500px;
	  	margin: 10% 30% 10% 30%;
	  	font-size: 20px;
	  	border-collapse: collapse;
	  	line-height: 50px;
	}
	.w-btn{
	  padding: 20px;
	  margin-left: 10px;
	  text-alin:center;
	}
	
	
</style>
</head>
<body>
<jsp:include page="../topBar.jsp" />

<div class="infoTb">
<form action="updateMember" method="post">
	<table border="1" style="width: 400px;">
		<tr>
			<td>
				아이디				
			</td>
			<td>
				<input type="hidden" name="id" value="${user.id }"/>
				<p id="userId">${user.id }</p>
			</td>
		</tr>
		<c:if test="${user.type == 'auction' }">
			<tr>
				<td colspan="2" style="text-align: center;">
					<button type="button" class="w-btn w-btn-blue" onclick="location.href='changePassword'">비밀번호 변경</button>			
				</td>
			</tr>
		</c:if>
		<tr>
			<td>
				보유 포인트
			</td>
			<td>
				${user.point }
				<button type="button" class="w-btn w-btn-blue" onclick="location.href='charge'" style="position: relative; right: -60px;">충전하기</button> 
			</td>
		</tr>
		<tr>
			<td>
				닉네임				
			</td>
			<td>
				<input type="text" name="nickname" value="${user.nickname }"> 
			</td>
		</tr>
		<tr>
			<td>
				전화번호				
			</td>
			<td>
				<input type="text" name="phone" value="${user.phone }"> 
			</td>
		</tr>
		<tr>
			<td>
				주소				
			</td>
			<td>
				<input type="text" name="address" value="${user.address }"> 
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" class="w-btn w-btn-blue" onclick="withdraw()">탈퇴하기</button>
				<button type="button" class="w-btn w-btn-blue" onclick="history.back()">돌아가기</button>
				<button type="submit" class="w-btn w-btn-blue">변경</button>
			</td>
		</tr>
	</table>
</form>
</div>
	<script type="text/javascript">
		function withdraw(){
			let userId = $('#userId').text();
			let flag = confirm('정말 탈퇴하시겠습니까?');
			if(flag){
				location.href='withdrawalPage';
			}
		}
	</script>
	
<jsp:include page="../bottomBar.jsp"/>
</body>
</html>