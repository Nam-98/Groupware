<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- 아이콘 fontawesome -->
    <script src="https://kit.fontawesome.com/b1e233372d.js"></script>
   <!-- VENDOR CSS -->
   <link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.min.css">
   <link rel="stylesheet" href="/assets/vendor/font-awesome/css/font-awesome.min.css">
   <link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
   <link rel="stylesheet" href="/assets/vendor/chartist/css/chartist-custom.css">
   <!-- MAIN CSS -->
   <link rel="stylesheet" href="/assets/css/main.css">
   <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
   <link rel="stylesheet" href="/assets/css/demo.css">
   <!-- GOOGLE FONTS -->
   <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
   <!-- ICONS -->
   <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/assets/img/favicon.png">
    <script src="/assets/vendor/jquery/jquery.min.js"></script>
   <script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
   <script src="/assets/vendor/chartist/js/chartist.min.js"></script>
   <script src="/assets/scripts/klorofil-common.js"></script>
<meta charset="UTF-8">
<title>일정 추가하기</title>
<style>
    *{box-sizing: border-box}

	.top-vacant {
		width: 100%;
		height: 20px;
	}
	.textContents{
		width:100%;
	}
	.button-box {
	text-align: right;
	}
	.button-box {
	text-align: right;
	}
	#sch_contents{
		width: 100%;
		height:100px;
	}
</style>
</head>
<body>
<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">일정 추가하기</h3>					
					</div>
					<div class="top-vacant d-none d-lg-block"></div>

					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">일 정 추 가 하 기</h3>
						</div>
						<div class="panel-body">
							<form action="/schedule/addSchedule.schedule"  method="post">
								<div class="col-lg-12 col-12">
									<table class="table table-sm">
										<thead>
											<tr class="table-secondary">
												<th scope="col">제 목</th>
												<th scope="col">내 용</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">일 정 명</th><input type="hidden" name="sch_id" value="${sessionScope.id }">
												<td><input type="text" class="textContents" name="sch_title" required placeholder="일정명을 입력하세요."></td>
											</tr>
											<tr>
												<th scope="row">일 정 내 용</th>
												<td><textarea id="sch_contents" name="sch_contents" placeholder="일정을 입력하세요." required></textarea></td>
											</tr>
											<tr>
												<th scope="row">일 자</th>
												<td>
												시작 일자 : &nbsp<input required type="date" id="date3" name="sch_start_date_sc" size="12"/>&nbsp&nbsp&nbsp
												<select id="hour" name="condition">
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
												</select>시
												<select id="min" name="condition2">
													<option value="00">00</option>
													<option value="10">10</option>
													<option value="20">20</option>
													<option value="30">30</option>
													<option value="40">40</option>
													<option value="50">50</option>
												</select>분 <br><br>
												
												종료 일자 : &nbsp<input type="date" id="date2" name="sch_end_date_sc" size="12"/>&nbsp&nbsp&nbsp
												<select id="hour2" name="condition3">
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
												</select>시
												<select id="min2" name="condition4">
													<option value="00">00</option>
													<option value="10">10</option>
													<option value="20">20</option>
													<option value="30">30</option>
													<option value="40">40</option>
													<option value="50">50</option>
												</select>분 
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="button-box">
									<input type="submit" id="addsubmit" class="btn btn-primary" value="등록">&nbsp
									<button type="button" id="addCancel" class="btn btn-secondary">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<script>
				document.getElementById("addsubmit").onsubmit=function(){
					alert("등록되었습니다.");

				}
				document.getElementById("addCancel").onclick=function(){
					window.close();
				}
			</script>
			
			<script></script>
</body>
</html>