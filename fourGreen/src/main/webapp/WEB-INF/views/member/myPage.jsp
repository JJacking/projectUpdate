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
	.infoTb{
	  	width: 100%;
	  	margin: 10% 30% 10% 30%;
	  	font-size: 20px;
	  	border-collapse: collapse;
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

<div class="infoTb">
<form action="updateMember" method="post">
	<table border="1" style="width: 200px;">
		<tr>
			<td>
				아이디				
			</td>
			<td>
				<input type="hidden" name="id" value="${user.id }"/>
				<p id="userId">${user.id }</p>
			</td>
		</tr>
		<c:if test="${user.type == 'auction' }">
			<tr>
				<td colspan="2" style="text-align: center;">
					<button type="button" onclick="location.href='changePassword'">비밀번호 변경</button>			
				</td>
			</tr>
		</c:if>
		<tr>
			<td>
				닉네임				
			</td>
			<td>
				<input type="text" name="nickname" value="${user.nickname }"> 
			</td>
		</tr>
		<tr>
			<td>
				전화번호				
			</td>
			<td>
				<input type="text" name="phone" value="${user.phone }"> 
			</td>
		</tr>
		<tr>
			<td>
				주소				
			</td>
			<td>
				<input type="text" name="address" value="${user.address }"> 
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit">변경</button>
				<button type="button" onclick="history.back()">돌아가기</button>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="withdraw()">탈퇴하기</button>
			</td>
		</tr>
	</table>
</form>
</div>
	<script type="text/javascript">
		function withdraw(){
			let userId = $('#userId').text();
			let flag = confirm('정말 탈퇴하시겠습니까?');
			if(flag){
				location.href='withdrawalPage';
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