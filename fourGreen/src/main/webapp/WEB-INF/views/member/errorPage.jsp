<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../topBar.jsp" />
	<script type="text/javascript">
		alert('유효하지 않은 주소입니다. 다시 진행해주세요.');
		history.back();
	</script>
</body>
</html>