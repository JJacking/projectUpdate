<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<jsp:include page="../topBar.jsp" />
	<c:forEach var="dibsOn" items="${dibsOnList }" varStatus="d">
		<tr>
			<td>
				${d.count }
				<input type="hidden" id="" value="">
			</td>
			<td>
				${dibsOn.title }
			</td>
			<td>
				<button type="button" onclick="delete('${d.index}','${dibsOn.idx }')">삭제</button>
			</td>
		</tr>		
	</c:forEach>
</table>
<jsp:include page="../bottomBar.jsp"/>
</body>
</html>