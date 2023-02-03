<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<!-- <link type="text/css" rel="stylesheet" href="./resources/style/board.css"> -->
<script src="./resources/js/board.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#boardDetail{
	width: 1200px;
	margin: 0px auto;
}
	
#boardTb{
	margin: 10px;
	border-collapse: collapse;
	width: 1200px;
	font-size:15px;
	line-height: 30px;
}

table{
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #CE6D39;
}
#boardTb th,td{
  padding: 5px;
  border: 1px solid #CE6D39;
}

#boardTb th{
	border: 1px solid #CE6D39;
	background-color: #FFEEE4;
	padding: 10px;
}

#boardTb td{
border: 1px solid #CE6D39;
  line-height: 60px;
}

#boardTb tr{
	border: 1px solid #CE6D39;
	line-height: 60px;
}

#boardTb a{
  color: black;
  text-decoration: none;
}

#boardTb a:hover{
  text-decoration: underline;
  color: #FDD692;
}

#comment{
	margin: 0 auto;
	border-collapse: collapse;
	font-size:15px;
}
.writenBoard{
	border: 1px dotted black; 
	height: 50px;
}


#comment{
	margin: 10px;
}
#commentList{
	border-bottom: 2px black; 
	margin: 5px
}

.commentCheck{
	display: inline;
}


.commentButton{
	font-size: 12px;
	font-weight: bold;
	position: relative;
    top: 5px;
    float: right;
    border: 0px;
}
.commentWrite{
	margin: 5px;
}


#comment table{
  width: 1200px;
}

#comment td{
	border: 0;
	border-radius: 10px;
	line-height: 15px;
}
/* .commentBtn{
   border: 1px solid orange;
   text-align: center;
} */
.commentRead{
	border: 1px solid white;
	background-color: #FFEEE4;
	border-radius: 10px;
}
.commentWrite{
	margin-top: 0;
	border: 1px solid orange;
	text-align: center;
}
.BDB{
	text-align: center;
    padding: 5px 10px;
    border-radius: 15px;
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
	border: 3px solid #6aafe6;
    color: #6e6e6e;
}

#DBDB {
	display :inline-block;
}

</style>
</head>
<body>
<jsp:include page="../topBar.jsp" />
<div id="boardDetail">
    <div id="boardTb">
      <table>
        <tr>
          <th>제목</th>
          <td colspan="5">${board.title}</td>
        </tr>
        <tr>
          <th>닉네임</th>
          <td>${board.nickName}</td>
          <th>작성일</th>
          <td>${board.wirteDate}</td>
          <th>조회수</th>
          <td>${board.readCount}</td>
        </tr>
        <tr>
          <td colspan="6"">${board.content}</td>
        </tr>
        <tr>
          	<td colspan="6">
          		<div id="DBDB">
	     			<c:if test="${not empty user and user.id eq board.id}">
			          <button type="button" class="BDB" onclick="location.href='boardUpdate?num=${board.num}'">
			         	 게시글 수정</button>
			          <button type="button" class="BDB" onclick="removeCheck(cno)">
			         	게시글 삭제</button>
			         </c:if>
			          <button type="button" class="BDB" onclick="location.href='boardList'">목록 보기</button>
          		</div>
        	</td>
        </tr>
      </table>
     </div>
     <!-- 댓글 페이지 -->
	<div id="comment" class="commentRead">
     	<form action="commentUpdate" method="post">
	     	<input type="hidden" name="cno" value="${board.num}">
   			<c:forEach items="${lists}" var="comment">
      			<div id="commentList">
      				<p class="commentCheck"><b>${comment.nickName}</b></p>
      				<p class="commentCheck">${comment.reContent}</p>
      				<p class="commentCheck ">
	      				<c:if test="${not empty user and user.id eq comment.userId }">
			              <button type="button" class="commentButton" onclick="commentUpdate()">수정</button><br>
			              <button type="button" class="commentButton" id ="commentDelete" onclick="removeComment('${comment.cno}','${comment.num}')">삭제</button>
			            </c:if>
		            </p>
		            <p class="commentCheck">${comment.reWirteDate}</p>
      			</div>
     		</c:forEach>
      	</form>
   	</div>
    <div id="comment">
      	<form action="commentWrite" method="POST" onsubmit="return check()">
       	<input type="hidden" name="num" value="${board.num}">
      	<input type="hidden" name="userId" value="${user.id}">
      	<input type="hidden" name="nickName" value="${user.nickname}">
      		<table id="commentTb" class="commentWrite">
      			<tr>
      				<td>내용</td>
      				<td colspan="3"><textarea rows="3" cols="100" name="reContent" style="vertical-align: middle;"></textarea></td>
      				<td rowspan="2" class="commentBtn">
                		<button class="w-btn w-btn-blue" type="submit">댓글달기</button>
            		</td>
      			</tr>
      		</table>
		</form>
	</div>
</div>
<jsp:include page="../bottomBar.jsp"/>
<script type="text/javascript">
	function check() {
		if('${user.id}' == "") {
			alert('로그인 후 이용해주세요');
			location.href="signInForm";
			return false;
		}
	}
</script>
  </body>
  </html>