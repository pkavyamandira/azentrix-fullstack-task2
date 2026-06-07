<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>
<head>
<title>TaskFlow Pro - Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:linear-gradient(135deg,#667eea,#764ba2);
}

.login-card{
width:420px;
padding:35px;
border-radius:20px;
background:white;
box-shadow:0px 10px 30px rgba(0,0,0,0.2);
}

.logo{
font-size:30px;
font-weight:bold;
text-align:center;
margin-bottom:10px;
color:#764ba2;
}

.subtitle{
text-align:center;
color:gray;
margin-bottom:25px;
}

.btn-custom{
width:100%;
background:#764ba2;
color:white;
font-weight:bold;
}

.btn-custom:hover{
background:#5b3690;
color:white;
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

<div class="login-card">

<div class="logo">
TaskFlow Pro
</div>

<div class="subtitle">
Collaborate. Track. Deliver.
</div>

<form action="/loginUser" method="post">

<div class="mb-3">
<label class="form-label fw-bold text-dark">
    Email
</label><input type="email"
name="email"
class="form-control"
required>
</div>

<div class="mb-3">
<label class="form-label fw-bold text-dark">
    Password
</label><div style="position:relative; margin-bottom:15px;">
    <input type="password"
           id="password"
           name="password"
           class="form-control"
           required>

    <span onclick="togglePassword()"
          style="
          position:absolute;
          right:15px;
          top:50%;
          transform:translateY(-50%);
          cursor:pointer;
          font-size:18px;">
        👁️
    </span>

</div>

<button class="btn btn-custom">
Login
</button>

</form>

<div class="text-center mt-3">
<a href="/register">
Create New Account
</a>
</div>

<div class="text-center text-danger mt-2">
${msg}
</div>

</div>
<script>

function togglePassword(){

    let password =
        document.getElementById("password");

    if(password.type === "password"){

        password.type = "text";

    }else{

        password.type = "password";
    }
}

</script>
</body>
</html>
