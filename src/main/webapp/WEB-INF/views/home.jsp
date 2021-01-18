<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>



	<input type="button" value="출퇴근페이지로 이동" id="tnaNexacro">
	
	<script>
		$('#tnaNexacro').on('click', function(){
			location.href="/tna/tnaNexacro.tna";
		})
	</script>


</body>
</html>
