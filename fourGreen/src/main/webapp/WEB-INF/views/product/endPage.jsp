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
	margin-right: 90px;
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
</head>
<body>
<jsp:include page="../topBar.jsp" />
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
		<button type="button" class="btn" onclick="location.href='/auction/product'">목록보기</button>
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