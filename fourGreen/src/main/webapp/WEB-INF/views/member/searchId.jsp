<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<jsp:include page="../topBar.jsp" />
	<h2>휴대폰 번호를 입력해주세요</h2>
<table>
	<tr>
		<td>
			휴대폰 번호
		</td>
		<td>
			<input type="text" name="phone" id="phone">
			<button type="button" onclick="test()">아이디 찾기</button>
		</td>
	</tr>
</table>

<script type="text/javascript">
	function test(){
		let phoneNum = $('#phone').val();
		if(phoneNum == null || phoneNum == ''){
			alert('휴대폰 번호를 입력해주세요');
		}else{
			$.ajax({
				type:"post",
				url:"searchId",
				datatype:"text",
				data:{phone:phoneNum},
				success:function(data){
					if(data != 'null'){
						let str = data;
					 	let arr = str.split(',');
		      			let originTable = document.getElementsByTagName('table')[0];
				        let table = document.createElement('table');
				        table.setAttribute('border','1');
				        table.setAttribute('style','width:150px');
				        let caption = document.createElement('caption');
				        caption.innerHTML= '회원 아이디 목록';
				      	for(i in arr){
				      		if(arr[i] != ''){
						        let tr = document.createElement('tr');
						        let td = document.createElement('td');
						        td.innerHTML = arr[i];
						        table.appendChild(caption);
						        table.appendChild(tr);
						        tr.appendChild(td);
						        originTable.after(table);
				      		}
				      	}
					}else{
						alert('조회되는 아이디가 없습니다. 다시 입력해주세요.');
					}
					
				}
				
			});
		}
	}
</script>
</body>
</html>