<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>
<head>

<title>TaskFlow Pro - Register</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:linear-gradient(135deg,#11998e,#38ef7d);
}

.register-card{
width:500px;
padding:35px;
background:white;
border-radius:20px;
box-shadow:0px 10px 30px rgba(0,0,0,0.2);
}

.logo{
font-size:30px;
font-weight:bold;
text-align:center;
color:#11998e;
margin-bottom:15px;
}

#strength{
font-weight:bold;
margin-top:5px;
}
label{
    font-weight: 700;
    color: #222;
    font-size: 15px;
    margin-bottom: 6px;
    display: block;
}
.form-control{
    border: 2px solid #d1d5db;
    border-radius: 8px;
    padding: 10px;
}

.form-control:focus{
    border-color: #14b8a6;
    box-shadow: 0 0 8px rgba(20,184,166,0.3);
}
</style>

</head>

<body>

<div class="register-card">

<div class="logo">
Create Account
</div>

<form action="/saveUser" method="post">
<div class="mb-3">

<label class="form-label fw-bold text-dark">
    Name
</label>


<input type="text"
id="name"
name="name"
class="form-control"
required
pattern="^[A-Z][a-zA-Z ]*$"
title="Name must start with a Capital Letter"
onkeyup="checkName()">

<div id="nameValidation"></div>

</div>

<div class="mb-3">
<label class="form-label fw-bold text-dark">
    Email
</label>
<input type="email"
name="email"
class="form-control"
required>
</div>

<div class="mb-3">

<label class="form-label fw-bold text-dark">
    Password
</label>
<div class="input-group">

<input type="password"
id="password"
name="password"
class="form-control"
required
pattern="^(?=.*[0-9])(?=.*[!@#$%^&*])[A-Z].{5,}$"
title="Password must start with a capital letter, contain at least 5 characters, one number and one special character."
onkeyup="checkStrength()">

<button type="button"
class="btn btn-outline-secondary"
onclick="togglePassword()">

👁

</button>

</div>

<div id="strength"></div>

<small class="text-muted">

Password must:

<ul>
<li>Start with a Capital Letter</li>
<li>Contain at least 5 characters</li>
<li>Contain at least one number</li>
<li>Contain at least one special character</li>
</ul>
<button type="submit"
        class="btn btn-primary w-100">
    Register
</button>

<div class="text-center mt-3">

    <p>
        Already have an account?

        <a href="/login">
            Sign In
        </a>
    </p>

</div>

</small>

</div>

<script>
function checkName(){

	let name =
	document.getElementById("name").value;

	let validation =
	document.getElementById("nameValidation");

	let firstCapital =
	/^[A-Z]/.test(name);

	if(name.length == 0){

	validation.innerHTML = "";

	}
	else if(!firstCapital){

	validation.innerHTML =
	" Name must start with a Capital Letter";

	validation.style.color="red";

	}
	else{

	validation.innerHTML =
	"Valid Name";

	validation.style.color="green";

	}

	}
function checkStrength(){

let password =
document.getElementById("password").value;

let strength =
document.getElementById("strength");

let firstCapital =
/^[A-Z]/.test(password);

let hasNumber =
/[0-9]/.test(password);

let hasSpecial =
/[!@#$%^&*(),.?":{}|<>]/.test(password);

if(password.length < 5){

strength.innerHTML =
" Minimum 5 characters";

strength.style.color="red";

}
else if(!firstCapital){

strength.innerHTML =
" First letter must be Capital";

strength.style.color="red";

}
else if(!hasNumber){

strength.innerHTML =
" Add at least one number";

strength.style.color="orange";

}
else if(!hasSpecial){

strength.innerHTML =
" Add at least one special character";

strength.style.color="orange";

}
else{

strength.innerHTML =
" Strong Password";

strength.style.color="green";

}

}

function togglePassword(){

let password =
document.getElementById("password");

if(password.type === "password"){

password.type = "text";

}
else{

password.type = "password";

}

}

</script>

</body>
</html>
