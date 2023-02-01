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
<style>
	#comment{
	  margin: 10%;
	  width: 70%;
	  border-collapse: collapse;
	  font-size:15px;
	}
	#comment table{
	  width: 100%;
	
	}
	#comment th,td{
	  text-align: left;
	}
	
	#comment td{
	  border: 0;
      border-radius: 10px;
	  line-height: 30px;
	}
  	.commentBtn{
      border: 1px solid orange;
      text-align: center;
    }
    .commentRead{
      border: 1px solid white;
      background-color: #FFEEE4;
      border-radius: 10px;
    }
    .commentWrite{
      margin-top: 0;
      border: 1px solid orange;
      text-align: center;
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
      <h2>게시글 리스트</h2>
      <br>
      <table>
        <tr>
          <th>제목</th>
          <td colspan="5">${board.title}</td>
        </tr>
        <tr>
          <th>닉네임</th>
          <td>${board.nickName}</td>
          <th>작성일</th>
          <td>${board.wirteDate}</td>
          <th>조회수</th>
          <td>${board.readCount}</td>
        </tr>
        <tr>
          <th>내용</th>
          <td colspan="5">${board.content}</td>
        </tr>
        <tr>
          	<td colspan="6" style="border: white; text-align:center">
		          <button type="button" onclick="location.href='boardUpdate?num=${board.num}'">
		         	 게시글 수정</button>
		          <button type="button" onclick="removeCheck(cno)">
		         	게시글 삭제</button>
		          <button type="button" onclick="location.href='boardList'">목록 보기</button>
        	</td>
        </tr>
      </table>
     </div>
     <!-- 댓글 페이지 -->
     <div id="comment" class="commentRead">
     	<form action="commentUpdate" method="post" id="commentUpdate">
	     	<input type="hidden" name="comment" value="commentUpdate">
	     	<input type="hidden" name="cno" value="${board.num}">
      		<table>
      			<c:forEach items="${lists}" var="comment">
      			<tr>
      				<td><b>${comment.userName}</b></td>
	            <td style="width: 60%;">${comment.reContent}</td>
	            <td>${comment.reWirteDate}</td>
	            <td class="commentBtn">
	              <button type="button" onclick="commentUpdate()">수정</button><br>
	              <button type="button" id ="commentDelete" onclick="removeComment('${comment.cno}','${comment.num}')">삭제</button>
	            </td>
      			</tr>
      			</c:forEach>
      		</table>
      	</form>
      	</div>
      	<div id="comment">
      	<form action="commentWrite" method="POST">
      	<input type="hidden" name="num" value="${board.num}">
      		<table id="commentTb" class="commentWrite">
      			<tr>
      				<td>닉네임</td>
      				<td><input type="text" name="userName"></td>
      				<td>내용</td>
      				<td colspan="3"><textarea rows="3" cols="100" name="reContent" style="vertical-align: middle;"></textarea></td>
      				<td rowspan="2" class="commentBtn">
                		<button type="submit">댓글달기</button>
            		</td>
      			</tr>
      		</table>
		</div>
	</form>
	<hr>
<footer>
  <div class="footer">
    <a href="https://github.com/JJacking/fourGreen.git" style="text-decoration: none; list-style: none; color: white;" >@github 저장소 바로가기</a>
  </div>
</footer>
  </body>
  </html>