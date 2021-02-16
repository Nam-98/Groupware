<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 Template</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <style>
    </style>
</head>
<body>
<textarea class="summernote"  ></textarea>
<jsp:include page="/WEB-INF/views/commonPage/summernote-plugin.jsp" />
<script>
	function getContents(){
		return $('.summernote').summernote('code');
	}
	function setContents(str){
		$('.summernote').summernote('code', str);

	}
</script>
</body>
</html>