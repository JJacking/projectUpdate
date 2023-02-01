<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<h1>정말 탈퇴하시겠습니까?</h1>
	<form action="withdraw" method="post">
		<input type="hidden" name="userId" value="${user.id }">
		<c:if test="${user.type eq 'auction' }">
		<h2>비밀번호를 입력해주세요</h2>
			<c:if test="${not empty msg }">
				<p style="color: red;">${msg }</p>
			</c:if>
			<input type="password" name="password">
			<button type="submit">탈퇴하기</button>
		</c:if>
		<c:if test="${user.type eq 'google' }">
			<input type="hidden" name="password" value="0">
			<button type="submit">탈퇴하기</button>
		</c:if>
	</form>
</body>
</html>