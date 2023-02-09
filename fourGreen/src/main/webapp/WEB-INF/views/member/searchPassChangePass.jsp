<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<style>
	
	.w-btn{
	  padding: 20px;
	  margin-left: 10px;
	}
	
	
	.mainSession{
	  top: 50%;
	  left: 50%;
      margin: 5% 20%;
	  width: 60%;
	  height: 600px;
	  background-color: white;
	 
	  
	  padding-left: 50px;
	  padding-right: 0;
	  line-height: 80px;
	}
	
	.mainSession table{
		width:100%;
	 	border: 1px solid #CE6D39;
	 	border-radius: 10px;
	}
	
	.mainSession input{
	  width: 80%;
	  padding-top: 0px;
	  padding-left: 15px;
	  height: 40px;
	  font-size: 16px;
	  border: none;
	}
	.mainSession th{
	  position: relative;
	  border-bottom: 2px solid lightgray;
	  width: 80%;
	  font-weight: nomal;
	}
	.mainSession td{
		border: 1px solid white;
	}
	.mainSession a{
	  text-decoration: none;
	  color: black;
	}
	#overCheckBtn{
		width: 150px;
	}
	
</style>
</head>
<body>
<jsp:include page="../topBar.jsp" />
<form action="searchPassChangePass" method="post" onsubmit="return check()">
	<input type="hidden" name="id" value="${userid }">
	<div class="mainSession">
	<table>
		<tr>
		 	<td>
		 		<input placeholder="새 비밀번호" type="password" name="newPass" id="newPass">
		 	</td>
		</tr>
		<tr>
		 	<td>
		 		<input placeholder="비밀번호 확인" type="password" name="newPassChk" id="newPassChk">
		 	</td>
		</tr>
		<tr>
		 	<td>
		 		<button class="w-btn w-btn-blue" type="submit">비밀번호 변경</button>
		 	</td>
		</tr>
	
	</table>
	</div>
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