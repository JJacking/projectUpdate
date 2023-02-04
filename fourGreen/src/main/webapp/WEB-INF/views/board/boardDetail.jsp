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
<script  src="./resources/js/board.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	#comment{
	  margin: 10%;
	  width: 70%;
	  border-collapse: collapse;
	  font-size:15px;
	}
	#comment table{
	  width: 100%;
	
	}
	#comment th,td{
	  text-align: left;
	}
	
	#comment td{
	  border: 0;
      border-radius: 10px;
	  line-height: 30px;
	}
  	.commentBtn{
      border: 1px solid orange;
      text-align: center;
    }
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
    .textareaStyle{
		width: 80%;
		padding: 0 5px;
		height: 100px;
		font-size: 16px;
		border: 1px solide black
	}
	textarea{
		resize: none;
	}
	textarea:focus {
    	outline: none;
	}
  
</style>
</head>
<body>
<jsp:include page="../topBar.jsp" />
<div id="boardTb">
  <h2>게시글 리스트</h2>
  <br>
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
      <th>내용</th>
      <td colspan="5" style="height: 300px;">
      <textarea rows="10" cols="100" readonly="readonly" style="resize: none; border: none">
      	${board.content}
      </textarea>
      </td>
    </tr>
    <tr>
      	<td colspan="6" style="border: white; text-align:center">
      	<c:if test="${not empty user and user.id eq board.id}">
	        <button type="button" class="w-btn w-btn-blue"  onclick="location.href='boardUpdate?num=${board.num}'">게시글 수정</button>
	        <button type="button" class="w-btn w-btn-blue"  onclick="removeCheck('${board.num }')">게시글 삭제</button>
	      	</c:if>
	        <button type="button" class="w-btn w-btn-blue"  onclick="location.href='boardList'">목록 보기</button>
    	</td>
    </tr>
  </table>
 </div>
     <!-- 댓글 페이지 -->
     <div id="comment" class="commentRead">
     	<form action="commentUpdate" method="post" id="commentUpdate">
	     	<input type="hidden" name="num" value="${board.num}">
    		
      		<table style="border-collapse: collapse;">
      			<c:forEach items="${lists}" var="comment" varStatus="c">
			     	<input type="hidden" name="cno" id="reCommCno">
	      			<tr style="border: 8px solid white; border-radius: 15px">
	      				<td><b>${comment.nickName}</b></td>
			            <td id="reComm${c.index }" style="width: 60%;">${comment.reContent}</td>
			            <td>${comment.reWirteDate}</td>
			            <c:if test="${not empty user and user.id eq comment.userId }">
				            <td class="commentBtn">
				              <button type="button" class="w-btn w-btn-blue"  id="commentUpdateF${c.index}" onclick="commentUpdateFunc('${comment.cno }','${c.index}','${comment.reContent}')">수정</button> 
				              <button type="submit" class="w-btn w-btn-blue"  id="commentUpdateBtn${c.index}" style="display: none;">수정</button> 
				              <button type="button" class="w-btn w-btn-blue"  id ="commentDeleteBtn" onclick="removeComment('${comment.cno}', '${comment.num}')">삭제</button>
				            </td>
			            </c:if>
	      			</tr>
      			</c:forEach>
      		</table>
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
	      				<td colspan="3"><textarea rows="4" cols="130" name="reContent" style="vertical-align: middle;"></textarea></td>
	      				<td rowspan="2" class="commentBtn">
	                		<button type="submit" class="w-btn w-btn-blue">댓글달기</button>
	            		</td>
	      			</tr>
	      		</table>
			</form>
		</div>
	<hr>
<jsp:include page="../bottomBar.jsp"/>
<script type="text/javascript">
	function check() {
		if('${user.id}' == '') {
			alert('로그인 후 이용해주세요');
			location.href="signInForm";
			return false;
		}
	}
	
	function commentUpdateFunc(cno,idx,str) {
		let reComm = document.getElementById('reComm'+idx); 
		let commentUpdateF = document.getElementById('commentUpdateF'+idx); 
		let commentUpdateBtn = document.getElementById('commentUpdateBtn'+idx); 
		let reCommCno = document.getElementById('reCommCno'); 
		reCommCno.setAttribute('value',cno);
		reComm.innerHTML='';
		
		let textarea = document.createElement('textarea');
		
		textarea.setAttribute('name','reContent');
		textarea.setAttribute('rows','3');
		textarea.setAttribute('cols','100');
		textarea.innerHTML=str;
		
		reComm.appendChild(textarea);
		commentUpdateF.setAttribute('style','display:none;');
		commentUpdateBtn.setAttribute('style','');
		
	}
	
	function removeCheck(num){
		 if (confirm("정말 삭제하시겠습니까??") == true){    
		      location.href='boardDelete?num='+num;
		  }else{   //취소
		      return false;
		  }
	}
</script>


</body>
</html>