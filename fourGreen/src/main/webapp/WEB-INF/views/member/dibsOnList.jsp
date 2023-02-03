<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<table>
	<c:forEach var="dibsOn" items="${dibsOnList }" varStatus="d">
		<tr id="dibsOn${d.index }">
			<td>
				${d.count }
				<input type="hidden" id="" value="">
			</td>
			<td>
				${dibsOn.title }
			</td>
			<td>
				<button type="button" onclick="deleteDibsOn('${d.index }','${dibsOn.idx }')">삭제</button>
			</td>
		</tr>		
	</c:forEach>
</table>
<button type="button" onclick="window.close()" style="position: relative; bottom: -550px; left: 250px;">닫기</button>
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
				 document.getElementById('dibsOn'+num).remove();
				 alert('관심목록에서 삭제되었습니다.');
			 }else {
				 alert('관심목록 삭제에 실패했습니다. 다시 시도해주세요.');
			 }
		 }
	 });
 }
</script>
</body>
</html>