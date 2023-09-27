
///Login Function 
  function onClick() {
    const value = pannel.value;
    console.log(value);
    if (value !== "1") {
      header.innerHTML = "Welcome Back!";
      span.innerHTML =
        "To keep connected with us please login<br/>with your personal info<br/>";
      btn.innerHTML = "SIGN IN";
      pannel.classList.remove("moveControl");
      signup.classList.remove("toLeft");
      signin.classList.add("toRight");
      pannel.style.backgroundImage = `url("static/img/Shopping.png")`;
      pannel.value = "1";
    } else {
      header.innerHTML = "Hello, Friend!";
      span.innerHTML =
        "Enter your personal details and start<br/>journey with us!<br/>";
      btn.innerHTML = "SIGN UP";
      pannel.classList.add("moveControl");
      signin.classList.remove("toRight");
      signup.classList.add("toLeft");
      pannel.style.backgroundImage = `url("static/img/ProductLaunch.png")`;
      pannel.value = "0";
    }
  }
  
  btn.addEventListener("click", onClick);
  
  
  