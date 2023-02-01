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