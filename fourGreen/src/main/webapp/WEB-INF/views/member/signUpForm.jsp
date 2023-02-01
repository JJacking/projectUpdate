<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signUp</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	<h2>회원가입</h2>
	<form action="signUpCheck" method="post" onsubmit="return checkList()">
		<table border="1">
			<tr>
				<td>
					아이디(이메일)
				</td>
				<td>
					<input type="email" id="userId" name="id" placeholder="이메일 형식으로 입력해주세요" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="hidden" id="message">
					<input type="hidden" id="hiddenId">
					<input type="hidden" id="sendChk">
					<input type="button" id="overCheckBtn" onclick="overlappingCheck()" value="아이디 중복 체크"/>
					<input type="hidden" id="sendEmailBtn" onclick="sendEmail()" value="이메일 다시 보내기"/>
					<input type="hidden" id="emailCheckBtn" onclick="emailChk()" value="인증 확인"/>
					<p id="emailCheckForm" style="color:red; display: none;">이메일 인증이 완료되었습니다.</p>
				</td>
			</tr>
			<tr>
				<td>
					닉네임
				</td>
				<td>
					<input type="text" id="nickname" name="nickname" required="required">
				</td>
			</tr>
			<tr>
				<td>
					비밀번호 
				</td>
				<td>
					<input type="password" name="password" required="required">
				</td>
			</tr>
			<tr>
				<td>
					비밀번호 확인 
				</td>
				<td>
					<input type="password" name="password_chk" required="required">
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
				<td rowspan="3">
					주소 
				</td>
				<td>
					<a href="#" onclick="addressPop()">주소 검색</a>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="address1" name="address" readonly="readonly" style="border : none;">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="address2" name="address" required="required" placeholder="상세주소" style="width: 98%">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<button type="submit">회원가입</button>
				</td>
			</tr>
		</table>
	</form>
	 <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
    <script type="text/javascript">
    
    	function addressPop(){
    		//zonecode
    	    new daum.Postcode({
    	        oncomplete: function(data) {
    	        	document.getElementById('address1').value=data.roadAddress;
    	            alert(data.zonecode+' / '+data.roadAddress);
    	        }
    	    }).open();
    	}
    
    	function checkList(){
    		let userId = $('#userId').val();
    		let password = $('#password').val();
    		let password_chk = $('#password_chk').val();
    		let hideId = $('#hiddenId').val();
    		let addr1 = $('#address1').val();
    		let addr2 = $('#address2').val();
    		let sendChk = $('#sendChk').val();
    		
    		if(userId == null || userId ==''){
    			alert('아이디가 빈칸입니다. 입력해주세요');
    			return false;
    		}
    		if(hideId == null || hideId ==''){
    			alert('아이디 중복 체크를 해주세요');
    			return false;
    		}
    		if(addr1 == null || addr1 =='' || addr2 == null || addr2 ==''){
    			alert('주소를 입력해주세요.');
    			return false;
    		}
    		if(sendChk == null || sendChk ==''){
    			alert('이메일 확인을 해주세요');
    			return false;
    		}
    		if(password != password_chk){
    			alert('비밀번호와 비밀번호 확인이 다릅니다. 확인해주세요');
    			return false;
    		}
    		
    	}
   		
   		function emailChk(){
   			let userId = $('#userId').val();
   			$.ajax({
				type:"POST",
				url:"getAuth",
				datatype:"text",
				data:{
					email:userId
					},
				success:function(data){
					if(data == '1'){
						$('#userId').attr('readonly','readonly');
						$('#sendChk').attr('value',userId);
						$('#sendEmailBtn').attr('type','hidden');
						$('#emailCheckBtn').attr('type','hidden');
						$('#emailCheckForm').show();
					}else{
						alert('이메일 인증을 다시 진행해주세요.');
					}
				}
			});
   		}
   		
	    function emailCheck(email) {
	    	let reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    		
	    	if(reg.test(email) && (email.includes('@gmail.com') || email.includes('@naver.com'))){
	    		return true;
	    	}
	    	return false;
	    }    
	    
    	function overlappingCheck(){
    		let userId = $('#userId').val();
    		let eCheck = emailCheck(userId);
    		if(userId == null || userId == ''){
    			alert('아이디가 빈칸입니다. 입력해주세요.');
    		}else if(!eCheck){
    			alert('이메일 형식이 아닙니다 다시 확인해주세요.');	
    		}else {
    			$.ajax({
    				type:"POST",
    				url:"overlappingCheck",
    				datatype:"text",
    				data:{email:userId},
    				success:function(data){
    					if(data == 'null'){
    						let userId = $('#userId').val();
    						$('#overCheckBtn').attr('type','hidden');
    						alert('중복된 아이디가 아닙니다.');
							$('#hiddenId').attr('value',userId);
    						sendEmail();
    						alert('이메일을 확인 해주세요');
    						$('#sendEmailBtn').attr('type','button');
    						$('#emailCheckBtn').attr('type','button');
    					}else{
    						alert('중복된 아이디입니다.');
    					}
    				}
    			});
    		}
    		
    	}
	   
    	function sendEmail(){
    		let userId = $('#userId').val();
			$.ajax({
				type:"POST",
				url:"createRandomKey",
				data:{email:userId},
				datatype:"text",
				success:function(data){
					$('#message').attr('value',data);
					//sendEmail2();
					read();
					$('#message').attr('value','');
				}
			});
		}
    	
    	function sendEmail2(){
 		   emailjs.init('vr09l4bTjRJcS48gc');
 	        let templateParams  = {
	        		userId : document.getElementById('userId').value,
 	            message : document.getElementById('message').value
 	        }
 	        console.log(templateParams);
 	        emailjs.send('service_v12bpvx', 'template_0s5zzlu', templateParams).then(function(response){
 	            alert('이메일 전송 성공');
 	        }, function(error){
 	            console.log('Failed...', error);
 	        });
 	}
    	
    	function read(){
    		let message = $('#message').val();
    		alert('http://localhost:8085/auction/authCheck?key='+message);
    	}
    
    </script>
</body>
</html>