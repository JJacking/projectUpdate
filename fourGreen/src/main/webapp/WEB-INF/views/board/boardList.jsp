<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시판</title>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<style>
p{
	text-align: right;
}
.col1{
width: 10%;
}
.col2{
  width: 57%;
}
.col3{
  width: 13%;
}
.col4{
  width: 10%;
}
.col5{
  width: 10%;
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
<div id="boardTb">
	<h2>게시판 리스트</h2>
	<hr>
	<br>
	<table>
		<colgroup>
			<col class="col1">
			<col class="col2">
			<col class="col3">
			<col class="col4">
			<col class="col5">
		</colgroup>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="board">
			<tr>
				<td>${board.num}</td>
				<td><a href="boardDetail?num=${board.num}">${board.title}</a></td>
				<td>${board.nickName}</td>
				<td> <fmt:formatDate value="${board.wirteDate}"/> </td>
				<td>${board.readCount}</td>
			</tr>
		</c:forEach>
		</table>
		</div>
			<p><a href="boardWrite">게시글 등록</a><p>
			
	
	<%-- 
	<!-- 페이징 -->
	<div class="cls2"> 
		<c:if test="${totalCnt != null}"> 
			<c:choose>
				<c:when test="${totalCnt > 100}">
				
					<c:if test="${(section*100) < totalCnt}"> <!-- 다음 섹션이 존재하는가?  '>>'넣기 -->
					
						<c:forEach var="page" begin="1" end="10" step="1"> <!--  번호 매기기 -->
							
								<c:if test="${section > 1 && page ==1 }"> <!-- 이전섹션표시 -->
									<a href="boardList&section=${section-1}&pageNum=${10}"> << </a>
								</c:if>
							
								<a href="boardList&section=${section}&pageNum=${page}">${(section-1)*10+page}</a>
									<!-- 번호를 눌렀을때 해당 섹션과 해당 페이지번호를 서버에 전달 > 페이지출력 -->
									
								<c:if test="${page==10}"> <!-- 다음 섹션 표시 -->
									<a href="boardList&section=${section+1}&pageNum=${1}"> >> </a>
								</c:if>
							
						</c:forEach>
					</c:if>
					
					<c:if test="${(section*100) >= totalCnt}"><!-- 다음섹션이 없는가? '>>' 표기 x  -->
						
						<c:forEach var="page" begin="1" end="${((totalCnt+9)-(section-1)*100)/10}" step="1">
						
							<c:if test="${section > 1 && page ==1 }"> <!-- 이전섹션표시 -->
									<a href="boardList&section=${section-1}&pageNum=${10}"> << </a>
							</c:if>
						
							<a href="boardList&section=${section}&pageNum=${page}"> ${(section-1)*10+page} </a>
									<!-- 번호를 눌렀을때 해당 섹션과 해당 페이지번호를 서버에 전달 > 페이지출력 -->
							
						</c:forEach>		
					</c:if>
				</c:when>
				<c:when test="${totalCnt == 100}"> <!-- 전체 개수가 100개 인가? -->
					<c:forEach var="page" begin="1" end="10" step="1">
						<a href="BS?command=board_list&section=${section}&pageNum=${page}"> ${page} </a>
									<!-- 번호를 눌렀을때 해당 섹션과 해당 페이지번호를 서버에 전달 > 페이지출력 -->
					</c:forEach>
				</c:when>
				<c:when test="${totalCnt < 100}"> <!-- 전체 개수가 100개보다 적은가? -->
					<c:forEach var="page" begin="1" end="${(totalCnt+9)/10}" step="1">
						<a href="BS?command=board_list&section=${section}&pageNum=${page}"> ${page} </a>
									<!-- 번호를 눌렀을때 해당 섹션과 해당 페이지번호를 서버에 전달 > 페이지출력 -->
					</c:forEach>
				</c:when>
			</c:choose>
		</c:if>
	</div>
</div> --%>
<hr>
<footer>
  <div class="footer">
    <a href="https://github.com/JJacking/lastPj.git" style="text-decoration: none; list-style: none; color: white;" >@github 저장소 바로가기</a>
  </div>
</footer>
</body>
</html>