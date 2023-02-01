<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../topBar.jsp" />
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
					//01_python.jpg,02_android.jpg,03_nodejs.jpg,,
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
	<div>
		<table>
			<tr>
				<th>경매기간</th>
				<td>
					${product.writeDate}
					<p>~</p>
					${product.regdate}
				</td>
			</tr>
			<tr id="endAuction">
				<th>낙찰가</th>
				<td>${product.strPrice}
					<input type="hidden" name="strPrice" id="strPrice" value="${product.strPrice}">
				</td>
			</tr>
		</table>
	</div>
	
	<button type="button" onclick="location.href='/TeamProject'">목록보기</button>

</form>
<script type="text/javascript">
	if('${product.bidCount}' == 0) {
		document.getElementById('endAuction').setAttribute('style','display:none;');
	}
	
</script>
</body>
</html>