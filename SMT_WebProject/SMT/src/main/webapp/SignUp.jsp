		<%@ page language="java" contentType="text/html; charset=UTF-8"
		    pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>
		<head>	
		<link rel="stylesheet" type="text/css" href="css/SignUp_Login.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<link href='https://fonts.googleapis.com/css?family=Roboto:500,900,100,300,700,400' rel='stylesheet' type='text/css'>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		    <title>User Signup</title>
		</head>
		<body>
		    <main id="main-holder">
			    <h1 id="login-header">SignIn</h1>	
			    	    
			    <div id="login-error-msg-holder">
			      <p id="login-error-msg">Invalid username <span id="error-msg-second-line">and/or password</span></p>
		    </div>
			
			<form id="login-form" method="post" action ="/SignupServlet" >
				<input type="text" name="user_ID" id="id" class="login-form-field" placeholder="ID">
				
				<input type="password" name="user_PW" id="pw" class="login-form-field" placeholder="Password" 
				onchange="check_PW()">&nbsp;<span style="color:cadetblue">보안성</span><progress id="pw_pro" value="0" max="3">
																</progress>&nbsp;<span id="pw_pro_label"></span>
				<input type="password" name="user_PW2" id="pw2" class="login-form-field" placeholder="Check Password"
				onchange="check_PW()">&nbsp;<span id="check"></span>
				
				<input type="text" name="phone_Num" id="pn" class="login-form-field" placeholder="Phone Number" 
				oninput="phoneFormat()" autocomplete=off> 
				
				<input type="text" name="corp_Name" id="cn" class="login-form-field" placeholder="Company name" > 
				<input type="submit" id="btn" value="Login" id="login-form-submit">
				
				<button type="button" class="btn" onClick="getSignUpList()">버튼</button>
			</form>
		    <!--  -->
		    </main>
		    <script defer src="/SMT/js/SignUp.js"></script>
		    <script> 
		    $(document).ready(function() {
		    	console.log("잘 작동함")
		    
		    });
		    
		    function getSignUpList(){
		    	
		    	 var user_ID = $("#id").val();
		         var user_PW = $("#pw").val();
		         var phone_Num = phoneFormat($("#pn").val()); // 전화번호를 규격화
		         var corp_Name = $("#cn").val();
		         console.log(user_ID);
		         console.log(user_PW);
		         console.log(phone_Num);
		         console.log(corp_Name);
		
		         $.ajax({
		             type: "POST",
		             url: "updateSignUp", 
		             data: {
		                 "user_ID" : user_ID,
		                 "user_PW" : user_PW,
		                 "phone_Num" : phone_Num,
		                 "corp_Name" : corp_Name
		             },
		             contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		             success: function(response) {
		                 // 서버 응답을 처리하는 코드
		                 console.log(response); // 예: "currentPageCounter 업데이트 성공"
		             },
		             error: function(xhr, status, error) {
		                 // 오류 처리
		                 console.error("AJAX 오류 발생: " + error);
		             }
		         });
		    }
		
			    
			////// PhoneNum Function	 	    
			function phoneFormat(pn) {
		    	const phoneNumber = $("#pn").val();
		    	const value = phoneNumber.replace(/[^0-9]/g, ''); // 특수문자 제거
		    	
		
		    	return value;
		}
			    
			    	    
			    
			////// Sign Up Function
			    function check_PW(){
			  		 
			  		 var pw = document.getElementById('pw').value;
			  		 var SC = ["!","@","#","$","%"];
			         var check_SC = 0;
			  		 
			           if(pw.length<4||pw.length>16){
			          	 window.alert('비밀번호는 4글자 이상, 16글자 이하만 사용 가능합니다.');
			          	 document.getElementById('user_PW').value = "";
			           }
			           for(var i=0;i<SC.length;i++){
			               if(pw.indexOf(SC[i]) != -1){
			                   check_SC = 1;
			               }
			           }
			           if(check_SC == 0){
			               window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
			               document.getElementById('pw').innerHTML = '비밀번호에 !,@,#,$,% 의 특수문자를 포함시켜야 합니다.'
			           }
			           if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
			               if(document.getElementById('pw').value==document.getElementById('pw2').value){
			                   document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
			                   document.getElementById('check').style.color='blue';
			               }
			               else{
			                   document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
			                   document.getElementById('check').style.color='red';
			               }
			           }
			       }
			    	
				// AJAX를 사용하여 회원가입 처리
				
				    const signupForm = document.getElementById("login-form");
			    signupForm.addEventListener("submit", function (event) {
			        event.preventDefault();
		
			        const user_ID = document.getElementById("username-field").value;
			        const user_PW = document.getElementById("password-field").value;
			        const user_PW2 = document.getElementById("password-field2").value;
			        const phone_Num = document.getElementById("phonenumber-field").value;
			        const corp_Name = document.getElementById("Corpname-field").value;
		
			        // FormData 객체를 사용하여 데이터 전송
			        const formData = new FormData();
			        formData.append("user_ID", user_ID);
			        formData.append("user_PW", user_PW);
			        formData.append("user_PW2", user_PW2);
			        formData.append("phone_Num", phone_Num);
			        formData.append("corp_Name", corp_Name);
		
			        // AJAX 요청 보내기
			        const xhr = new XMLHttpRequest();
			        xhr.open("POST", "/SignupServlet", true);
			        xhr.onreadystatechange = function () {
			            if (xhr.readyState === 4 && xhr.status === 200) {
			                const response = xhr.responseText;
			                if (response === "success") {
			                    // 회원가입 성공
			                    alert("회원가입에 성공했습니다.");
			                    window.location.href = "SignUp.jsp"; // 원하는 페이지로 리다이렉트
			                } else {
			                    // 회원가입 실패
			                    alert("회원가입에 실패했습니다. " + response);
			                }
			            }
			        };
			        xhr.send(formData);
			    });
			    
		    </script>
		</body>
		</html>