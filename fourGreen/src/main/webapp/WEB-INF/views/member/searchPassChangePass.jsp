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
<form action="searchPassChangePass" method="post" onsubmit="return check()">
	<input type="hidden" name="id" value="${userid }">
	<table>
		<tr>
			<td>
				새 비밀번호
			</td>
		 	<td>
		 		<input type="password" name="newPass" id="newPass">
		 	</td>
		</tr>
		<tr>
			<td>
				비밀번호 확인
			</td>
		 	<td>
		 		<input type="password" name="newPassChk" id="newPassChk">
		 	</td>
		</tr>
		<tr>
		 	<td>
		 		<button type="submit">비밀번호 변경</button>
		 	</td>
		</tr>
	</table>
	
</form>
<jsp:include page="../bottomBar.jsp"/>
<script type="text/javascript">
	function check(){
		let newPass = document.getElementById('newPass').value;
		let newPassChk = document.getElementById('newPassChk').value;
		if(newPass != newPassChk){
			alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
			return false;
		}	
	}
	
</script>
</body>
</html>