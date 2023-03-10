<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
		.main{
			width: 70%;
			margin-top: 5%;
			margin-left: 10%;
		}
		.menuBar{
			box-sizing: border-box;
			vertical-align: middle;
			width: 80%;
			margin-top: 5%;
			margin-left: 30%;
			margin-bottom: 20%;
			color: black;
		}
		.menuBar li{
			float: left;
			list-style: none;
			display: inline-block;
			border-right:1px solid lightgray;
			padding:20px;
			background-color: rgba(231, 231, 231, 0.921);
		}
		
		.menuBar li:hover{
			background-color: rgb(176, 176, 240);
		}
		
		.menuBar li a{
			display:block;
			text-decoration: none;
			text-align:center;	
			padding: 0;
	    color: black;
		}
	  .clear{
	     clear:both;
	     margin-top: 50px;
	     margin-bottom: 50px;
	  }
	
	.top5{
    	float: left;
		width: 40%;
		border-bottom: 1px solid lightgray;
		font-size:16px;
		line-height: 40px;
		text-align: left;
		margin-top: 50px;
		margin-bottom: 50px;
		}
	  .top5 li{
	    list-style: none;
	  }
		
		.top5 a{
		  color: black;
		  text-decoration: none;
		}
	
	  .top5 a:hover{
	    color: rgb(138, 138, 248);
	  }
	
	.userBoard a:hover{
	  text-decoration: underline;
	  color: lightgreen;
	}
	
	.leftCenter{
    clear: both;
	margin-top: 5%;
	margin-bottom: 5%;
	width: 40%;
  }

  .leftCenter li{
    list-style: none;
    font-size: 20px;
  }

  .Center{
  	clear: both;
  	margin: auto;
	margin-top: 100px;
	margin-bottom: 100px;
    float: left;
    width: 1000px;
    text-align: center;
    box-sizing: border-box;
  }
  .Center ul{
    list-style: none;
   
  }
  .Center li{
    background-color: rgb(230, 230, 230);
    display: inline-block;
    padding:20px;
    border-radius: 15px;
    color: rgba(108, 108, 108, 0.781);
  }
  .managerBoard{
	float: left;
	margin-left: 10px;
	width: 40%;
	height: 600px;
	margin-top: 50px;
	margin-bottom: 50px;
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
	
	
</style>
</head>
<body>
<jsp:include page="../topBar.jsp" />
	<div class="main">
	<h2>고객센터</h2>
	<hr>
	<div class="menuBar">
		<ul>
			<li><a href="#scroll1" class="scroll_move">자주묻는질문</a></li>
			<li><a href="customerWrite">문의하기</a></li>
			<li><a href="managerBoardList">공지사항</a></li>
			<li><a href="customerBoardList">내 문의사항</a></li>
		</ul>
	</div>
	<div class="leftCenter">
      <ul>
        <li style="float: left;"><img src="./resources/img/logo3.png"></li>
      </ul>
      <ul style="margin-left: 100px;">
        <li>031-000-0000</li>
        <li>평일 : 09:00 ~ 18:00</li>
        <li>점심 : 12:00 ~ 13:00</li>
        <li style="font-size: 13px;">상담직원의 보호를 위해 통화내용은 녹음됩니다.</li>
      </ul>
    </div>	
    <div class="Center">
      <ul>
        <li>자주 묻는 질문에서<br> 먼저 찾아주세요</li>
        <li style="background-color: white; font-size: 50px; color: rgb(230, 230, 230);" >></li>
        <li>없을경우 문의하기로<br> 메모부탁드려요</li>
        <li style="background-color: white; font-size: 50px; color: rgb(230, 230, 230);">></li>
        <li>답변은 메일로<br> 전송드려요</li> 		
      </ul>
    </div>
 	<div class="clear">
 		<br>
   	</div>
	<div class="top5" id="scroll1">
		<h2>자주 묻는 질문 TOP 5</h2>
		<ul>
			<li><a href="#">경매 수수료 안내</a></li>
			<li><a href="#">배송은 얼마나 걸리나요?</a></li>
			<li><a href="#">포인트 충전이 되지 않아요</a></li>
			<li><a href="#">아이디/ 비밀번호를 잊어버렸어요</a></li>
			<li><a href="#">물품이 도착하지 않아요</a></li>
		</ul>
	</div>
	<div class="managerBoard">
    <h2>공지사항</h2>
    <hr>
    <br>
    <table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${manager}" var="manager">
			<tr>
				<td>${manager.mgNum}</td>
				<td><a href="managerDetail?mgNum=${manager.mgNum}">${manager.title}</a></td>
				<td>${manager.wirteDate}</td>
			</tr>
		</c:forEach>
	</table>
  </div>
 </div>
 <div class="clear">
 	<br>
 </div>
  <jsp:include page="../bottomBar.jsp"/>
<script type="text/javascript">
$(document).ready(function($) {
    $(".scroll_move").click(function(event){
        console.log(".scroll_move");         
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
    });

});
</script>
</body>
</html>