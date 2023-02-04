<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<style type="text/css">
  #boardTb input{
    width: 100%;
    height: 23px;
  }
  .writeBtn{
    text-align: center;
  }
</style>
</head>
<body>
<jsp:include page="../topBar.jsp" />
  <form action="managerUpdate" method="post">
  <input type="hidden" name="MgNum" value="${mVo.mgNum}">
  <div id="boardTb">
    <table>
      <tr>
        <th>글제목</th>
        <td><input type="text" name="title" value="${mVo.title}" required></td>
      </tr>
      <tr>
        <th>본문</th>
        <td><textarea rows="15" style="width: 100%;" name="content">${mVo.content}</textarea></td>
      </tr>
    </table>
    <div class="writeBtn">
          <button class="w-btn w-btn-blue" type="submit">수정하기</button>
          <button class="w-btn w-btn-blue" type="reset">다시 작성</button>
          <button class="w-btn w-btn-blue" type="button" onclick="location.href='managerBoardList'">목록으로</button>
     </div>
  </div>
  </form>
  <hr>
<jsp:include page="../bottomBar.jsp"/>
  </body>
  </html>