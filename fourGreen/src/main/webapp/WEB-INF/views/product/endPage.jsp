<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
.btn{
	float: right;
	margin-right: 10px;
	width: 115px;
	height: 30px;
	border: 0px;
	background-color: whitegray;
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
#time{
	background-color: darkgreen;
	color: white;
}

#water{
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
	.divBtn{
		margin-right: 100px;
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
	<form action="biding" method="POST" onsubmit="return check()">
<input type="hidden" name="id" value="test@gmail.com">
<input type="hidden" name="num" value="${product.num }">
<hr>
<div id="container">
	<div id="simpleMenu">
		<h6><a href="${pageContext.request.contextPath }">홈</a></h6>
		<h6> > </h6>
		<h6><a href="${pageContext.request.contextPath }/product">메뉴 1</a></h6>
		<h6> > </h6>
		<h6><a href="${pageContext.request.contextPath }/product/?category=${product.category}">${product.category}</a></h6>
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
								
								for(let s = 0 ;s< arr.length;s++){
									if(arr[s] != ''){
										let img = (document.createElement('img'));
										img.setAttribute('src','/img/'+arr[s]);
										img.setAttribute('style','width:500px; height:500px;');
										image.appendChild(img);
									}
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
							<h3 id="time">경매가 마감되었습니다</h3>
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
						<th>낙찰가</th>
						<td>${product.strPrice}
							<input type="hidden" name="strPrice" id="strPrice" value="${product.strPrice}">
						</td>
					</tr>
				</table>
			</li>
		</ul>
		<div class="divBtn">
			<c:if test="${not empty user and product.memberId eq user.id or not empty user and user.grade eq '0'}">
				<button  type="button" class="btn"  onclick="location.href='deleteProduct?num=${product.num}'">경매 삭제하기</button>
			</c:if>
			<button type="button" class="btn" onclick="location.href='/auction/product'">목록보기</button>
		</div>
	</div>
		<div id="mainContent">
		<p>${product.content}</p>
		 <c:choose>
			<c:when test="${empty product.productPic}">
				<img src="/img/noimage.jpg">
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					let image = document.getElementById('image');
					let arr = '${product.productPic}'.split(',');
					
					for(let s = 0 ;s< arr.length;s++){
						if(arr[s] != ''){
							let img = (document.createElement('img'));
							img.setAttribute('src','/img/'+arr[s]);
							img.setAttribute('style','width:500px; height:500px;');
							image.appendChild(img);
						}
					}
				</script>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</form>
<jsp:include page="../bottomBar.jsp"/>
<script type="text/javascript">
	if('${product.bidCount}' == 0) {
		document.getElementById('endAuction').setAttribute('style','display:none;');
	}
	
</script>
</body>
</html>