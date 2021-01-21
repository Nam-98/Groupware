<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
</head>

<style>
html, body {
	background-image:
		url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	height: 100%;
	font-family: 'Numans', sans-serif;
}

.container {
	height: 100%;
	align-content: center;
}

.card {
	height: 370px;
	margin-top: auto;
	margin-bottom: auto;
	width: 400px;
	background-color: rgba(0, 0, 0, 0.5) !important;
	margin-bottom: auto;
}

.card-header h3 {
	color: white;
}

.remember {
	color: white;
}

.remember input {
	width: 20px;
	height: 20px;
	margin-left: 15px;
	margin-right: 5px;
}

.login_btn {
	color: black;
	background-color: #FFC312;
	width: 100px;
}

.login_btn:hover {
	color: black;
	background-color: white;
}
</style>

<body>
	<form action="/member/login.member" method=post>
		<div class="container">
			<div class="card">
				<div class="card-header">
					<h3>Login Box</h3>
				</div>
				<div class="card-body">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput"
							name='id' placeholder="ID"> <label for="floatingInput">ID</label>
					</div>
					<div class="form-floating">
						<input type="password" class="form-control" id="floatingPassword"
							name='password' placeholder="PASSWORD"> <label
							for="floatingPassword">Password</label>
					</div>
					<br>
					<div class="col-12">
						<div class="form-check align-items-center remember">
							<input class="form-check-input" type="checkbox" id="gridCheck">
							<label class="form-check-label" for="gridCheck"> Remember
								Me </label>
						</div>
					</div>
					<br>
					<div class="col-12">
						<button type="submit" class="btn float-right login_btn">Sign
							in</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script>
		$(document).ready(function() {

			var key = getCookie("key");
			$("#floatingInput").val(key);
			console.log("id : " + $("#floatingInput").val());

			if ($("#floatingInput").val() != "") {
				$("#gridCheck").attr("checked", true);
			}

			$("#gridCheck").change(function() {
				if ($("#gridCheck").is(":checked")) {
					setCookie("key", $("#floatingInput").val(), 7);
				} else {
					deleteCookie("key");
				}
			});

			$("#floatingInput").keyup(function() {
				if ($("#gridCheck").is(":checked")) {
					setCookie("key", $("#floatingInput").val(), 7);
				}
			});
		});
	</script>
	<script>
		function setCookie(cookieName, value, exdays) {
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value)
					+ ((exdays == null) ? "" : "; expires="
							+ exdate.toGMTString());
			document.cookie = cookieName + "=" + cookieValue;
		}

		function deleteCookie(cookieName) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires="
					+ expireDate.toGMTString();
		}

		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) {
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
	</script>
</body>
</html>