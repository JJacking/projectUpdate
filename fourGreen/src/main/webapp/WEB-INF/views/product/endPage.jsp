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