<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
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
  <form action="boardUpdate" method="post">
  <input type="hidden" name="comment" value="boardUpdate">
  <input type="hidden" name="num" value="${board.num}">
    <table id="boardTb">
      <tr>
        <th>닉네임</th>
        <td><input type="text" name="nickName" value="${board.nickName}" required>*필수</td>
      </tr>
      <tr>
        <th>이메일</th>
        <td><input type="email" name="email" value="${board.email}" required>*필수</td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pass" value="${board.pass}" required>*필수</td>
      </tr>
      <tr>
        <th>글제목</th>
        <td><input type="text" name="title" value="${board.title}" required>*필수</td>
      </tr>
      <tr>
        <th>본문</th>
        <td><textarea rows="15" cols="70" name="content">${board.content}</textarea></td>
      </tr>
      <tr>
        <td colspan="2">
          <button type="submit">수정하기</button>
          <button type="reset">다시 작성</button>
          <button type="button" onclick="location.href='boardList'">목록으로</button>
        </td>
      </tr>
      
    </table>
  </form>
  <hr>
<footer>
  <div class="footer">
    <a href="https://github.com/JJacking/lastPj.git" style="text-decoration: none; list-style: none; color: white;" >@github 저장소 바로가기</a>
  </div>
</footer>
  </body>
  </html>