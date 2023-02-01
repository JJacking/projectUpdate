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
<jsp:include page="../topBar.jsp" />
  <form action="boardUpdate" method="post">
  <input type="hidden" name="comment" value="boardUpdate">
  <input type="hidden" name="num" value="${board.num}">
  <input type="hidden" name="nickName" value="${board.nickName}">
  <input type="hidden" name="email" value="${board.email}">
  <input type="hidden" name="pass" value="${board.pass}">
    <table id="boardTb">
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
<jsp:include page="../bottomBar.jsp"/>
  </body>
  </html>