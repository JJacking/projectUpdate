<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<style>
	.changePw{
		margin: 10% 20%;
		 line-height: 30px;
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
<div class="changePw">
<form action="" method="post" onsubmit="return check()">
	<input type="hidden" name="id" value="${user.id }">
	<table>
		<tr>
			<td>
				현재 비밀번호
			</td>
			<td>
				<input type="password" name="password" id="password">
			</td>
		</tr>	
		<tr>
			<td>
				새로운 비밀번호
			</td>
			<td>
				<input type="password" name="newPassword" id="newPassword">
			</td>
		</tr>	
		<tr>
			<td>
				비밀번호 확인
			</td>
			<td>
				<input type="password" name="passwordChk" id="passwordChk">
			</td>
		</tr>	
		<tr>
			<td>
				<button type="button" onclick="history.back();">뒤로가기</button>
			</td>
			<td>
				<button type="submit">변경하기</button>
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
	
	<script type="text/javascript">
	
	 function check(){
		let newPassword = document.getElementById('newPassword').value;
		let passwordChk = document.getElementById('passwordChk').value;
		
		if(newPassword != passwordChk){
			alert('비밀번호와 비밀번호 확인이 다릅니다');
			return false;
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