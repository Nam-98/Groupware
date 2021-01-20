<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<style>
	*{border: 1px solid black;
        box-sizing: border-box;       
         margin: auto;	
	}
	
	.wholecontainer{
       
		width: 1280px;
		height:720px;
	}
	.left-side{
		
		width: 255px;
		height: 720px;
		float: left;
	}
	
	.right-side{
		width: 1020px;
		height: 720px;
		float: left;
	}
	.top-vacant{
		width: 1020px;
		height: 20px;
		background-color : yellow;
	}
	.page-name{
		width: 100%;;
		height: 50px;
		float : left;
	}
    .maincontainer{
        width: 100%;
        height: 700px;
    }
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
    .sec1{
    width: 100%;
    height: 25%;
    }
    .img{
        width: 20%;
        height: 100%;
        float: left
    }
    .info{
        width: 80%;
        height: 100%;
        float: left;
    }
.sec2{
    width: 100%;
    height: 75%;
    }
    .infoSec{
        width: 100%;
        height: 33.3%;
    }
    .namebox{
        width: 25%;
        height: 100%;
        float: left;
        text-align: center;
        line-height: 50px;
    }
    .inputbox{
        width: 75%;
        height: 100%;
        float: left;
        text-align: center;
        line-height: 50px;
    }
    .infoSec2{
        width: 100%;
        height: 12%;
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
	<div class ="wholecontainer">
		<div class = "left-side">
		<jsp:include page="/WEB-INF/views/commonPage/left.jsp" />
		</div>
		<div class = "right-side">
			<div class = "top-vacant">
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
			</div>
			<div class = "page-name"><h1>조직도</h1></div>
			<div class ="maincontainer">
			    <div class="orgTree">
			        <ul id="myUL1">
			<c:forEach items="${mlist }" var="i">			
			<li><span class="caret1">${i.dept_name}</span>
				"
				<ul class="nested1">				
					<li>${i.name }</li>				
				</ul></li>			
			</c:forEach>				
			</ul>
			    </div>
			    <div class="orgInfo">
			    	 <div class="sec1">
			            <div class="img"></div>
			            <div class="info">
			                <div class="infoSec">
			                    <div class="namebox"><b>I D :</b></div>
			                    <div class="inputbox"></div>
			                </div>
			                <div class="infoSec">
			                    <div class="namebox"><b>성 명 :</b></div>
			                    <div class="inputbox"></div>
			                </div>
			                <div class="infoSec">
			                    <div class="namebox"><b>생년월일 :</b></div>
			                    <div class="inputbox"></div>
			                </div>
			            </div>
			        </div>
			        <div class="sec2">
			            <div class="infoSec2">
			                <div class="namebox"><b>직 급 :</b></div>
			                 <div class="inputbox"></div>
			            </div>
			            <div class="infoSec2">
			                <div class="namebox"><b>부 서 :</b></div>
			                 <div class="inputbox"></div>
			            </div>
			            <div class="infoSec2">
			                <div class="namebox"><b>연락처 :</b></div>
			                 <div class="inputbox"></div>
			            </div>
			            <div class="infoSec2">
			                <div class="namebox"><b>회사번호 :</b></div>
			                 <div class="inputbox"></div>
			            </div>
			            <div class="infoSec2">
			                <div class="namebox"><b>우편번호 :</b></div>
			                 <div class="inputbox"></div>
			            </div>
			            <div class="infoSec2">
			                <div class="namebox"><b>주 소 :</b></div>
			                 <div class="inputbox"></div>
			            </div>
			            <div class="infoSec2">
			                <div class="namebox"><b>입사일 :</b></div>
			                 <div class="inputbox"></div>
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	</div>
</body>
<script>
var toggler = document.getElementsByClassName("caret1");
var i;

for (i = 0; i < toggler.length; i++) {
  toggler[i].addEventListener("click", function() {
    this.parentElement.querySelector(".nested1").classList.toggle("active1");
    this.classList.toggle("caret-down1");
  });
}
</script>
</html>