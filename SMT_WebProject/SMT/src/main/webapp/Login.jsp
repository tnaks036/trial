<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>	
<link rel="stylesheet" type="text/css" href="css/SignUp_Login.css">
<script defer src="SignUp.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href='https://fonts.googleapis.com/css?family=Roboto:500,900,100,300,700,400' rel='stylesheet' type='text/css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<meta charset="UTF-8">
<title>User Login</title>
</head>
<body>
	<main id="main-holder">
    <h1 id="login-header">Login</h1>
   
    <div id="login-error-msg-holder">
      <p id="login-error-msg">Invalid username <span id="error-msg-second-line">and/or password</span></p>
    </div>
    
    <form id="login-form" method="post" action="/LoginServlet">    <!-- action을 서블릿 URL로 설정 -->
		<input type="text" name="user_ID" id="username-field" class="login-form-field" placeholder="ID" 
		onchange="login()"> 
		<input type="password" name="user_PW" id="password-field" class="login-form-field" placeholder="Password" 
		onchange="login()">
		<input type="submit" value="Login" id="login-form-submit"> <!-- type을 submit으로 변경 -->
	</form>
  
    <button onclick="window.location.href='/SignUp.jsp'" id="login-form-submit">회원가입</button>
	<button onclick="" id="login-form-submit">비밀번호 찾기</button>
</body>
<script type="text/javascript"> 
	function login() {
	    var f = document.signupForm;
	
	    if (!f.user_ID.value) {
	        alert("아이디를 입력하세요.");
	        f.user_ID.focus();
	        return;
	    }
	
	    if (!f.user_PW.value) {
	        alert("패스워드를 입력하세요.");
	        f.user_PW.focus();
	        return;
	    }
	
	    f.action = "index.jsp";
	    f.submit();
	}
     const loginForm = document.getElementById("login-form");
     const loginButton = document.getElementById("login-form-submit");
     const loginErrorMsg = document.getElementById("login-error-msg");

     loginButton.addEventListener("click", (event) => {
         event.preventDefault();
         const user_ID = loginForm.user_ID.value;
         const user_PW = loginForm.user_PW.value;

         if (user_ID  === "user_ID" && user_PW === "user_PW") {
             alert("You have successfully logged in.");
             location.reload();
         } else {
             loginErrorMsg.style.opacity = 1;
         }
     });
</script>
</html>