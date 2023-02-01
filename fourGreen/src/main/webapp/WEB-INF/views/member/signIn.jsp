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
      width: 60%;
      margin-top: 5%;
      margin-left: 10%;
      color: lightskyblue;
    }
    
    .loginForm{
      width: 60%;
      height: 200px;
      background-color: rgb(209, 231, 209);
      border-radius: 10px;
      margin: 10% 30% 10% 10%;
      padding: 0px;
      line-height: 50px;
      text-align: center;
    }

   
    .loginForm input{
      height: 20px;
      font-size: 15px;
    }

    .loginForm a{
      text-decoration: none;
      color: black;
      text-align: center;
    }
    
	.logbtn{
	  padding: 20px;
	  margin-left: 10px;
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
	 		<td>아이디 : <input type="email" name="id" required="required"></td>
       		<td rowspan="2"><button type="submit" class="logbtn">로그인</button></td>
	 	</tr>
	 	<tr> 
	 		<td>비밀번호 : <input type="password" name="password" required="required"></td>
	 	</tr>
	 	<tr>
			<td>
	 			<a href="searchId">아이디 찾기</a>
	 			<a href="searchPassword">비밀번호 찾기</a>
	 		</td>
	 	</tr>
	 	<tr>
	 		<td>
				<div id="g_id_onload"
			     data-client_id="1054940879188-tbhtj7bj8gu095tll389nrp294ivhaqv.apps.googleusercontent.com"
			     data-callback="handleCredentialResponse"
			     data-login_uri="http://localhost:8085/auction">
			     <!-- data-ux_mode="redirect" -->
				</div>
				<div class="g_id_signin" data-type="standard" data-theme="filled_blue" data-text="signin_with" data-width=400 data-size=large></div>
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
</body>

</html>