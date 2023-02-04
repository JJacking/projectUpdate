<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="./resources/style/board.css">
<style type="text/css">
*{
	padding: 0;
} 
#outter{
	width: 100%;
	margin-top:50px; 
}  
.infoTb{
  	width: 800px;
  	height: 600px;
  	padding-top: 50px; 
  	margin: 0 auto;
  	font-size: 20px;
  	border-collapse: collapse;
  	line-height: 50px;
} 
.infoTb th{
	width: 150px;
	height: 30px;
	border: 1px solid #CE6D39; 
	background-color: #FFEEE4;
}
.infoTb td{
	height: 30px;
}
.w-btn{ 
	width:160px;
	padding: 20px;
	margin-left: 10px;
	text-alin:center;
}
</style>
</head>
<body>
<jsp:include page="../topBar.jsp" />
<div id="outter">
	<div class="infoTb">
	<h2>관리자 페이지</h2>
	<hr style="margin-bottom: 50px;">
	<table style="border-collapse: collapse;">
		<tr>
			<th>
				번호
			</th>
			<th>
				아이디
			</th>
			<th>
				충전포인트
			</th>
			<th>
				날짜
			</th>
			<th>
				결과
			</th>
		</tr>
		<c:forEach var="l" items="${list }" varStatus="num">
			<tr>
				<td>
					${l.idx }
					<input type="hidden" id="idx${num.index}" value="${l.idx }">
				</td>
				<td>
					${l.id }
					<input type="hidden" id="id${num.index}" value="${l.id }">
				</td>
				<td>
					${l.point }
					<input type="hidden" id="point${num.index}" value="${l.point }">
				</td>
				<td>
					<fmt:formatDate value="${l.regdate }" pattern="yy/MM/dd HH:mm"/>
					
				</td>
				<td>
					<c:if test="${l.result == 0 }">
						<button type="button" class="w-btn w-btn-blue" onclick="chargePoint('${num.index}')">충전 승인</button>
					</c:if>
					<c:if test="${l.result == 1 }">
						<p style="color: red;">충전 완료</p>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" style="text-align: center;">
				<c:if test="${startPage != 1 }">
					<a href="userChargeList?num=${startPage-5 }">
					<<
					</a>
				</c:if>
				<c:forEach begin="${startPage }" end="${endPage }" varStatus="page">
					<a href="userChargeList?num=${page.index }">${page.index }</a>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
					<a href="userChargeList?num=${startPage+5 }">>></a>
				</c:if>
			</td>
		</tr>
	</table>
	</div>
</div>
<jsp:include page="../bottomBar.jsp"/>
<script type="text/javascript">
	function chargePoint(num){
		alert(num);
		let idx = $('#idx'+num).val();
		let id = $('#id'+num).val();
		let point = $('#point'+num).val();
		$.ajax({
			type:"post",
			url:"chargePoint",
			datatype:"text",
			data:{
				idx:idx,
				email:id,
				point:point
			},
			success:function(data){
				if(data == 'success'){
					alert('충전 완료되었습니다.');
					location.href='userChargeList';
				}else if(data == '' || data == null){
					alert('충전 실패하였습니다.');
				}else if(data == 'already'){
					alert('이미 충전된 항목입니다.');
				}
			}
		});
	}
</script>
</body>
</html>