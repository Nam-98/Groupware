<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${result == 1}">
			<script>
				alert("쪽지가 전송되었습니다.");
				location.href="/message/writeMsg.message";
			</script>
		</c:when>
	</c:choose>
</body>
</html>