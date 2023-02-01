<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<style>
p{
	text-align: right;
}
.col1{
width: 10%;
}
.col2{
  width: 57%;
}
.col3{
  width: 13%;
}
.col4{
  width: 10%;
}
.col5{
  width: 10%;
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
<div id="boardTb">
	<h2>공지사항</h2>
	<hr>
	<br>
	<table>
		<colgroup>
			<col class="col1">
			<col class="col2">
			<col class="col3">
			<col class="col4">
			<col class="col5">
		</colgroup>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${manager}" var="manager">
		<tr>
			<td>${manager.mgNum}</td>
			<td><a href="managerDetail?mgNum=${manager.mgNum}">${manager.title}</a></td>
			<td>${manager.mgName}</td>
			<td> <fmt:formatDate value="${manager.wirteDate}"/> </td>
			<td>${manager.readCount}</td>
		</tr>
		</c:forEach>
		</table>
			<p><a href="managerWrite">게시글 등록</a></p>
	<hr>
</div>
</body>
<footer>
  <div class="footer">
    <a href="https://github.com/JJacking/lastPj.git" style="text-decoration: none; list-style: none; color: white;" >@github 저장소 바로가기</a>
  </div>
</footer>
</html>