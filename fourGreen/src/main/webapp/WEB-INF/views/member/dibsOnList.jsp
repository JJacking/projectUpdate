<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style type="text/css">
#wrapper{
	border: 1px solid black;
	width: 535px; 
	height: 581px;
} 
table{
	width:100%;
	border-collapse: collapse;
}
tr{
	border-bottom:1px solid black;
	text-align:center;
	width: 100%;
	height: 50px;
} 
.w-btn{ 
	width:50px;
	height:35px;
	border: none;
	border-radius:5px;
	text-alin:center;
}
.w-btn:hover{ 
	cursor: pointer;
	background-color: #6aafe6;
    color: #d4dfe6;
}
.w-btn-blue {
    background-color: #6aafe6;
    color: #d4dfe6;
}
</style>
</head>
<body>
<div id="wrapper">
	<table>
		<c:if test="${empty dibsOnList }">
			<tr>
				<td colspan="2" style="text-align: center;">
					등록된 관심물품이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="dibsOn" items="${dibsOnList }" varStatus="d">
			<tr id="dibsOn${d.index }">
				<td style="width: 60px;">
					${d.count }
				</td>
				<td>
					<a href="/auction/product/selectOne?num=${dibsOn.num}" target="_blank">
						${dibsOn.title }
					</a>
				</td>
				<td style="width: 60px;">
					<button class="w-btn w-btn-blue" type="button" onclick="deleteDibsOn('${d.index }','${dibsOn.idx }')">삭제</button>
				</td>
			</tr>		
		</c:forEach>
	</table>
</div>
<button type="button" onclick="window.close()" style="position:absolute; top: 560px; left: 250px;">닫기</button>
<script type="text/javascript">
 function deleteDibsOn(num,idx){
	 $.ajax({
		 type:"post",
		 url:"deleteDibsOn",
		 datatype:"text",
		 data:{
			 idx:idx
		 },
		 success:function(data){
			 if(data == '1'){
				 alert('관심목록에서 삭제되었습니다.');
				 location.href='dibsOnList';
			 }else {
				 alert('관심목록 삭제에 실패했습니다. 다시 시도해주세요.');
			 }
		 }
	 });
 }
</script>
</body>
</html>