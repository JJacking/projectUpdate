<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기 - ${product.title}</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<style>
	
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
<!-- 남은시간 표시 -->
	<script type="text/javascript">
		function getTime() {
			let target = new Date('${product.regdate}');
			let today = new Date();
			gap = target - today;
			let d = Math.floor(gap / (1000 * 60 * 60 * 24)); // 일
			let h = Math.floor((gap / (1000 * 60 * 60)) % 24); // 시
		 	let m = Math.floor((gap / (1000 * 60)) % 60); // 분
		  	let s = Math.floor((gap / 1000) % 60); // 초
		  	if (gap <= 0) {
			    location.href='endPage';
			    title.innerText = "경매가 마감되었습니다.";
			    timer.innerText = "";
			    document.getElementsByClassName('btn')[0].setAttribute('style','display:none');
			    document.getElementsByClassName('btn')[1].setAttribute('style','display:none');
			    document.getElementsByClassName('btn')[2].setAttribute('style','display:none');
		  	} else {
		    	title.innerText = "마감까지";
		    	timer.innerText = d+"일 "+h+"시간 "+m+"분 "+s+"초 남았습니다.";
		  	}
		}
		const body = document.querySelector("body");
		const timer = document.createElement("h3");
		const title = document.createElement("h3");
		body.prepend(timer);
		body.prepend(title);
		let gap;
		function gapT(){
			
		}

		function init() {
		  getTime();
		  setInterval(getTime, 1000);
		}
		init();
	</script>

<form action="biding" method="POST" onsubmit="return check()">
<input type="hidden" name="id" value="test@gmail.com">
<input type="hidden" name="num" value="${product.num }">
	<div>
		<div>
			<h6><a href="/index.html">홈</a></h6>
			<h6> > </h6>
			<h6><a href="${pageContext.request.contextPath }">메뉴 1</a></h6>
			<h6> > </h6>
			<h6><a href="${pageContext.request.contextPath }/?category=${product.category}">${product.category}</a></h6>
		</div>
		<h4>${product.title }</h4>
	</div>
	<hr>
	<div>
	
	<div id="image">
		<!-- 대표사진  -->
		 <c:choose>
			<c:when test="${empty product.productPic}">
				<img src="/auction/noimage.jpg">
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					let image = document.getElementById('image');
					let arr = '${product.productPic}'.split(',');
					
					for(let s = 0 ;s< arr.length;s++){
						if(arr[s] != ''){
							let img = (document.createElement('img'));
							img.setAttribute('src','/auction/'+arr[s]);
							img.setAttribute('style','width:100px; height:100px;');
							image.appendChild(img);
						}
					}
				</script>
			</c:otherwise>
		</c:choose>
	</div>
		<hr>
		
		<table>
			<tr>
				<th>경매기간</th>
				<td>
					${product.writeDate}
					<p>~</p>
					${product.regdate}
				</td>
			</tr>
			<tr>
				<th>연장경매</th>
				<td></td>
			</tr>
			<tr>
				<th>현재 경매가</th>
				<td>${product.strPrice}
					<input type="hidden" name="strPrice" id="strPrice" value="${product.strPrice}">
				</td>
			</tr>
			<tr>
				<th>입찰 단위</th>
					<td id="bidUnit">
					<input type="hidden" name="bidUnit" id="bidUnit">
				</td>
			</tr>
			<tr>
				<th>판매자 ID</th>
				<td>${product.memberId}</td>
			</tr>
			<tr>
				<th>입찰 수</th>
				<td>${product.bidCount}</td>
			</tr>
			<tr>
				<th>조회 수</th>
				<td>${product.readCount}</td>
			</tr>
		</table>
		
		<tbody>
			<tr>
				<th>배송방법</th>
				<td>직접수령 / 택배(등기)</td>
			</tr>
			<tr>
				<th>배송비용</th>
				<td>선불 : 4000원 / 착불 : 5000원</td>
			</tr>
		</tbody>
	</div>
	<div>		
		<button type="submit" id="btn1" class="btn">입찰하기</button>
		<button type="button" class="btn" onclick="location.href='??'">관심물품 등록하기</button>
		<button type="button" class="btn" onclick="location.href='??'">문의하기</button>
	</div>
	<input type="image">
	
	<p><a href="deleteProduct?num=${product.num}">경매 삭제하기</a></p>
	<button type="button" onclick="location.href='/TeamProject'">목록보기</button>

</form>
<script type="text/javascript">
	let strPrice = parseInt(document.getElementById('strPrice').value);
	let bidUnit = document.getElementById('bidUnit');
	if(1000000000 <= strPrice){
		bidUnit = 10000000;
	}else if(300000000 <= strPrice){
		bidUnit.innerHTML = 5000000;
	}else if(100000000 <= strPrice){
		bidUnit.innerHTML = 2500000;
	}else if(10000000 <= strPrice){
		bidUnit.innerHTML = 1000000;
	}else if(5000000 <= strPrice){
		bidUnit.innerHTML = 500000;
	}else if(1000000 <= strPrice){
		bidUnit.innerHTML = 100000;
	}else if(500000 <= strPrice){
		bidUnit.innerHTML = 50000;
	}else if(100000 <= strPrice){
		bidUnit.innerHTML = 10000;
	}else if(10000 <= strPrice){
		bidUnit.innerHTML = 5000;
	}else if(strPrice < 10000){
		bidUnit.innerHTML = 1000;
	}
	
	function check(){
		strPrice = parseInt(document.getElementById('strPrice').value);
		let bidUnit = 0;
		bidUnit = parseInt(document.getElementById('bidUnit').textContent);
		alert('입찰하시면 취소 할 수 없습니다.');
		let flag = confirm(strPrice+bidUnit+'원에 정말 입찰하시겠습니까?');
		if(flag){
			document.getElementById('strPrice').setAttribute('value',strPrice+bidUnit);
			return true;
		}
		return false;
	}
	<footer>
	  <div class="footer">
	    <a href="https://github.com/JJacking/fourGreen.git" style="text-decoration: none; list-style: none; color: white; width:100%;" >@github 저장소 바로가기</a>
	  </div>
	</footer>
	<script type="text/javascript">
	
</script>

</body>
</html>