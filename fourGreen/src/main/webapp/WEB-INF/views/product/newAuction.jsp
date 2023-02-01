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
	#main{
		width: 80%;
		margin: 10%;
		line-height: 50px;
	}
	
	#main table{
		width: 80%;
	}
  	
  	#main input{
  		width:100%;
  		height: 20px;
  	}
  	.mainTb {
  		width: 100%;
  	}
  	
  	.upBtn{
  		text-align: center;
  	}
	
	#main h2{
		color: skyblue;
		font-size: 30px;
	}
	
</style>
</head>
<body>
<div class="nav">
  <div><h2><a href="/">logo</a></h2></div>
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
      <li><a href="#">고객센터</a></li>
     </ul>
   	<c:if test="${empty user}"> 
        <div class="loginBtn">
            <button type="button" onclick="location.href='signInForm'">로그인</button>
            <button type="button" onclick="location.href='signUp'">회원가입</button>
        </div>
    </c:if>
   <c:if test="${not empty user }">
        <p>${user.nickname}님 환영합니다</p>
        <p><a href="signOut">로그아웃</a></p>
        <p><a href="myPage">내정보</a></p>
        <p><a href="charge">포인트충전/조회</a></p>
    </c:if>
</div>
<div id="main">
	<form action="newAuction" method="post" onsubmit="return submit2()" enctype="multipart/form-data">
		<input type="hidden" name="memberId" value="teste">
		<h2>물품 등록</h2>
		<hr>
		<div class="mainTb">
			<table id="tb">
				<tr>
					<th>물품 이름</th>
					<td> <input type="text" name="title" required> </td>
				</tr>
				<tr>
					<th>카테고리 설정</th>
					<td>
						<select name="category">
							<option value="appliances">전자 / 가전 제품</option>
							<option value="antique">골동품 / 보물</option>
							<option value="book">도서 / 고서 / 생활사자료</option>
							<option value="workArt">미술 / 예술품</option>
							<option value="collection">취미 / 수집</option>
							<option value="used">중고 생활용품</option>
						</select>
					</td>
				</tr>
				<tr id="addTr">
					<th>이미지 등록</th>
					<td>
						<button type="button" onclick="add()">추가</button>
						<input type="file" name="productPic" multiple="multiple" required><br>
					</td>
				</tr>
				<tr>
					<th>물품 설명</th>
					<td> <textarea rows="40" style="width: 100%;" name="content">${product.content}</textarea> </td>
				</tr>
			</table>
	
		<h2>경매 설정</h2>
		<table>
		<tr>
			<th>시작가</th>
			<td> <input type="number" name="strPrice" required> </td>
		</tr>
		<tr>
			<th>경매 기간</th>
			<td>
				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" var="now" />
				<c:out value="${now}" />
				<p>부터 </p>
				<input type="datetime-local" name="regdate" id="dateTime" required>
				<p>까지 </p>
			</td>
		</tr>
		<tr>
			<th>연장 경매</th>
			<td>  </td>
		</tr>
		</table>
	</div>
	<div class="upBtn">
		<button type="submit">경매 신청하기</button>
		<button type="reset">취소하기</button>
		<button type="button" onclick="location.href='/TeamProject'">목록으로</button>
	</div>
	</form>
</div>

<footer>
  <div class="footer">
    <a href="https://github.com/JJacking/fourGreen.git" style="text-decoration: none; list-style: none; color: white; width:100%;" >@github 저장소 바로가기</a>
  </div>
</footer>

<script type="text/javascript">
	function submit2() {
		
		let flag = confirm('한번 등록한 상품은 수정/삭제가 불가능 합니다. 정말 등록하시겠습니까?');
		if(flag) {
			
			return true;
		}
		return false;
		
		alert('한번 등록한 상품은 수정/삭제가 불가능 합니다.	정말 등록하시겠습니까?');
	}

	let tr = document.getElementById('addTr');
	let cnt = 1;
	function add(){
		if(cnt < 5){
			let trTag = document.createElement('tr');
			let tdTag = document.createElement('td');
			let inputTag = document.createElement('input');
			inputTag.setAttribute('type','file');
			inputTag.setAttribute('name','productPic');
			inputTag.setAttribute('multiple','multiple');
			tdTag.appendChild(inputTag);
			trTag.appendChild(tdTag);
			tr.append(trTag);
		}else{
			alert('등록할 수 있는 사진은 최대 5장입니다');
		}
	}
	
	
</script>
</body>
</html>