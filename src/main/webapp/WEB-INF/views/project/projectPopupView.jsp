<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<style>
<style>
    .orgTree{
        width: 20%;
        height: 650px;
        float: left;
    }
    .orgInfo{
        width: 80%;
        height: 650px;
        float: left;
    }
    
    li>a{
    	color: black;
   text-decoration: none;
    }
    /* Remove default bullets */
ul, #myUL1 {
	list-style-type: none;
}

/* Remove margins and padding from the parent ul */
#myUL1 {
	
    margin: 0;
	padding: 0;
	position: fixed;
    width: 200px;
    height: 100%;
}

/* Style the caret/arrow */
.caret1 {
	cursor: pointer;
	user-select: none; /* Prevent text selection */
}

/* Create the caret/arrow with a unicode, and style it */
.caret1::before {
	content: "\25B6";
	color: black;
	display: inline-block;
	margin-right: 6px;
}

/* Rotate the caret/arrow icon when clicked on (using JavaScript) */
.caret-down1::before {
	transform: rotate(90deg);
}

/* Hide the nested list */
.nested1 {
	display: none;
}

/* Show the nested list when the user clicks on the caret/arrow (with JavaScript) */
.active1 {
	display: block;
}
</style>
<body>
<input type="text" id="pmName" readonly>
<input type="text" id="pmId" readonly>
	<button id="returnButton">선택</button>
	<div class="orgTree">
		<ul id="myUL1">
			<c:forEach items="${dlist}" var="i">
				<li><span class="caret1">${i.dept_name}</span>

					<ul class="nested1">
						<c:forEach items="${mlist}" var="j">
							<c:if test="${j.dept_code == i.dept_code}">
								<li class ="memberList" id="${j.name}">${j.name}</li>
								<script>
								$("#${j.name}").on("click", function(){
									document.getElementById("pmName").value="${j.name}";
									document.getElementById("pmId").value="${j.id}";
								});
								</script>
							</c:if>
						</c:forEach>
					</ul></li>

			</c:forEach>
		</ul>
	</div>
</body>
<script>
var toggler = document.getElementsByClassName("caret1");
var i;

for (i = 0; i < toggler.length; i++) {
	console.log(toggler.length);
  toggler[i].addEventListener("click", function() {
    this.parentElement.querySelector(".nested1").classList.toggle("active1");
    this.classList.toggle("caret-down1");
  });
}
</script>

<script>
$('#returnButton').click(function() {
	  var returnValueName = document.getElementById('pmName').value;
	  var returnValueId = document.getElementById('pmId').value;
	  var returnValue = {
			  key1:returnValueName,
			  key2:returnValueId
	  };
	  
	  window.opener.getReturnValue(JSON.stringify(returnValue));
	  window.close();
	});
</script>
</html>