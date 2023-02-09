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
#boardTb th{

border: 0px;
background-color: #4F86C6;
padding: 10px;
}
</style>
</head>
<body>
<jsp:include page="../topBar.jsp" />
<div id="boardTb">
	<h2>내 문의사항</h2>
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
		</tr>
			<c:forEach items="${customer}" var="customer">
			<tr>
				<td>${customer.num}</td>
				<td><a href="customerDetail?num=${customer.num}">${customer.title}</a></td>
				<td>${customer.id}</td>
				<td> <fmt:formatDate value="${customer.wirteDate}"/> </td>
			</tr>
			</c:forEach>
		
		</table>
			<p><a href="customerWrite">문의 쓰기</a></p>
		
	<hr>
</div>
<jsp:include page="../bottomBar.jsp"/>
</body>
</html>