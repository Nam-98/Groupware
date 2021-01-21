<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</head>
<style>
	*{
        box-sizing: border-box;
        border: 1px solid black;
        margin: 0px;
        padding: 0px;	
	}
	
	.wholecontainer{
		width: 1280px;
		height:720px;
	}
	
	.right-side{
		width: 1020px;
		height: 720px;
		position : fixed;
		top : 0px;
		left: 260px;
	}
	.top-vacant{
		width: 1020px;
		height: 20px;
		background-color : yellow;
	}
	.page-name{
		width: 510px;
		height: 50px;
		float : left;
	}
</style>
<body>
	<div class ="wholecontainer">
		<div class = "left-side"><jsp:include page="/WEB-INF/views/commonPage/left.jsp" />
		</div>
		<div class = "right-side">
			<div class = "top-vacant"></div>
			<div class = "page-name"><h1>My page</h1></div>
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
			<div class ="maincontainer">
			</div>
		</div>
	</div>
</body>
</html>