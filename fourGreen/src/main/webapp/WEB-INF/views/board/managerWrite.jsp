<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<style>
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
  <form action="managerWrite" method="post">
  <input type="hidden" name="command" value="managerWrite">
    <div id="boardTb">
    <table>
      <tr>
        <th>닉네임</th>
        <td><input type="text" name="MgName" placeholder="필수" required></td>
      </tr>
      <tr>
        <th>글제목</th>
        <td><input type="text" name="title" placeholder="필수" required></td>
      </tr>
      <tr>
        <th>본문</th>
        <td><textarea rows="15" style="width: 100%;" name="content"></textarea></td>
      </tr>
     </table>
	
      <div class="writeBtn">
        <button type="submit" class="w-btn w-btn-blue">글작성</button>
        <button type="reset" class="w-btn w-btn-blue">다시 작성</button>
        <button type="button" class="w-btn w-btn-blue" onclick="location.href='managerBoardList'">목록으로</button>
      </div>
    </div>
  </form>
<hr>
<jsp:include page="../bottomBar.jsp"/>
  </body>
  </html>