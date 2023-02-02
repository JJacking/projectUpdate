<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signIn</title>
<title>로그인</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>

  <style>
    *{
      margin: auto;
      padding: auto;
    }

    #head{
      text-align: left;
      width: 80%;
      margin-top: 5%;
      margin-left: 10%;
      color: black;
    }
 
	.w-btn{
	  padding: 20px;
	  margin-left: 10px;
	  width: 150px;
	}
	.loginForm{
	  top: 50%;
	  left: 50%;
      margin: 10% 30%;
	  width: 40%;
	  background-color: white;
	  border: 1px solid #CE6D39;
	  border-radius: 10px;
	  padding-left: 50px;
	  padding-right: 50px;
	  line-height: 80px;
	}
	.loginForm table{
		width:100%;
	}
	
	.loginForm input{
	  width: 80%;
	  padding: 0 5px;
	  height: 40px;
	  font-size: 16px;
	  border: none;
	}
	.loginForm th{
	  position: relative;
	  border-bottom: 2px solid lightgray;
	  width: 80%;
	  font-weight: nomal;
	}
	.loginForm td{
		border: 1px solid white;
	}
	.loginForm a{
	  text-decoration: none;
	  color: black;
	}
	.loginForm a:hover{
		color: #CE6D39;
	}
  </style>
</head>
<body>
<jsp:include page="../topBar.jsp" />
 <div id="head">
   <h2>로그인페이지</h2>
   <hr>
 </div>
 <div class="loginForm">
 <form action="signInCheck" method="post">
	<table>  
	 	<tr> 
	        <th> <input type="email" name="id" placeholder="아이디(이메일형식)" required="required"></td>
       		
	 	</tr>
	 	<tr> 
	 		<th><input type="password" name="password" placeholder="비밀번호" required="required"></td>
	 	</tr>
	 	<tr>
	 		<td><button type="submit" class="w-btn w-btn-blue" >로그인</button>&nbsp;&nbsp;&nbsp;
	 		<button type="button" class="w-btn w-btn-blue" onclick="location.href='signUp'">회원가입</button></td>
	 	</tr>
	 	<tr>
	 		<td>
	 			<!--  -->
					<div id="g_id_onload"
				     data-client_id="1054940879188-tbhtj7bj8gu095tll389nrp294ivhaqv.apps.googleusercontent.com"
				     data-callback="handleCredentialResponse"
				     data-login_uri="http://localhost:8085/auction">
				     <!-- data-ux_mode="redirect" -->
					</div>
					<div class="g_id_signin" data-type="standard" data-theme="filled_blue" data-text="signin" 	data-size="medium"></div>
					
					<script>
						let tokenId;
						function signOut(){
							google.accounts.id.revoke(tokenId, done => {
							    console.log(done.error);
							  });
						}
						
						function handleCredentialResponse(response) {
							const responsePayload = parseJwt(response.credential);
							tokenId = responsePayload.sub;
							let name = responsePayload.name;
							let email = responsePayload.email;
							googleSignInAjax(email,name);
						};
						
						function googleSignInAjax(email,name){
							$.ajax({
								type:"post",
								url:"googleSignIn",
								datatype:"text",
								data:{
									email : email,
									nickname : name
								},
								success:function(data){
									if(data == 'denied'){
										alert('이미 존재하는 아이디입니다.');
										signOut();
									}else if(data == 'signUp'){
										alert('정보 등록 페이지로 이동합니다.');
										window.location.replace("googleUserInfo");
									}else if(data == 'googleUserInfo'){
										window.location.replace("googleUserInfo");
									}else if(data == 'signIn'){
										window.location.replace("signIn");
									}
								}
							});
						}
					
						function parseJwt (token) {
							var base64Url = token.split('.')[1];
							var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
							var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
							    return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
							}).join(''));
							
							return JSON.parse(jsonPayload);
						};
					</script>
			</td>
	 	</tr>
	 	<tr>
	      	<td>
	          <a href="searchId">아이디 찾기</a>&nbsp; &nbsp; &nbsp;
	          <a href="searchPassword">비밀번호 찾기</a>
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
<jsp:include page="../bottomBar.jsp"/>

</body>

</html>