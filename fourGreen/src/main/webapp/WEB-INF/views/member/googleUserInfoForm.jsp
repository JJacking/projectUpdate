<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../topBar.jsp" />
<form action="googleUserInfo" method="post">
	<table>
		<tr>
			<td>
				아이디		
			</td>
			<td>
				${user.id }
				<input type="hidden" name="id" value="${user.id }">
			</td>
		</tr>
		<tr>
			<td>
				닉네임 		
			</td>
			<td>
				${user.nickname }
			</td>
		</tr>
		<tr>
			<td>
				휴대폰 		
			</td>
			<td>
				<input type="text" name="phone" required="required">
			</td>
		</tr>
		<tr>
			<td>
				주소 		
			</td>
			<td>
				<input type="text" name="address" required="required">			
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit">정보 등록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>