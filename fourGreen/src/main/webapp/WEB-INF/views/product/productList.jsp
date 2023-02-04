<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매품목 리스트</title>
<style>
	.imgBoardpage{
		margin: 80px auto;
	} 
	.link{
		margin: 0 auto;
		font-size:25px;
	}
	.link a{
		text-decoration: none;
    	color: skyblue;
	}
	#main{
		width: 1300px;
		margin: 0 auto;
	}
	.w-btn{
		margin: 5px;
	}
	.w-btn-gray{
		background-color: #E0E3DA;
		color: #566270;	
	}
	
	.w-btn-gray-outline {
	    border: 3px solid #6aafe6;
	    color: #6e6e6e;
	}
	.w-btn-gray-outline:hover {
	    background-color: #6aafe6;
	    color: #d4dfe6;
	}
	.search{
		margin-top: 10px;
		margin-bottom: 10px;
		text-align: right;
	}
	#imgSession{
		margin:0 auto;
		margin-top: 80px;
	}
	.imgCard{
		border:1px solid #E0E3DA;
		border-radius: 10px;
		margin: 30px;		
		width: 300px;
    	height: 320px;
  		line-height: 30px;
    	display: inline-block;
    	float: left;
	}
	 .newProduct{
	    clear: both;
	    text-align: center;
  	}
  	
  	.newProduct a{
  		padding: 10px;
  		text-decoration: none;
  		color: black;
  	}
</style>
</head>
<body>
<jsp:include page="../topBar.jsp" />
<div class="imgBoardpage">
	<c:if test="${not empty newAuctionMsg }">
		<script type="text/javascript">
			alert('${newAuctionMsg}');
		</script>
	</c:if>
		<div class="link">
			<h6><a href="auction/">홈</a> > <a href="product"><b>메뉴 1</b></a></h6>
		</div>
			<hr>
			<div id="main">
				<table>
					<tr>
						<th class="btn">
							<input type="button" id="cate" name="cate" onclick="location.href='?category=appliances'" value="전자 / 가전제품" class="w-btn w-btn-gray">
							<input type="button" id="cate" name="cate" onclick="location.href='?category=antique'" value="골동품 / 보물" class="w-btn w-btn-gray">
							<input type="button" id="cate" name="cate" onclick="location.href='?category=book'" value="도서 / 고서 / 생활사자료" class="w-btn w-btn-gray">
							<input type="button" id="cate" name="cate" onclick="location.href='?category=workArt'" value="미술 / 예술품" class="w-btn w-btn-gray">
							<input type="button" id="cate" name="cate" onclick="location.href='?category=collection'" value="취미 / 수집" class="w-btn w-btn-gray">
							<input type="button" id="cate" name="cate" onclick="location.href='?category=used'" value="중고 생활용품" class="w-btn w-btn-gray">
						</th>
					</tr>
					<tr>
						<th class="btn">
							<c:if test="${not empty category }">
								<input type="button" class="w-btn w-btn-gray" value="인기 경매순" onclick="location.href='?category=${category}&filter=bidCount&sort=DESC'">
							</c:if>
							<c:if test="${empty category }">
								<input type="button" class="w-btn w-btn-gray" value="인기 경매순" onclick="location.href='?filter=bidCount&sort=DESC'">
							</c:if>
							<c:if test="${not empty category }">
								<input type="button" class="w-btn w-btn-gray" value="마감 임박순" onclick="location.href='?category=${category}&filter=regdate&sort=ASC'">
							</c:if>
							<c:if test="${empty category }">
								<input type="button" class="w-btn w-btn-gray" value="마감 임박순" onclick="location.href='?filter=regdate&sort=ASC'">
							</c:if>
							<c:if test="${not empty category }">
								<input type="button" class="w-btn w-btn-gray" value="신규 등록순" onclick="location.href='?category=${category}&filter=writedate&sort=DESC'">
							</c:if>
							<c:if test="${empty category }">
								<input type="button" class="w-btn w-btn-gray" value="신규 등록순" onclick="location.href='?filter=writedate&sort=DESC'">
							</c:if>
							<c:if test="${not empty category }">
								<input type="button" class="w-btn w-btn-gray" value="높은 가격순" onclick="location.href='?category=${category}&filter=strPrice&sort=DESC'">
							</c:if>
							<c:if test="${empty category }">
								<input type="button" class="w-btn w-btn-gray" value="높은 가격순" onclick="location.href='?filter=strPrice&sort=DESC'">
							</c:if>
							<c:if test="${not empty category }">
								<input type="button" class="w-btn w-btn-gray" value="낮은 가격순" onclick="location.href='?category=${category}&filter=strPrice&sort=ASC'">
							</c:if>
							<c:if test="${empty category }">
								<input type="button" class="w-btn w-btn-gray" value="낮은 가격순" onclick="location.href='?filter=strPrice&sort=ASC'">
							</c:if>
							<c:if test="${not empty category }">
								<input type="button" class="w-btn w-btn-gray" value="조회 많은순" onclick="location.href='?category=${category}&filter=readcount&sort=DESC'">
							</c:if>
							<c:if test="${empty category }">
								<input type="button" class="w-btn w-btn-gray" value="조회 많은순" onclick="location.href='?filter=readcount&sort=DESC'">
							</c:if>
							<c:if test="${not empty category }">
								<input type="button" class="w-btn w-btn-gray" value="조회 적은순" onclick="location.href='?category=${category}&filter=readcount&sort=ASC'">
							</c:if>
							<c:if test="${empty category }">
								<input type="button" class="w-btn w-btn-gray" value="조회 적은순" onclick="location.href='?filter=readcount&sort=ASC'">
							</c:if>
							<c:if test="${not empty category }">
								<input type="button" class="w-btn w-btn-gray" value="진행중인 경매" onclick="location.href='?category=${category}&filter=regdate&sort=ASC&end=2'">
							</c:if>
							<c:if test="${empty category }">
								<input type="button" class="w-btn w-btn-gray" value="진행중인 경매" onclick="location.href='?filter=regdate&sort=ASC&end=2'">
							</c:if>
							<c:if test="${not empty category }">
								<input type="button" class="w-btn w-btn-gray" value="마감된 경매" onclick="location.href='?category=${category}&filter=regdate&sort=ASC&end=1'">
							</c:if>
							<c:if test="${empty category }">
								<input type="button" class="w-btn w-btn-gray" value="마감된 경매" onclick="location.href='?filter=regdate&sort=ASC&end=1'">
							</c:if>
						</th>
					</tr>
				</table>
			
				<div class="search">
					<select name="searchCate" id="searchCate">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</select>
			
					<input type="text" name="searchText" id="searchText">
					<input type="submit" value="검색하기">
				</div>
				
				<c:forEach var="product" items="${list}">
				<div id="imgSession">
					<div class="imgCard" style="text-align: center;">
						<!-- 대표사진  -->
						<a href="product/selectOne?num=${product.num}">
				 		<c:choose>
							<c:when test="${empty product.productPic}">
									<img src="/img/noimage.jpg" onclick="/auction/product/selectOne?num=${product.num}">
							</c:when>
							<c:otherwise>
								<img id="${product.num}" style="width: 200px; height: 250px;">
							
								<script type="text/javascript">
									arr = '${product.productPic}'.split(',');
									titlePic = document.getElementById('${product.num}');
									titlePic.setAttribute('src','/img/'+arr[0]);
								</script>
							</c:otherwise>
						</c:choose>
						</a>
					
						<h4><a href="product/selectOne?num=${product.num }">${product.title }</a></h4>
					
						<span>
							입찰가 : ${product.strPrice}
						</span>
					</div>
				</div>
				</c:forEach>
			</div>
			<div class="newProduct">
				<p><a href="newAuction">새 상품 등록</a></p>
				<c:if test="${totalCnt!=null}">
					<c:if test="${startPage != 1 }">
						<a href="pageNum=${startPage-10 }"><</a>
					</c:if>
					<c:forEach begin="${startPage }" end="${endPage }" varStatus="cnt">
						<a href="?${url }pageNum=${cnt.index }">${cnt.index }</a>
					</c:forEach>
					<c:if test="${endPage < totalPage }">
						<a href="pageNum=${startPage+10 }">></a>
					</c:if>
				</c:if>
			</div>
<jsp:include page="../bottomBar.jsp"/>
<script type="text/javascript">
	function searchCate() {
		location.href="productList.jsp";
	}
	
	function searchText() {
		
	}
</script>
</body>
</html>