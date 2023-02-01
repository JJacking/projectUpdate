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
<jsp:include page="../topBar.jsp" />
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