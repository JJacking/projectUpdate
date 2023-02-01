<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
</head>
<body>
<jsp:include page="../topBar.jsp" />
<div id="boardTb" align="center">
	<h2>게시글 수정</h2>
	<form action="boardUpdate" method="post">
		<input type="hidden" name="command" value="boardUpdate">
		<input type="hidden" name="num" value="${board.num }">
		
		<table>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickName" value="${board.nickName}"  readonly></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" value="${board.email}" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" required>*필수</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${board.title}" required>*필수</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="15" cols="70" name="content" value="${board.content}"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">수정하기</button>
					<button type="button" onclick="location.href='boardDetail'">취소하기</button>
				</td>
			</tr>
		</table>
	</form>
	<hr>
<jsp:include page="../bottomBar.jsp"/>
</body>
</html>