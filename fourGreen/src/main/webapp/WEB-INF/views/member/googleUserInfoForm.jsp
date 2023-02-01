<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<form action="googleUserInfo" method="post">
	<table>
		<tr>
			<td>
				아이디		
			</td>
			<td>
				${user.id }
				<input type="hidden" name="id" value="${user.id }">
			</td>
		</tr>
		<tr>
			<td>
				닉네임 		
			</td>
			<td>
				${user.nickname }
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
			<td>
				주소 		
			</td>
			<td>
				<input type="text" name="address" required="required">			
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit">정보 등록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>