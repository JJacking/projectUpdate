<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<div class="nav">
  <div><h2><a href="/">logo</a></h2></div>
     <ul class="nav-menu">
      <li><a href="product">물품보기</a></li>
      <li><a href="newAuction">물품등록</a></li>
      <li>
        <a href="#">게시판</a>
          <ul id="sub-menu">
            <li><a href="managerBoardList">공지사항</a></li>
            <li><a href="boardList">자유게시판</a></li>
          </ul>
      </li>
      <li><a href="#">고객센터</a></li>
     </ul>
   	<c:if test="${empty user}"> 
        <div class="loginBtn">
            <button type="button" onclick="location.href='signInForm'">로그인</button>
            <button type="button" onclick="location.href='signUp'">회원가입</button>
        </div>
    </c:if>
     <c:if test="${not empty user }">
        <p>${user.nickname}님 환영합니다</p>
        <p><a href="signOut">로그아웃</a></p>
        <p><a href="myPage">내정보</a></p>
        <p><a href="charge">포인트충전/조회</a></p>
    </c:if>
</div>
<form action="searchPassword" method="get">
	<input type="hidden" id="message">
	<table>
		<tr>
			<td>
				<input type="text" id="id" placeholder="(이메일)아이디를 입력해주세요">
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" onclick="sendEmail()">이메일 보내기</button>
			</td>
		</tr>
	</table>
	
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
	<script type="text/javascript">
		function sendEmail(){
			let userId = $('#id').val();
			$.ajax({
				type:"POST",
				url:"searchPassSendEmail",
				data:{email:userId},
				datatype:"text",
				success:function(data){
					if(data != 'null'){
						$('#message').attr('value',data);
						read();
						//sendEmail2();
					}else{
						alert('존재하지 않는 아이디입니다. 다시 확인해주세요.');
					}
				}
			});
		}
		
		function read(){
			alert($('#message').val());
		}
		
		function sendEmail2(){
 		   emailjs.init('vr09l4bTjRJcS48gc');
 	        let templateParams  = {
        		userId : document.getElementById('id').value,
 	            message : document.getElementById('message').value
 	        }
 	        console.log(templateParams);
 	        emailjs.send('service_v12bpvx', 'template_qvndttt', templateParams).then(function(response){
 	            alert('이메일을 전송했습니다. 확인해주세요');
 	        }, function(error){
 	            console.log('Failed...', error);
 	        });
 		}
	</script>
</form>
</body>
</html>