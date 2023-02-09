<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<style>
	
	.w-btn{
	  padding: 20px;
	  margin-left: 10px;
	}
	.head{
		text-align: left;
	    width: 80%;
	    margin-top: 5%;
	    margin-left: 10%;
	    color: black;
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
<div class="head">
	<h2>휴대폰 번호를 입력해주세요</h2>
</div>
<div class="mainSession">
<table>
	<tr>
		<td>
			<input type="text" placeholder="휴대폰 번호" name="phone" id="phone">
			<button type="button" class="w-btn w-btn-blue" onclick="test()">아이디 찾기</button>
		</td>
	</tr>
</table>
</div>
<script type="text/javascript">
	function test(){
		let tr;
		let td;
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
						        tr = document.createElement('tr');
						        td = document.createElement('td');
						        td.innerHTML = arr[i];
						        td.setAttribute('class','cls');
						        table.appendChild(caption);
						        table.appendChild(tr);
						        tr.appendChild(td);
						        originTable.after(table);
				      		}
				      	}
					}else{
						td = document.getElementsByClassName('cls');
							
						for(let c =0;c<td.lenth;c++){
							td[c].remove();
						}
						alert('조회되는 아이디가 없습니다. 다시 입력해주세요.');
					}
					
				}
				
			});
		}
	}
</script>
<jsp:include page="../bottomBar.jsp"/>
</body>
</html>