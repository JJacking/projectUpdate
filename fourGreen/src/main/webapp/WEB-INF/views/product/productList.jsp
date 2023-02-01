<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매품목 리스트</title>
</head>
<body>
<jsp:include page="../topBar.jsp" />
<form action="" method="GET">
	<div>
		<h6> > </h6>
		<h6><a href="${pageContext.request.contextPath }/product">메뉴 1</a></h6>
	</div>
	<hr>
	<div>
		<table>
			<tr>
				<th>
					<input type="button" id="cate" name="cate" onclick="location.href='?category=appliances'" value="전자 / 가전제품" class="cb">
					<input type="button" id="cate" name="cate" onclick="location.href='?category=antique'" value="골동품 / 보물" class="cb">
					<input type="button" id="cate" name="cate" onclick="location.href='?category=book'" value="도서 / 고서 / 생활사자료" class="cb">
					<input type="button" id="cate" name="cate" onclick="location.href='?category=workArt'" value="미술 / 예술품" class="cb">
					<input type="button" id="cate" name="cate" onclick="location.href='?category=collection'" value="취미 / 수집" class="cb">
					<input type="button" id="cate" name="cate" onclick="location.href='?category=used'" value="중고 생활용품" class="cb">
				</th>
			</tr>
			<tr>
				<th>
					<c:if test="${not empty category }">
						<input type="button" value="인기 경매순" onclick="location.href='?category=${category}&filter=bidCount&sort=DESC'">
					</c:if>
					<c:if test="${empty category }">
						<input type="button" value="인기 경매순" onclick="location.href='?filter=bidCount&sort=DESC'">
					</c:if>
					<c:if test="${not empty category }">
						<input type="button" value="마감 임박순" onclick="location.href='?category=${category}&filter=regdate&sort=ASC'">
					</c:if>
					<c:if test="${empty category }">
						<input type="button" value="마감 임박순" onclick="location.href='?filter=regdate&sort=ASC'">
					</c:if>
					<c:if test="${not empty category }">
						<input type="button" value="신규 등록순" onclick="location.href='?category=${category}&filter=writedate&sort=DESC'">
					</c:if>
					<c:if test="${empty category }">
						<input type="button" value="신규 등록순" onclick="location.href='?filter=writedate&sort=DESC'">
					</c:if>
					<c:if test="${not empty category }">
						<input type="button" value="높은 가격순" onclick="location.href='?category=${category}&filter=strPrice&sort=DESC'">
					</c:if>
					<c:if test="${empty category }">
						<input type="button" value="높은 가격순" onclick="location.href='?filter=strPrice&sort=DESC'">
					</c:if>
					<c:if test="${not empty category }">
						<input type="button" value="낮은 가격순" onclick="location.href='?category=${category}&filter=strPrice&sort=ASC'">
					</c:if>
					<c:if test="${empty category }">
						<input type="button" value="낮은 가격순" onclick="location.href='?filter=strPrice&sort=ASC'">
					</c:if>
					<c:if test="${not empty category }">
						<input type="button" value="조회 많은순" onclick="location.href='?category=${category}&filter=readcount&sort=DESC'">
					</c:if>
					<c:if test="${empty category }">
						<input type="button" value="조회 많은순" onclick="location.href='?filter=readcount&sort=DESC'">
					</c:if>
					<c:if test="${not empty category }">
						<input type="button" value="조회 적은순" onclick="location.href='?category=${category}&filter=readcount&sort=ASC'">
					</c:if>
					<c:if test="${empty category }">
						<input type="button" value="조회 적은순" onclick="location.href='?filter=readcount&sort=ASC'">
					</c:if>
					<c:if test="${not empty category }">
						<input type="button" value="진행중인 경매" onclick="location.href='?category=${category}&filter=regdate&sort=ASC&end=2'">
					</c:if>
					<c:if test="${empty category }">
						<input type="button" value="진행중인 경매" onclick="location.href='?filter=regdate&sort=ASC&end=2'">
					</c:if>
					<c:if test="${not empty category }">
						<input type="button" value="마감된 경매" onclick="location.href='?category=${category}&filter=regdate&sort=ASC&end=1'">
					</c:if>
					<c:if test="${empty category }">
						<input type="button" value="마감된 경매" onclick="location.href='?filter=regdate&sort=ASC&end=1'">
					</c:if>
				</th>
			</tr>
		</table>
	</div>
	<hr>
	<select name="searchCate" id="searchCate">
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="writer">작성자</option>
	</select>
	<input type="text" name="searchText" id="searchText">
	<input type="submit" value="검색하기">
	<script type="text/javascript">
		let arr;
		let titlePic;
	</script>
	<c:forEach var="product" items="${list}">
	<hr>
		<!-- 대표사진  -->
		<a href="/auction/product/selectOne?num=${product.num}">
 		<c:choose>
			<c:when test="${empty product.productPic}">
					<img src="/img/noimage.jpg" onclick="/auction/product/selectOne?num=${product.num}">
			</c:when>
			<c:otherwise>
				<img id="${product.num}">
			
				<script type="text/javascript">
					arr = '${product.productPic}'.split(',');
					titlePic = document.getElementById('${product.num}');
					titlePic.setAttribute('src','/img/'+arr[0]);
				</script>
			</c:otherwise>
		</c:choose>
		</a>
		
		<h4><a href="/auction/product/selectOne?num=${product.num}">${product.title }</a></h4>
	
	<div>
		<span>
			입찰가 : ${product.strPrice}
		</span><br>
		<span>
			입찰 수 : ${product.bidCount}
		</span><br>
		<span>
			판매자 ID : ${product.memberId}
		</span><br>
		<span>
			조회 수 : ${product.readCount}
		</span><br>
		<span>
			판매자
			<%-- <p>${user.id}</p> --%>
		</span>
	</div>
	</c:forEach>
	
	<p><a href="newAuction">새 상품 등록</a></p>
	
	<div class="cls2">
		<c:if test="${totalCnt!=null}">
			<c:if test="${startPage != 1 }">
				<a href="pageNum=${startPage-10 }"><</a>
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" varStatus="cnt">
				<a href="?${url }pageNum=${cnt.index }">${cnt.index }</a>
			</c:forEach>
			<c:if test="${endPage < totalPage }">
				<a href="pageNum=${startPage+10 }">></a>
			</c:if>
		</c:if>
	</div>

</form>

<script type="text/javascript">
	function searchCate() {
		location.href="productList.jsp";
	}
	
	function searchText() {
		
	}
</script>
</body>
</html>