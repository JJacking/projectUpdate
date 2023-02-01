<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매품목 리스트</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<style>
	.link{
		margin-left: 5%;
		font-size:25px;
	}
	.link a{
		text-decoration: none;
    	color: skyblue;
	}
	#main{
		width: 1500px;
		margin-left: 8%;
	}
	.search{
		margin-top: 10px;
		margin-bottom: 10px;
		text-align: right;
	}
	.imgCard{
		border:1px solid black;
		margin: 30px;		
		width: 400px;
    	height: 20%;
  		line-height: 30px;
    	display: inline-block;
    	float: left;
	}
	 .newProduct{
    clear: both;
    text-align: center;
  	}
</style>
</head>	
<body>
<div class="nav">
  <div><h2><a href="/">logo</a></h2></div>
     <ul class="nav-menu">
      <li><a href="product"><b>물품보기</b></a></li>
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
<form action="" method="GET">
	<div class="link">
		<h6><a href="auction/">홈</a> > <a href="product"><b>메뉴 1</b></a></h6>
	</div>
	<hr>
	<div id="main">
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
	
		<hr>
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
			<div class="imgCard">
				<!-- 대표사진  -->
				<a href="selectOne?num=${product.num }">
		 		<c:choose>
				<c:when test="${empty product.productPic}">
						<img src="/auction/noimage.jpg">
					</c:when>
				<c:otherwise>
					<img src="/auction/${product.productPic}">
				</c:otherwise>
				</c:choose>
				</a>
			
				<h4><a href="selectOne?num=${product.num }">${product.title }</a></h4>
		
		
				<span>${product.productPic}</span> <br>
				<span>${product.title }</span><br>
			
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
				<%-- <p>${??.id }</p> --%>
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
	</div>
</div>
</form>

<footer>
  <div class="footer">
    <a href="https://github.com/JJacking/fourGreen.git" style="text-decoration: none; list-style: none; color: white; width:100%;" >@github 저장소 바로가기</a>
  </div>
</footer>
<script type="text/javascript">
	function searchCate() {
		location.href="productList.jsp";
	}
	
	function searchText() {
		
	}
</script>
</body>
</html>