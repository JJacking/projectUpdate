<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기 - ${product.title}</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style type="text/css">
#container{
	width: 1200px;
	margin: 0px auto;
	border: 1px black;
}
hr{
	margin: 5px;
}
a {
	text-decoration: none;
}
ul{
	list-style:none;
}
table {
	border-collapse: collapse;
}
th{
	border-bottom: 1px solid gray;
	line-height: 40px;
	width: 200px;
}

td{
	border-bottom: 1px solid gray;
	width: 250px;
}
#image{
border: 1px solid black;
}
#simpleMenu{
	margin-bottom: 5px; 
}
#productImg{
	text-decoration: none;
	float: left;
	margin: 10px;
	margin-right: 50px;
}

#productInfo{
	margin-left: 30px;
	margin-right: 70px;
	margin-bottom: 20px;
	float: left;
}
#productBtn{
	float: right;
	margin-right: 100px;
}
h6{
	float: left;
	margin: 5px;
	margin-bottom: 10px;
}
#mainContent{
	width: 1200px;
	float: left;
}
#timeTbl{
	background-color: darkgreen;
	color: white;
	height: 50px;
	display: flex;
    justify-content: center;
    align-items: center;
}

.remaingtime{
	line-height: 0;
}

.btn{
	width: 115px;
	height: 30px;
	border: 0px;
	background-color: whitegray;
}

#btn1{
	border: 0px;
	background-color: darkgreen;
	color: white;
}

#water{
	background-color: darkgreen;
	color: white;
}
#delivery{
	border-collapse: collapse;
}

#deliveryTh{
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	line-height: 40px;
	width: 400px;
}

#deliveryTd{
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	width: 800px;
}
.clear{
	clear:both;
}
</style>
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
  		<div class="logo"><a href="${pageContext.request.contextPath}"><img src="../resources/img/logo3.png"></a></div>
     <ul class="nav-menu">
	      <li><a href="/auction/product">물품보기</a></li>
	      <li><a href="/auction/newAuction">물품등록</a></li>
	      <li>
	        <a href="#">게시판</a>
		      <ul id="sub-menu">
		            <li><a href="/auction/managerBoardList">공지사항</a></li>
		            <li><a href="/auction/boardList">자유게시판</a></li>
		      </ul>
	      </li>
	      <li><a href="/auction/customerBoard">고객센터</a></li>
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
<!-- 남은시간 표시 -->
<script type="text/javascript">
	
	window.onload=function(){
		let timeTbl = document.getElementById('timeTbl');
		let title = document.createElement("h4");
		let time = document.createElement("h5");
		function getTime() {
			let target = new Date('${product.regdate}');
			let today = new Date();
			gap = target - today;
			let d = Math.floor(gap / (1000 * 60 * 60 * 24)); // 일
			let h = Math.floor((gap / (1000 * 60 * 60)) % 24); // 시
		 	let m = Math.floor((gap / (1000 * 60)) % 60); // 분
		  	let s = Math.floor((gap / 1000) % 60); // 초
		  	if (gap <= 0) {
			    location.href='views/product/endPage';
			    title.innerText = "경매가 마감되었습니다.";
			    time.innerText = "";
			    document.getElementsByClassName('btn')[0].setAttribute('style','display:none');
			    document.getElementsByClassName('btn')[1].setAttribute('style','display:none');
			    document.getElementsByClassName('btn')[2].setAttribute('style','display:none');
		  	} else {
		    	title.innerText = "";
		    	time.innerText = d+"일 "+h+"시간 "+m+"분 "+s+"초 남았습니다.";
		  	}
		}
		timeTbl.appendChild(time);
		timeTbl.appendChild(title);
		let gap;

		function init() {
		  getTime();
		  setInterval(getTime, 1000);
		}
		init();
	}
</script>

<form action="biding" method="POST" onsubmit="return check()">
<input type="hidden" name="id" value="${user.id }">
<input type="hidden" name="memberId" value="${user.id }">
<input type="hidden" name="num" value="${product.num }">
<div id="container">
	<div id="simpleMenu">
		<h6><a href="${pageContext.request.contextPath }">홈</a></h6>
		<h6> > </h6>
		<h6><a href="${pageContext.request.contextPath }/product">메뉴 1</a></h6>
		<h6> > </h6>
		<h6><a href="${pageContext.request.contextPath }/product?category=${product.category}">${product.category}</a></h6>
	</div>
	<br>
	<div id="productDescription">
		<ul>
			<li id="productImg">
				<div id="image">
					<!-- 대표사진  -->
					 <c:choose>
						<c:when test="${empty product.productPic}">
							<img src="/img/noimage.jpg">
						</c:when>
						<c:otherwise>
							<script type="text/javascript">
								let image = document.getElementById('image');
								let arr = '${product.productPic}'.split(',');
								
								if(arr[0] != ''){
									let img = (document.createElement('img'));
									img.setAttribute('src','/img/'+arr[0]);
									img.setAttribute('style','width:500px; height:500px;');
									image.appendChild(img);
								}
							</script>
						</c:otherwise>
					</c:choose>
				</div>
			</li>
			<li id="productInfo">
				<table>
					<tr>
						<td colspan="2">
							<h2>${product.title }</h2>
							<h3 id="timeTbl"></h3>
            			</td>
					</tr>
					<tr>
						<th>경매기간</th>
						<td>
							<p class="remaingtime">${product.writeDate}</p>
							<p class="remaingtime" id="water">~</p>
							<p class="remaingtime">${product.regdate}</p>
						</td>
					</tr>
					<tr>
						<th>현재가</th>
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
			</li>
		</ul>
		<div id="productBtn">
			<button type="submit" id="btn1" class="btn"><Strong>입찰하기</Strong></button>
			<button type="button" class="btn" onclick="insertDibsOn('${product.num}','${user.id }','${product.title }')">찜하기</button>
			<c:if test="${not empty user and user.grade eq '0'}">
				<button  type="button" class="btn"  onclick="location.href='deleteProduct?num=${product.num}'">경매 삭제하기</button>
			</c:if>
			<script type="text/javascript">
				function insertDibsOn(num,id,title){
					$.ajax({
						type:"post",
						url:"/auction/insertDibsOn",
						datatype:"text",
						data:{
							num:num,
							id:id,
							title:title
						},
						success:function(data){
							if(data == '1'){
								alert('찜한 상품목록에 등록되었습니다.');
							}else if(data == '2') {
								alert('이미 등록된 상품입니다.');
							}else{
								alert('찜하기에 실패했습니다. 다시 시도해주세요.');
							}
						}
					});
				}
			</script>
			<button type="button" class="btn" onclick="location.href='/auction/product'">목록보기</button>
		</div>
	</div>
	<div id="mainContent">
		<p>${product.content}</p>
		<div id="image2" style="margin: 0 auto;">
			<script type="text/javascript">
				let image2 = document.getElementById('image2');
				let arr2 = '${product.productPic}'.split(',');
				for(let i=0;i<arr2.length;i++){
					if(arr2[i] != ''){
						let img = document.createElement('img');
						img.setAttribute('src','/img/'+arr[i]);
						img.setAttribute('style','width:500px; height:500px;');
						image2.appendChild(img);
					}
				}
			</script>
		</div>
		<table id="delivery">
			<tr id="deliveryTr">
				<th id="deliveryTh">배송지</th>
				<td id="deliveryTd">전국 ※제주 및 도서산간 지역은 배송비가 추가될 수 있습니다.</td>
			</tr>
			<tr id="deliveryTr">
				<th id="deliveryTh">배송방법</th>
				<td id="deliveryTd">택배 선,착불 6,000원</td>
			</tr>
			<tr id="deliveryTr">
				<th id="deliveryTh">반품기간</th>
				<td id="deliveryTd">수령일로 부터 7일 이내에 반품을 신청하실 수 있습니다.</td>
			</tr >
			<tr id="deliveryTr">
				<th id="deliveryTh">반품비용</th>
				<td id="deliveryTd" >원인 제공자 부담을 원칙으로 합니다.</td>
			</tr>
		</table>
	</div>
</div>
</form>
<div class="clear">
<br>
</div>
<jsp:include page="../bottomBar.jsp"/>
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
		let bidUnit = 0;
		bidUnit = parseInt(document.getElementById('bidUnit').textContent);
		alert('입찰하시면 취소 할 수 없습니다.');
		let price = strPrice+bidUnit;
		if('${user.point }' < price){
			alert('보유 포인트가 부족합니다.')
			return false;
		}
		let strPrice2 = document.getElementById('strPrice');
		let flag = confirm(price+'원에 정말 입찰하시겠습니까?');
		if(flag){
			strPrice2.setAttribute('value',strPrice+bidUnit);
			alert(strPrice2.value);
			return true;
		}
		return false;
	}
	
</script>
</body>
</html>