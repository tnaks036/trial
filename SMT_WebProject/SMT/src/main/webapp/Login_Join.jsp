<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>	
<link rel="stylesheet" type="text/css" href="css/Login_Join.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href='https://fonts.googleapis.com/css?family=Roboto:500,900,100,300,700,400' rel='stylesheet' type='text/css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<meta charset="UTF-8">
<title>Login_Join</title>

</head>
<body>
<%@ include file = "../../../header.jsp" %>
<div id="container" class="container">
		<!-- FORM SECTION -->
		<div class="row">
			<!-- SIGN UP -->
			<div class="col align-items-center flex-col sign-up">
				<div class="form-wrapper align-items-center">
					<div class="form sign-up">
						<div class="input-group">
							<i class='bx bxs-user'></i>
							<input type="text" placeholder="User_ID">
							<!-- <input type="button" value="중복확인" > -->
						</div>
						<div class="input-group">
							<i class='bx bx-mail-send'></i>
							<input type="email" placeholder="User_PW">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i>
							<input type="password" placeholder="Phne_Num">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i>
							<input type="password" placeholder="Corp_Name">
						</div>
						<button>
							Sign up
						</button>
						<p>
							<span>
								Already have an account?
							</span>
							<b onclick="toggle()" class="pointer">
								Sign in here
							</b>
						</p>
					</div>
				</div>
			
			</div>
			<!-- END SIGN UP -->
			<!-- SIGN IN -->
			<div class="col align-items-center flex-col sign-in">
				<div class="form-wrapper align-items-center">
					<div class="form sign-in">
						<div class="input-group">
							<i class='bx bxs-user'></i>
							<input type="text" placeholder="User_ID">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i>
							<input type="password" placeholder="Usper_PW">
						</div>
						<button>
							Sign in
						</button>
						<p>
							<b>
								Forgot password?
							</b>
						</p>
						<p>
							<span>
								Don't have an account?
							</span>
							<b onclick="toggle()" class="pointer">
								Sign up here
							</b>
						</p>
					</div>
				</div>
				<div class="form-wrapper">
				</div>
			</div>
			<!-- END SIGN IN -->
		</div>
		<!-- END FORM SECTION -->
		<!-- CONTENT SECTION -->
		<div class="row content-row">
			<!-- SIGN IN CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="text sign-in">
					<h2>
						Welcome
					</h2>
	
				</div>
				<div class="img sign-in">
		
				</div>
			</div>
			<!-- END SIGN IN CONTENT -->
			<!-- SIGN UP CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="img sign-up">
				
				</div>
				<div class="text sign-up">
					<h2>
						Join with us
					</h2>
	
				</div>
			</div>
			<!-- END SIGN UP CONTENT -->
		</div>
		<!-- END CONTENT SECTION -->
	</div>
	<script>
	 let container = document.getElementById('container')

	 toggle = () => {
	 	container.classList.toggle('sign-in')
	 	container.classList.toggle('sign-up')
	 }

	 setTimeout(() => {
	 	container.classList.add('sign-in')
	 }, 200)	
	</script>
	<!-- ajax -->
	<script src="js/board.js"></script>	
	
</body>
</html>