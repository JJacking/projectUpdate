<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<style>
	 	
	.nav{
	display: flex;
	justify-content: space-between;
	padding: 20px;
	margin-bottom: 0px;
	background-color: white;
	}
	.nav a{
	text-decoration: none;
	color: black;
	}
	hr{
	margin-top: 0px;
	margin-bottom: 0px;
	}
	
	.nav .nav-menu ul{
	list-style: none;
	}
	.nav .nav-menu li{
	display: inline-block;
	margin-right: 20px;
	}
	.nav-menu{
		padding-top: 20px;
		vertical-align: bottom;
	}
	
	.nav-menu li:hover{
		font-weight: bold;
		background-color: white;
	}
	
	.nav .nav-menu li ul{
	display: none;
	}
	
	.nav .nav-menu li:hover ul{
	display: block;
	width: 130px;
	height: 60px;
	background-color: white;
	}
	
	
	.nav #sub-menu{
	position: absolute;
	z-index: 2;
	line-height: 30px;
	background-color: white;
	}

	.nav #sub-menu li{
	list-style: none;
	background-color: white;
	}
	
	
	.nav #sub-menu a{
	background-color: white;
	text-decoration: none;
	padding: 10px;
	padding-bottom: 0px;
	color: gray;
	}
	
	.nav #sub-menu a:hover{
		color: black;
		font-weight: bold;
	}
	
	
	.logo img{
		width: 60px;
		height: 50px;
	}
	
	.mypage{
		float: right;
	}
	
	.mypage li{
		
		list-style: none;
		display: inline-block;
	}

</style>
</head>
<body>
	<div class="nav">
  		<div class="logo"><a href="${pageContext.request.contextPath}"><img src="./resources/img/logo3.png"></a></div>
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
	      <li><a href="customerBoard">고객센터</a></li>
     </ul>
   	<c:if test="${empty user}"> 
        <div class="loginBtn">
            <button type="button" class="w-btn w-btn-blue" onclick="location.href='signInForm'">로그인</button>
            <button type="button" class="w-btn w-btn-blue" onclick="location.href='signUp'">회원가입</button>
        </div>
    </c:if>
   <c:if test="${not empty user}">
        <div class="mypage">
      	<ul>
      		<li><a href="/auction/signOut">로그아웃</a></li>
	        <li><a href="/auction/myPage">내정보</a></li>
	        <li><a href="/auction/charge">포인트충전/조회</a></li>
        </ul>
        </div>
    </c:if>
</div>
</body>
</html>