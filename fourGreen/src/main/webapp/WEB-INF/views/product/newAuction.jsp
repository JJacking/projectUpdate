<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">

<style>
	.w-btn{
	  padding: 20px;
	  margin-left: 10px;
	}
	.board{
	  top: 50%;
	  left: 50%;
      margin: 0 auto;
      padding: 20px;
	  width: 1000px;
	  background-color: white;
	  border: 1px solid #CE6D39;
	  border-radius: 10px;
	  line-height: 80px;
	  margin-top:20px;
	  margin-bottom: 20px;
	  }
	  #tb{
	  	width: 900px;
	  	padding: 30px;
	  	margin-top: 20px;
	  	margin-bottom: 20px;
	  }
	  .board th{
	  padding: 20px;
	  width: 120px;
	  margin: 20px;
	  }
	  
	  .chart{
	  	width: 40%;
	  	height: 50px;
	  }
	  .board input{
	  	  width: 90%;
		  padding: 0 5px;
		  height: 30px;
		  font-size: 16px;
	  }
	  
	  .board td{
		border: 1px solid white;
	}
	 #addTr{
	 	list-style: none;
	 }
	 .btn{
	 	text-align: center;
	 }
</style>
</head>
<body>
<jsp:include page="../topBar.jsp" />
<div class="board">
<form action="newAuction" method="post" onsubmit="return submit2()" enctype="multipart/form-data">
<input type="hidden" name="memberId" value="teste">
	<h2>물품 정보</h2>
	<table id="tb">
		<tr>
			<th>물품 이름</th>
			<td> <input type="text" name="title" required> </td>
		</tr>
		<tr>
			<th>카테고리 설정</th>
			<td>
				<select name="category" class="chart">
					<option value="appliances">전자 / 가전 제품</option>
					<option value="antique">골동품 / 보물</option>
					<option value="book">도서 / 고서 / 생활사자료</option>
					<option value="workArt">미술 / 예술품</option>
					<option value="collection">취미 / 수집</option>
					<option value="used">중고 생활용품</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>이미지 등록</th>
			<td>				
				<ul>
					<li id="addTr">
						<input type="file" name="productPic" multiple="multiple"  required><br>
					</li>
				</ul>
					<button type="button" class="w-btn w-btn-blue" onclick="add()">추가</button>
			</td>
		</tr>
		<tr>
			<th>물품 설명</th>
			<td> <textarea rows="20" style="width:100%;" name="content">${product.content}</textarea> </td>
		</tr>
	</table>
	
	<h2>경매 설정</h2>
	<table id="tb">
	<tr>
		<th>시작가</th>
		<td> <input type="number" name="strPrice" placeholder="1000" min="1000" step="1000" style="text-align: right;" required>원</td>
	</tr>
	<tr>
		<th>경매 기간</th>
		<td>
			<jsp:useBean id="now" class="java.util.Date" />
			<p>
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" var="now" />
			<c:out value="${now}" />
			부터 
			<input type="datetime-local" name="regdate" id="dateTime" required>
			까지 </p>
		</td>
	</tr>
	</table>
	<div class="btn">
		<button type="submit" class="w-btn w-btn-blue">경매 신청하기</button>
		<button type="reset" class="w-btn w-btn-blue">취소하기</button>
		<button type="button" class="w-btn w-btn-blue" onclick="location.href='/auction'">목록으로</button>
	</div>
</form>
</div>
<jsp:include page="../bottomBar.jsp"/>
<script type="text/javascript">
	function submit2() {
		
		let flag = confirm('한번 등록한 상품은 수정/삭제가 불가능 합니다. 정말 등록하시겠습니까?');
		if(flag) {
			
			return true;
		}
		return false;
	}

	let tr = document.getElementById('addTr');
	let cnt = 1;
	function add(){
		if(cnt < 5){
			cnt = cnt+1;
			let inputTag = document.createElement('input');
			inputTag.setAttribute('type','file');
			inputTag.setAttribute('name','productPic');
			inputTag.setAttribute('multiple','multiple');
			tr.append(inputTag);
		}else{
			alert('등록할 수 있는 사진은 최대 5장입니다');
		}
	}
	
	
</script>
</body>
</html>