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
	.point{
		margin: 10% 20%;
	}
	.point input{
		height: 20px;
	}
</style>
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
<c:if test="${empty user }">
	<script type="text/javascript">
		location.href='signIn';
	</script>
</c:if>
<div class="point">
<c:if test="${not empty user }">
	<form action="requestCharge" method="post" onsubmit="return check()">
		<h2>포인트충전 페이지입니다</h2>	
		<input type="hidden" id="id" name="id" value="${user.id }">
		<input type="number" id="charge" name="charge">
		<button type="submit">충전하기</button>
	</form>
</c:if>
</div>
<script type="text/javascript">
	function check(){
		let point = document.getElementById('charge').value;
		if(point <= 0){
			alert('1포인트 이상만 충전이 가능합니다.')
			return false;
		}
		
		let flag = confirm('정말 '+point+'포인트를 충전하시겠습니까?');	
		if(!flag){
			return false; 
		}else{
			alert('관리자의 승인까지 조금만 기다려주세요.');
		}
		
	}
</script>
<footer>
  <div class="footer">
    <a href="https://github.com/JJacking/fourGreen.git" style="text-decoration: none; list-style: none; color: white; width:100%;" >@github 저장소 바로가기</a>
  </div>
</footer>
</body>
</html>