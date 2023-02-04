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
<jsp:include page="../topBar.jsp" />
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
        <c:if test="${not empty user and user.grade eq 0}"> 
        <tr>
          	<td colspan="6" style="border: white; text-align:center">
		          <button type="button" class="w-btn w-btn-blue" onclick="location.href='managerUpdate?mgNum=${mVo.mgNum}'">
		         	 게시글 수정</button>
		          <button type="button" class="w-btn w-btn-blue" onclick="location.href='managerDelete?mgNum=${mVo.mgNum}')">
		         	게시글 삭제</button>
		          <button type="button" class="w-btn w-btn-blue" onclick="location.href='managerBoardList'">목록 보기</button>
        	</td>
        </tr>
        </c:if>
        <c:if test="${not empty user and user.grade ne 0}"> 
        <tr>
          	<td colspan="6" style="border: white; text-align:center">
        	<button type="button" class="w-btn w-btn-blue" onclick="location.href='managerBoardList'">목록 보기</button>
        	</td>
        </tr>
        </c:if>
      </table>
     </div>
     <hr>
<jsp:include page="../bottomBar.jsp"/>
<script src="./resources/script/board.js"></script>
  </body>
  </html>