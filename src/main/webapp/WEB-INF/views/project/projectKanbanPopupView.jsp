<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.pro_seq}</title>
</head>
<body>
<input type ="text" value="${dto.pro_kb_seq}"><br>
${dto.pro_seq}<br>
${dto.pro_kb_process_code}<br>
${dto.pro_kb_title}<br>
${dto.pro_kb_details}<br>
${dto.pro_kb_manager}
</body>
</html>