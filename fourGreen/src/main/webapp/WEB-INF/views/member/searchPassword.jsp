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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<jsp:include page="../topBar.jsp" />
<form action="searchPassword" method="get">
	<input type="hidden" id="message">
	<div class="mainSession">
	<table>
		<tr>
			<td>
				<input type="text" id="id" placeholder="(이메일)아이디를 입력해주세요">
			</td>
		</tr>
		<tr>
			<td>
				<button class="w-btn w-btn-blue"  type="button" onclick="sendEmail()">이메일 보내기</button>
			</td>
		</tr>
	</table>
	</div>
	<jsp:include page="../bottomBar.jsp"/>
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
						//read();
						sendEmail2();
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