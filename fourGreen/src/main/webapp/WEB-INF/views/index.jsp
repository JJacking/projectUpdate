<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
<title>메인페이지</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
h2{
	text-align: left;
}

.slider{
  width: 100%;
  height: 600px;
  position: relative;
  margin: 0 auto;
  overflow: hidden;
}
.slider input[type=radio]{
  display: none;
}
ul.imgs{
  padding: 0;
  margin: 0;
  list-style: none;    
}
ul.imgs li{
  position: absolute;
  left: 640px;
  transition-delay: 1s; 
  background-size: cover;
  padding: 0;
  margin: 0;
}
.bullets{
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  bottom: 20px;
  z-index: 2;
}
.bullets label{
  display: inline-block;
  border-radius: 50%;
  background-color: rgba(0,0,0,0.55);
  width: 20px;
  height: 20px;
  cursor: pointer;
}

.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
  background-color: black;
}
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
  background-color: black;
}
.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
  background-color: black;
}

.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
  left: 0;
  transition: 0.5s;
  z-index:1;
}
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
  left: 0;
  transition: 0.5s;
  z-index:1;
}
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
  left: 0;
  transition: 0.5s;
  z-index:1;
}

.main{
width: 1050px;
height: 1500px;
margin-left: 20%;
margin-right: 20%;
}

.img-board{
text-align: left;
margin-top: 10px;
margin-left: 10px;

height: 800px;
}
.img-board ul{

list-style: none;
}

.img-board li{
display: inline-block;
border: 1px solid lightgray;
margin-right: 30px;
margin-bottom: 30px;
}

.img-board li img{
width: 150px;
height: 200px;
margin-bottom: 50px;
margin-right: 20px;
margin: auto;
padding: auto;
}

.popular-board{
float: left;
margin-left: 5px;
width: 500px;
height: 600px;
}
.new-board{
float: right;
margin-right: 5px;
width: 500px;
height: 600px;
}
.managerBoard{
float: left;
margin-left: 10px;
width: 40%;
height: 600px;
}

.managerBoard table{
	width: 100%;
	border-collapse: collapse;
	font-size:12px;
	line-height: 24px;
	text-align: center;
}

.managerBoard td,th{
	border: 1px solid #CE6D39;
	padding: 5px;
}
.managerBoard th{
	background-color: #FFEEE4;
}

.managerBoard a{
  color: black;
  text-decoration: none;
}

.managerBoard a:hover{
  text-decoration: underline;
  color: lightgreen;
}


.userBoard{
float: right;
margin-right: 20px;
width: 40%;
height: 600px;
text-align: center;
}

.userBoard > table{
	width: 100%;
	border-collapse: collapse;
	font-size:12px;
	line-height: 24px;
	text-align: center;
}

.userBoard td,th{
	border: 1px solid #CE6D39;
	padding: 5px;
}
.userBoard th{
	background-color: #FFEEE4;
}

.userBoard a{
  color: black;
  text-decoration: none;
}

.userBoard a:hover{
  text-decoration: underline;
  color: lightgreen;
}
</style>
</head>

<body>
	<jsp:include page="topBar.jsp" />
  <hr>
<header>
  <div class="slider">
    <input type="radio" name="slide" id="slide1" checked>
    <input type="radio" name="slide" id="slide2">
    <input type="radio" name="slide" id="slide3">
    <ul id="imgholder" class="imgs">
        <li><img src="resources/img/ex11.jpg"></li>
        <li><img src="resources/img/ex22.jpg"></li>
        <li><img src="resources/img/ex33.jpg"></li>
    </ul>
    <div class="bullets">
        <label for="slide1">&nbsp;</label>
        <label for="slide2">&nbsp;</label>
        <label for="slide3">&nbsp;</label>
    </div>
  </div>
</header>
<hr>
<div class="main">
  <div class="img-board">
    <div class="popular-board">
      <h2>인기</h2>
      <hr>
      <br>
      <ul>
      	<c:forEach var="item" items="${hotProductArr }">
	   		<li>
	   			<a href="/auction/product/selectOne?num=${item.num}">
			        <img src="/img/${item.productPic }" style="width: 200px; height: 250px;">
	   			</a>
	       	</li>
      	</c:forEach>
      </ul>
    </div>
    <div class="new-board">
      <h2>NEW</h2>
      <hr>
      <br>
      <ul>
        <c:forEach var="item" items="${newProductArr }">
	   		<li>
	   			<a href="/auction/product/selectOne?num=${item.num}">
			        <img src="/img/${item.productPic }" style="width: 200px; height: 250px;">
	   			</a>
	       	</li>
      	</c:forEach>
      </ul>
    </div>
  </div>
  <hr>
  <br>
  <br>
  <div class="managerBoard">
    <h2>공지사항</h2>
    <hr>
    <br>
    <table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${manager}" var="manager">
			<tr>
				<td>${manager.mgNum}</td>
				<td>${manager.title}</td>
				<td>${manager.mgName}</td>
				<td>${manager.wirteDate}</td>
			</tr>
		</c:forEach>
	</table>
  </div>
  <div class="userBoard">
    <h2>자유게시판</h2>
    <hr>
    <br>
      <table class="List">
        <tr>
          <th>번호</th>
          <th colspan="3">제목</th>
          <th>작성자</th>
        </tr>
        <c:forEach items="${list}" var="board">
          <tr>
            <td>${board.num}</td>
            <td colspan="3">${board.title}</td>
            <td>${board.nickName}</td>
          </tr>
        </c:forEach>
      </table>
  </div>
</div>
<hr>
	<jsp:include page="bottomBar.jsp"/>
</body>

</html>