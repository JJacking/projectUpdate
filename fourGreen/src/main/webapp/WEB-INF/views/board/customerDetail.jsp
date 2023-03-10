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
      <h2>내 문의사항</h2>
      <table>
        <tr>
          <th>제목</th>
          <td colspan="5">${cVo.title}</td>
        </tr>
        <tr>
          <th>아이디</th>
          <td>${cVo.id}</td>
          <th>작성일</th>
          <td>${cVo.wirteDate}</td>
        </tr>
        <tr>
          <th>내용</th>
          <td colspan="5">${cVo.content}</td>
        </tr>
        <tr>
          	<td colspan="6" style="border: white; text-align:center">
		       <button type="button" class="w-btn w-btn-blue" onclick="location.href='customerBoardList'">돌아가기</button>
        	</td>
        </tr>
        
      </table>
     </div>
     <hr>
<jsp:include page="../bottomBar.jsp"/>
  </body>
  </html>