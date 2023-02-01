<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
      <table>
        <tr>
          <th>제목</th>
          <td colspan="5">${mVo.title}</td>
        </tr>
        <tr>
          <th>닉네임</th>
          <td>${mVo.mgName}</td>
          <th>작성일</th>
          <td>${mVo.wirteDate}</td>
          <th>조회수</th>
          <td>${mVo.readCount}</td>
        </tr>
        <tr>
          <th>내용</th>
          <td colspan="5">${mVo.content}</td>
        </tr>
        <tr>
          	<td colspan="6" style="border: white; text-align:center">
		          <button type="button" onclick="location.href='managerUpdate?mgNum=${mVo.mgNum}'">
		         	 게시글 수정</button>
		          <button type="button" onclick="removeCheck(MgNum)">
		         	게시글 삭제</button>
		          <button type="button" onclick="location.href='managerBoardList'">목록 보기</button>
        	</td>
        </tr>
      </table>
     </div>
     <hr>
<footer>
  <div class="footer">
    <a href="https://github.com/JJacking/lastPj.git" style="text-decoration: none; list-style: none; color: white;" >@github 저장소 바로가기</a>
  </div>
</footer>
  </body>
  </html>