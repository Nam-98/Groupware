<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 Template</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link href="/resources/lib/summernote-ext-table/plugin/table/summernote-ext-table.css" rel="stylesheet" type="text/css">
<script src="/resources/lib/summernote-ext-table/plugin/table/summernote-ext-table.js"></script>
</head>
<body>
<textarea class="summernote"  ></textarea>
<script>
	function getContents(){
		return $('.summernote').summernote('code');
	}
	function setContents(str){
		$('.summernote').summernote('code', '');
		$('.summernote').summernote('code', str);
	}
	$(document).ready(function() {
		//여기 아래 부분
		$('.summernote').summernote({
			height : 600, // 에디터 높이
			minHeight : 300, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			toolbar: [
					// [groupName, [list of button]]
					['fontname', ['fontname']],
					['fontsize', ['fontsize']],
					['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
					['color', ['forecolor','color']],
					['insert', ['hr', 'link', 'picture']],
			         ['table', ['table']],
					['para', ['ul', 'ol', 'paragraph']],
					['height', ['height']],
					['paperSize',['paperSize']],
					['view', ['help']]
				  	],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			popover: {
	            table: [
	                ['merge', ['jMerge']],
	                ['style', ['jBackcolor', 'jBorderColor', 'jAlign', 'jAddDeleteRowCol']],
	                ['info', ['jTableInfo']],
	                ['delete', ['jWidthHeightReset', 'deleteTable']],
	            ]
	        },
	        jTable : {
	            /**
	             * drag || dialog
	             */
	            mergeMode: 'drag'
	        }
		});
	});
</script>
</body>
</html>