<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
</head>
<body>
<img id="error" style="width:100%; height:100%;" src="/resources/CommonImg/error.png">
 <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>

$("#error").ready(function() {
	var confirmflag =confirm("Error! 메인으로 돌아갑니다. ");
	if(confirmflag){

		location.href="/";

	 }else{
		 return;
	 }
});

</script>

</body>
</html>